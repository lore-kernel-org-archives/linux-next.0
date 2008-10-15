From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Wed, 15 Oct 2008 21:05:14 +1100
Message-ID: <20081015210514.d3b82dc8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44991 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752207AbYJOKoG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 06:44:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org

Hi David,

Today's linux-next merge of the creds tree got a conflict in
net/9p/client.c between commit a3f01212456501bfc94fea289aaaee26c28f9833
("9p: remove unnecessary prototypes") from the v9fs tree and commit
1ce149d4dcc74288936d347870d34b1781a49fad ("CRED: Wrap task credential
accesses in 9P2000 filesystem") from the creds tree.

The former moved the code that the latter was changing.  I fixed it up
(see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc net/9p/client.c
index 1807ace,aee892e..0000000
--- a/net/9p/client.c
+++ b/net/9p/client.c
@@@ -124,578 -124,20 +124,578 @@@ static int parse_opts(char *opts, struc
  	return ret;
  }
  
 +/**
 + * p9_tag_alloc - lookup/allocate a request by tag
 + * @c: client session to lookup tag within
 + * @tag: numeric id for transaction
 + *
 + * this is a simple array lookup, but will grow the
 + * request_slots as necessary to accomodate transaction
 + * ids which did not previously have a slot.
 + *
 + * this code relies on the client spinlock to manage locks, its
 + * possible we should switch to something else, but I'd rather
 + * stick with something low-overhead for the common case.
 + *
 + */
 +
 +static struct p9_req_t *p9_tag_alloc(struct p9_client *c, u16 tag)
 +{
 +	unsigned long flags;
 +	int row, col;
 +	struct p9_req_t *req;
 +
 +	/* This looks up the original request by tag so we know which
 +	 * buffer to read the data into */
 +	tag++;
 +
 +	if (tag >= c->max_tag) {
 +		spin_lock_irqsave(&c->lock, flags);
 +		/* check again since original check was outside of lock */
 +		while (tag >= c->max_tag) {
 +			row = (tag / P9_ROW_MAXTAG);
 +			c->reqs[row] = kcalloc(P9_ROW_MAXTAG,
 +					sizeof(struct p9_req_t), GFP_ATOMIC);
 +
 +			if (!c->reqs[row]) {
 +				printk(KERN_ERR "Couldn't grow tag array\n");
 +				return ERR_PTR(-ENOMEM);
 +			}
 +			for (col = 0; col < P9_ROW_MAXTAG; col++) {
 +				c->reqs[row][col].status = REQ_STATUS_IDLE;
 +				c->reqs[row][col].tc = NULL;
 +			}
 +			c->max_tag += P9_ROW_MAXTAG;
 +		}
 +		spin_unlock_irqrestore(&c->lock, flags);
 +	}
 +	row = tag / P9_ROW_MAXTAG;
 +	col = tag % P9_ROW_MAXTAG;
 +
 +	req = &c->reqs[row][col];
 +	if (!req->tc) {
 +		req->wq = kmalloc(sizeof(wait_queue_head_t), GFP_KERNEL);
 +		if (!req->wq) {
 +			printk(KERN_ERR "Couldn't grow tag array\n");
 +			return ERR_PTR(-ENOMEM);
 +		}
 +		init_waitqueue_head(req->wq);
 +		req->tc = kmalloc(sizeof(struct p9_fcall)+c->msize,
 +								GFP_KERNEL);
 +		req->rc = kmalloc(sizeof(struct p9_fcall)+c->msize,
 +								GFP_KERNEL);
 +		if ((!req->tc) || (!req->rc)) {
 +			printk(KERN_ERR "Couldn't grow tag array\n");
 +			kfree(req->tc);
 +			kfree(req->rc);
 +			return ERR_PTR(-ENOMEM);
 +		}
 +		req->tc->sdata = (char *) req->tc + sizeof(struct p9_fcall);
 +		req->tc->capacity = c->msize;
 +		req->rc->sdata = (char *) req->rc + sizeof(struct p9_fcall);
 +		req->rc->capacity = c->msize;
 +	}
 +
 +	p9pdu_reset(req->tc);
 +	p9pdu_reset(req->rc);
 +
 +	req->flush_tag = 0;
 +	req->tc->tag = tag-1;
 +	req->status = REQ_STATUS_ALLOC;
 +
 +	return &c->reqs[row][col];
 +}
 +
 +/**
 + * p9_tag_lookup - lookup a request by tag
 + * @c: client session to lookup tag within
 + * @tag: numeric id for transaction
 + *
 + */
 +
 +struct p9_req_t *p9_tag_lookup(struct p9_client *c, u16 tag)
 +{
 +	int row, col;
 +
 +	/* This looks up the original request by tag so we know which
 +	 * buffer to read the data into */
 +	tag++;
 +
 +	BUG_ON(tag >= c->max_tag);
 +
 +	row = tag / P9_ROW_MAXTAG;
 +	col = tag % P9_ROW_MAXTAG;
 +
 +	return &c->reqs[row][col];
 +}
 +EXPORT_SYMBOL(p9_tag_lookup);
 +
 +/**
 + * p9_tag_init - setup tags structure and contents
 + * @tags: tags structure from the client struct
 + *
 + * This initializes the tags structure for each client instance.
 + *
 + */
 +
 +static int p9_tag_init(struct p9_client *c)
 +{
 +	int err = 0;
 +
 +	c->tagpool = p9_idpool_create();
 +	if (IS_ERR(c->tagpool)) {
 +		err = PTR_ERR(c->tagpool);
 +		c->tagpool = NULL;
 +		goto error;
 +	}
 +
 +	p9_idpool_get(c->tagpool); /* reserve tag 0 */
 +
 +	c->max_tag = 0;
 +error:
 +	return err;
 +}
  
  /**
 - * p9_client_rpc - sends 9P request and waits until a response is available.
 - *      The function can be interrupted.
 - * @c: client data
 - * @tc: request to be sent
 - * @rc: pointer where a pointer to the response is stored
 + * p9_tag_cleanup - cleans up tags structure and reclaims resources
 + * @tags: tags structure from the client struct
 + *
 + * This frees resources associated with the tags structure
 + *
   */
 +static void p9_tag_cleanup(struct p9_client *c)
 +{
 +	int row, col;
 +
 +	/* check to insure all requests are idle */
 +	for (row = 0; row < (c->max_tag/P9_ROW_MAXTAG); row++) {
 +		for (col = 0; col < P9_ROW_MAXTAG; col++) {
 +			if (c->reqs[row][col].status != REQ_STATUS_IDLE) {
 +				P9_DPRINTK(P9_DEBUG_MUX,
 +				  "Attempting to cleanup non-free tag %d,%d\n",
 +				  row, col);
 +				/* TODO: delay execution of cleanup */
 +				return;
 +			}
 +		}
 +	}
 +
 +	if (c->tagpool)
 +		p9_idpool_destroy(c->tagpool);
 +
 +	/* free requests associated with tags */
 +	for (row = 0; row < (c->max_tag/P9_ROW_MAXTAG); row++) {
 +		for (col = 0; col < P9_ROW_MAXTAG; col++) {
 +			kfree(c->reqs[row][col].wq);
 +			kfree(c->reqs[row][col].tc);
 +			kfree(c->reqs[row][col].rc);
 +		}
 +		kfree(c->reqs[row]);
 +	}
 +	c->max_tag = 0;
 +}
 +
 +/**
 + * p9_free_req - free a request and clean-up as necessary
 + * c: client state
 + * r: request to release
 + *
 + */
 +
 +static void p9_free_req(struct p9_client *c, struct p9_req_t *r)
 +{
 +	int tag = r->tc->tag;
 +	P9_DPRINTK(P9_DEBUG_MUX, "clnt %p req %p tag: %d\n", c, r, tag);
 +
 +	r->status = REQ_STATUS_IDLE;
 +	if (tag != P9_NOTAG && p9_idpool_check(tag, c->tagpool))
 +		p9_idpool_put(tag, c->tagpool);
 +
 +	/* if this was a flush request we have to free response fcall */
 +	if (r->rc->id == P9_RFLUSH) {
 +		kfree(r->tc);
 +		kfree(r->rc);
 +	}
 +}
 +
 +/**
 + * p9_client_cb - call back from transport to client
 + * c: client state
 + * req: request received
 + *
 + */
 +void p9_client_cb(struct p9_client *c, struct p9_req_t *req)
 +{
 +	struct p9_req_t *other_req;
 +	unsigned long flags;
 +
 +	P9_DPRINTK(P9_DEBUG_MUX, " tag %d\n", req->tc->tag);
 +
 +	if (req->status == REQ_STATUS_ERROR)
 +		wake_up(req->wq);
 +
 +	if (req->flush_tag) { 			/* flush receive path */
 +		P9_DPRINTK(P9_DEBUG_9P, "<<< RFLUSH %d\n", req->tc->tag);
 +		spin_lock_irqsave(&c->lock, flags);
 +		other_req = p9_tag_lookup(c, req->flush_tag);
 +		if (other_req->status != REQ_STATUS_FLSH) /* stale flush */
 +			spin_unlock_irqrestore(&c->lock, flags);
 +		else {
 +			other_req->status = REQ_STATUS_FLSHD;
 +			spin_unlock_irqrestore(&c->lock, flags);
 +			wake_up(other_req->wq);
 +		}
 +		p9_free_req(c, req);
 +	} else { 				/* normal receive path */
 +		P9_DPRINTK(P9_DEBUG_MUX, "normal: tag %d\n", req->tc->tag);
 +		spin_lock_irqsave(&c->lock, flags);
 +		if (req->status != REQ_STATUS_FLSHD)
 +			req->status = REQ_STATUS_RCVD;
 +		spin_unlock_irqrestore(&c->lock, flags);
 +		wake_up(req->wq);
 +		P9_DPRINTK(P9_DEBUG_MUX, "wakeup: %d\n", req->tc->tag);
 +	}
 +}
 +EXPORT_SYMBOL(p9_client_cb);
 +
 +/**
 + * p9_parse_header - parse header arguments out of a packet
 + * @pdu: packet to parse
 + * @size: size of packet
 + * @type: type of request
 + * @tag: tag of packet
 + * @rewind: set if we need to rewind offset afterwards
 + */
 +
  int
 -p9_client_rpc(struct p9_client *c, struct p9_fcall *tc,
 -	struct p9_fcall **rc)
 +p9_parse_header(struct p9_fcall *pdu, int32_t *size, int8_t *type, int16_t *tag,
 +								int rewind)
  {
 -	return c->trans->rpc(c->trans, tc, rc);
 +	int8_t r_type;
 +	int16_t r_tag;
 +	int32_t r_size;
 +	int offset = pdu->offset;
 +	int err;
 +
 +	pdu->offset = 0;
 +	if (pdu->size == 0)
 +		pdu->size = 7;
 +
 +	err = p9pdu_readf(pdu, 0, "dbw", &r_size, &r_type, &r_tag);
 +	if (err)
 +		goto rewind_and_exit;
 +
 +	pdu->size = r_size;
 +	pdu->id = r_type;
 +	pdu->tag = r_tag;
 +
 +	P9_DPRINTK(P9_DEBUG_9P, "<<< size=%d type: %d tag: %d\n", pdu->size,
 +							pdu->id, pdu->tag);
 +
 +	if (type)
 +		*type = r_type;
 +	if (tag)
 +		*tag = r_tag;
 +	if (size)
 +		*size = r_size;
 +
 +
 +rewind_and_exit:
 +	if (rewind)
 +		pdu->offset = offset;
 +	return err;
  }
 +EXPORT_SYMBOL(p9_parse_header);
 +
 +/**
 + * p9_check_errors - check 9p packet for error return and process it
 + * @c: current client instance
 + * @req: request to parse and check for error conditions
 + *
 + * returns error code if one is discovered, otherwise returns 0
 + *
 + * this will have to be more complicated if we have multiple
 + * error packet types
 + */
 +
 +static int p9_check_errors(struct p9_client *c, struct p9_req_t *req)
 +{
 +	int8_t type;
 +	int err;
 +
 +	err = p9_parse_header(req->rc, NULL, &type, NULL, 0);
 +	if (err) {
 +		P9_DPRINTK(P9_DEBUG_ERROR, "couldn't parse header %d\n", err);
 +		return err;
 +	}
 +
 +	if (type == P9_RERROR) {
 +		int ecode;
 +		char *ename;
 +
 +		err = p9pdu_readf(req->rc, c->dotu, "s?d", &ename, &ecode);
 +		if (err) {
 +			P9_DPRINTK(P9_DEBUG_ERROR, "couldn't parse error%d\n",
 +									err);
 +			return err;
 +		}
 +
 +		if (c->dotu)
 +			err = -ecode;
 +
 +		if (!err) {
 +			err = p9_errstr2errno(ename, strlen(ename));
 +
 +			/* string match failed */
 +			if (!err)
 +				err = -ESERVERFAULT;
 +		}
 +
 +		P9_DPRINTK(P9_DEBUG_9P, "<<< RERROR (%d) %s\n", -ecode, ename);
 +
 +		kfree(ename);
 +	} else
 +		err = 0;
 +
 +	return err;
 +}
 +
 +/**
 + * p9_client_flush - flush (cancel) a request
 + * c: client state
 + * req: request to cancel
 + *
 + * This sents a flush for a particular requests and links
 + * the flush request to the original request.  The current
 + * code only supports a single flush request although the protocol
 + * allows for multiple flush requests to be sent for a single request.
 + *
 + */
 +
 +static int p9_client_flush(struct p9_client *c, struct p9_req_t *oldreq)
 +{
 +	struct p9_req_t *req;
 +	int16_t oldtag;
 +	int err;
 +
 +	err = p9_parse_header(oldreq->tc, NULL, NULL, &oldtag, 1);
 +	if (err)
 +		return err;
 +
 +	P9_DPRINTK(P9_DEBUG_9P, ">>> TFLUSH tag %d\n", oldtag);
 +
 +	req = p9_client_rpc(c, P9_TFLUSH, "w", oldtag);
 +	if (IS_ERR(req))
 +		return PTR_ERR(req);
 +
 +	req->flush_tag = oldtag;
 +
 +	/* we don't free anything here because RPC isn't complete */
 +	return 0;
 +}
 +
 +/**
 + * p9_client_rpc - issue a request and wait for a response
 + * @c: client session
 + * @type: type of request
 + * @fmt: protocol format string (see protocol.c)
 + *
 + * Returns request structure (which client must free using p9_free_req)
 + */
 +
 +static struct p9_req_t *
 +p9_client_rpc(struct p9_client *c, int8_t type, const char *fmt, ...)
 +{
 +	va_list ap;
 +	int tag, err;
 +	struct p9_req_t *req;
 +	unsigned long flags;
 +	int sigpending;
 +	int flushed = 0;
 +
 +	P9_DPRINTK(P9_DEBUG_MUX, "client %p op %d\n", c, type);
 +
 +	if (c->status != Connected)
 +		return ERR_PTR(-EIO);
 +
 +	if (signal_pending(current)) {
 +		sigpending = 1;
 +		clear_thread_flag(TIF_SIGPENDING);
 +	} else
 +		sigpending = 0;
 +
 +	tag = P9_NOTAG;
 +	if (type != P9_TVERSION) {
 +		tag = p9_idpool_get(c->tagpool);
 +		if (tag < 0)
 +			return ERR_PTR(-ENOMEM);
 +	}
 +
 +	req = p9_tag_alloc(c, tag);
 +	if (IS_ERR(req))
 +		return req;
 +
 +	/* marshall the data */
 +	p9pdu_prepare(req->tc, tag, type);
 +	va_start(ap, fmt);
 +	err = p9pdu_vwritef(req->tc, c->dotu, fmt, ap);
 +	va_end(ap);
 +	p9pdu_finalize(req->tc);
 +
 +	err = c->trans_mod->request(c, req);
 +	if (err < 0) {
 +		c->status = Disconnected;
 +		goto reterr;
 +	}
 +
 +	/* if it was a flush we just transmitted, return our tag */
 +	if (type == P9_TFLUSH)
 +		return req;
 +again:
 +	P9_DPRINTK(P9_DEBUG_MUX, "wait %p tag: %d\n", req->wq, tag);
 +	err = wait_event_interruptible(*req->wq,
 +						req->status >= REQ_STATUS_RCVD);
 +	P9_DPRINTK(P9_DEBUG_MUX, "wait %p tag: %d returned %d (flushed=%d)\n",
 +						req->wq, tag, err, flushed);
 +
 +	if (req->status == REQ_STATUS_ERROR) {
 +		P9_DPRINTK(P9_DEBUG_ERROR, "req_status error %d\n", req->t_err);
 +		err = req->t_err;
 +	} else if (err == -ERESTARTSYS && flushed) {
 +		P9_DPRINTK(P9_DEBUG_MUX, "flushed - going again\n");
 +		goto again;
 +	} else if (req->status == REQ_STATUS_FLSHD) {
 +		P9_DPRINTK(P9_DEBUG_MUX, "flushed - erestartsys\n");
 +		err = -ERESTARTSYS;
 +	}
 +
 +	if ((err == -ERESTARTSYS) && (c->status == Connected) && (!flushed)) {
 +		P9_DPRINTK(P9_DEBUG_MUX, "flushing\n");
 +		spin_lock_irqsave(&c->lock, flags);
 +		if (req->status == REQ_STATUS_SENT)
 +			req->status = REQ_STATUS_FLSH;
 +		spin_unlock_irqrestore(&c->lock, flags);
 +		sigpending = 1;
 +		flushed = 1;
 +		clear_thread_flag(TIF_SIGPENDING);
 +
 +		if (c->trans_mod->cancel(c, req)) {
 +			err = p9_client_flush(c, req);
 +			if (err == 0)
 +				goto again;
 +		}
 +	}
 +
 +	if (sigpending) {
 +		spin_lock_irqsave(&current->sighand->siglock, flags);
 +		recalc_sigpending();
 +		spin_unlock_irqrestore(&current->sighand->siglock, flags);
 +	}
 +
 +	if (err < 0)
 +		goto reterr;
 +
 +	err = p9_check_errors(c, req);
 +	if (!err) {
 +		P9_DPRINTK(P9_DEBUG_MUX, "exit: client %p op %d\n", c, type);
 +		return req;
 +	}
 +
 +reterr:
 +	P9_DPRINTK(P9_DEBUG_MUX, "exit: client %p op %d error: %d\n", c, type,
 +									err);
 +	p9_free_req(c, req);
 +	return ERR_PTR(err);
 +}
 +
 +static struct p9_fid *p9_fid_create(struct p9_client *clnt)
 +{
 +	int err;
 +	struct p9_fid *fid;
 +
 +	P9_DPRINTK(P9_DEBUG_FID, "clnt %p\n", clnt);
 +	fid = kmalloc(sizeof(struct p9_fid), GFP_KERNEL);
 +	if (!fid)
 +		return ERR_PTR(-ENOMEM);
 +
 +	fid->fid = p9_idpool_get(clnt->fidpool);
 +	if (fid->fid < 0) {
 +		err = -ENOSPC;
 +		goto error;
 +	}
 +
 +	memset(&fid->qid, 0, sizeof(struct p9_qid));
 +	fid->mode = -1;
 +	fid->rdir_fpos = 0;
- 	fid->uid = current->fsuid;
++	fid->uid = current_fsuid();
 +	fid->clnt = clnt;
 +	fid->aux = NULL;
 +
 +	spin_lock(&clnt->lock);
 +	list_add(&fid->flist, &clnt->fidlist);
 +	spin_unlock(&clnt->lock);
 +
 +	return fid;
 +
 +error:
 +	kfree(fid);
 +	return ERR_PTR(err);
 +}
 +
 +static void p9_fid_destroy(struct p9_fid *fid)
 +{
 +	struct p9_client *clnt;
 +
 +	P9_DPRINTK(P9_DEBUG_FID, "fid %d\n", fid->fid);
 +	clnt = fid->clnt;
 +	p9_idpool_put(fid->fid, clnt->fidpool);
 +	spin_lock(&clnt->lock);
 +	list_del(&fid->flist);
 +	spin_unlock(&clnt->lock);
 +	kfree(fid);
 +}
 +
 +static int p9_client_version(struct p9_client *c)
 +{
 +	int err = 0;
 +	struct p9_req_t *req;
 +	char *version;
 +	int msize;
 +
 +	P9_DPRINTK(P9_DEBUG_9P, ">>> TVERSION msize %d extended %d\n",
 +							c->msize, c->dotu);
 +	req = p9_client_rpc(c, P9_TVERSION, "ds", c->msize,
 +				c->dotu ? "9P2000.u" : "9P2000");
 +	if (IS_ERR(req))
 +		return PTR_ERR(req);
 +
 +	err = p9pdu_readf(req->rc, c->dotu, "ds", &msize, &version);
 +	if (err) {
 +		P9_DPRINTK(P9_DEBUG_9P, "version error %d\n", err);
 +		p9pdu_dump(1, req->rc);
 +		goto error;
 +	}
 +
 +	P9_DPRINTK(P9_DEBUG_9P, "<<< RVERSION msize %d %s\n", msize, version);
 +	if (!memcmp(version, "9P2000.u", 8))
 +		c->dotu = 1;
 +	else if (!memcmp(version, "9P2000", 6))
 +		c->dotu = 0;
 +	else {
 +		err = -EREMOTEIO;
 +		goto error;
 +	}
 +
 +	if (msize < c->msize)
 +		c->msize = msize;
 +
 +error:
 +	kfree(version);
 +	p9_free_req(c, req);
 +
 +	return err;
 +}
 +EXPORT_SYMBOL(p9_client_version);
  
  struct p9_client *p9_client_create(const char *dev_name, char *options)
  {
