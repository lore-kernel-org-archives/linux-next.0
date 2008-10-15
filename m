From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the semaphore-removal tree
Date: Wed, 15 Oct 2008 18:26:15 +1100
Message-ID: <20081015182615.a9089a9f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52473 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751533AbYJOH0V (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 03:26:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Wilcox <matthew@wil.cx>
Cc: linux-next@vger.kernel.org, Eric Van Hensbergen <ericvh@gmail.com>

Hi Willy,

Today's linux-next merge of the semaphore-removal tree got a conflict in
net/9p/trans_virtio.c between commits
5c1f7a7bf4c0baea08f6f3e913dd67cb17e78c20 ("9p: move request management to
client code") and 6a29d78c78b9cc4178997695f8d518d0506a87a9 ("9p:
consolidate transport structure") from the v9fs tree and commit
2a0e26c90de6245213ac53390b1f125c749ebba9 ("9p: Convert from mutex to
spinlock") from the semaphore-removal tree.

The context was changed by the v9fs changes.  I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc net/9p/trans_virtio.c
index 2d7781e,a6084be..0000000
--- a/net/9p/trans_virtio.c
+++ b/net/9p/trans_virtio.c
@@@ -99,13 -198,25 +100,13 @@@ static unsigned int rest_of_page(void *
   *
   */
  
 -static void p9_virtio_close(struct p9_trans *trans)
 +static void p9_virtio_close(struct p9_client *client)
  {
 -	struct virtio_chan *chan = trans->priv;
 -	int count;
 -	unsigned long flags;
 -
 -	spin_lock_irqsave(&chan->lock, flags);
 -	p9_idpool_destroy(chan->tagpool);
 -	for (count = 0; count < chan->max_tag; count++)
 -		kfree(chan->reqs[count].wq);
 -	kfree(chan->reqs);
 -	chan->max_tag = 0;
 -	spin_unlock_irqrestore(&chan->lock, flags);
 +	struct virtio_chan *chan = client->trans;
  
- 	mutex_lock(&virtio_9p_lock);
+ 	spin_lock(&virtio_9p_lock);
  	chan->inuse = false;
- 	mutex_unlock(&virtio_9p_lock);
+ 	spin_unlock(&virtio_9p_lock);
 -
 -	kfree(trans);
  }
  
  /**
