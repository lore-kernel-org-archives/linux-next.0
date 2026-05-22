Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868573D4131;
	Fri, 22 May 2026 11:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779447923; cv=none; b=EwhZPhgByUfQia6+zHH7n/q+PIbgrnfOyRKSXqdvM39AU/mWju5TsWWSdAHpcnMe1PkErBQpaA0/GqJ3I/0fj6er5V4GFVTEucIVaeAjbS9isc0uRatcqcy5TVKONOJVznKPmD/+ICyYNMhW+BgDC4V9oG52bvxNlbH81w5TzQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779447923; c=relaxed/simple;
	bh=GQ1s03uih6JVb5p8DLqvSeB5Ak0/wUwAx7gp5TKeoQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lrJN8NxngCN5EBAsdky+VI6m8OTI7AzSZNQEuUtjN2SjBeT50tjS+VbnKonEtIdwVQExPaQvk7ZRj9CKuCNDAdlIQ5XciD2hDNYR8VTJWlBac920a3XDfXRgT2P8szfUMdx/yZTK93fNeCZ5jbM6wCWGUku0MxF9iqN7adOXB94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PXLUab6/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PXLUab6/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE67E1F000E9;
	Fri, 22 May 2026 11:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779447920;
	bh=WwNJonwJmbUHC8zXSY2PKSTXqGuuoGR3hccGJBp0xDk=;
	h=Date:From:To:Cc:Subject;
	b=PXLUab6/mMlgIombYtRo0Z8sf+hifP+Mw8t/I1IjaF96x0k53GdZRJKDB/2jLrG6i
	 pApV+8TGaLDxmTGUYrTupYGCyVHO0hxSwNMHH/CxfrtPauE/njMUoI2wV/Fpv78kSz
	 qyZnC3SmTyyb6NofNJf3oEFtjwCPgIFO+E6nEoUZ0ZZqmoHqIwR0s2nRXrzPLGkeEy
	 uNL+4S+K0qg1nFj3/7MfxJLwVU2iAO9sxhNdppFm8MZu0R4cmPlv0JNnt5ttrjkNuu
	 M3JEMOrK6Uet5Lbu+shMvoU0vtLS4RalSnh2I0jGzknpEvMAx9GOhLTIRUCQeYRlLj
	 Oq5EFCRynzfaw==
Date: Fri, 22 May 2026 12:05:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Miklos Szeredi <mszeredi@redhat.com>
Subject: linux-next: manual merge of the fuse tree with the vfs-brauner-fixes
 tree
Message-ID: <ahA4bMmH3OKGBDcv@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0iIF4C4eYh0lTPzI"
Content-Disposition: inline


--0iIF4C4eYh0lTPzI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fuse tree got a conflict in:

  fs/fuse/dev.c

between commit:

  eac1801510181 ("fuse: limit FUSE_NOTIFY_RETRIEVE to uptodate folios")

=66rom the vfs-brauner-fixes tree and commit:

  77ad933a2e6d5 ("fuse: create notify.c")

=66rom the fuse tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

I'm not convinced this is fully correct, I didn't spot the equivalent
code in notify.c, though given that I see the fix was acked by Miklos
it may be that the issue is taken care of in the new FUSE code?

diff --combined fs/fuse/dev.c
index 08d364ed7d6c1,be4e66ed633c4..0000000000000
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@@ -6,9 -6,9 +6,9 @@@
    See the file COPYING.
  */
 =20
+ #include "dev.h"
+ #include "args.h"
  #include "dev_uring_i.h"
- #include "fuse_i.h"
- #include "fuse_dev_i.h"
 =20
  #include <linux/init.h>
  #include <linux/module.h>
@@@ -30,118 -30,26 +30,26 @@@
  MODULE_ALIAS_MISCDEV(FUSE_MINOR);
  MODULE_ALIAS("devname:fuse");
 =20
+ static DECLARE_WAIT_QUEUE_HEAD(fuse_dev_waitq);
+=20
  static struct kmem_cache *fuse_req_cachep;
 =20
- const unsigned long fuse_timeout_timer_freq =3D
- 	secs_to_jiffies(FUSE_TIMEOUT_TIMER_FREQ);
-=20
- bool fuse_request_expired(struct fuse_conn *fc, struct list_head *list)
- {
- 	struct fuse_req *req;
-=20
- 	req =3D list_first_entry_or_null(list, struct fuse_req, list);
- 	if (!req)
- 		return false;
- 	return time_is_before_jiffies(req->create_time + fc->timeout.req_timeout=
);
- }
-=20
- static bool fuse_fpq_processing_expired(struct fuse_conn *fc, struct list=
_head *processing)
- {
- 	int i;
-=20
- 	for (i =3D 0; i < FUSE_PQ_HASH_SIZE; i++)
- 		if (fuse_request_expired(fc, &processing[i]))
- 			return true;
-=20
- 	return false;
- }
-=20
- /*
-  * Check if any requests aren't being completed by the time the request t=
imeout
-  * elapses. To do so, we:
-  * - check the fiq pending list
-  * - check the bg queue
-  * - check the fpq io and processing lists
-  *
-  * To make this fast, we only check against the head request on each list=
 since
-  * these are generally queued in order of creation time (eg newer request=
s get
-  * queued to the tail). We might miss a few edge cases (eg requests trans=
itioning
-  * between lists, re-sent requests at the head of the pending list having=
 a
-  * later creation time than other requests on that list, etc.) but that i=
s fine
-  * since if the request never gets fulfilled, it will eventually be caugh=
t.
-  */
- void fuse_check_timeout(struct work_struct *work)
- {
- 	struct delayed_work *dwork =3D to_delayed_work(work);
- 	struct fuse_conn *fc =3D container_of(dwork, struct fuse_conn,
- 					    timeout.work);
- 	struct fuse_iqueue *fiq =3D &fc->iq;
- 	struct fuse_dev *fud;
- 	struct fuse_pqueue *fpq;
- 	bool expired =3D false;
-=20
- 	if (!atomic_read(&fc->num_waiting))
- 	    goto out;
-=20
- 	spin_lock(&fiq->lock);
- 	expired =3D fuse_request_expired(fc, &fiq->pending);
- 	spin_unlock(&fiq->lock);
- 	if (expired)
- 		goto abort_conn;
-=20
- 	spin_lock(&fc->bg_lock);
- 	expired =3D fuse_request_expired(fc, &fc->bg_queue);
- 	spin_unlock(&fc->bg_lock);
- 	if (expired)
- 		goto abort_conn;
-=20
- 	spin_lock(&fc->lock);
- 	if (!fc->connected) {
- 		spin_unlock(&fc->lock);
- 		return;
- 	}
- 	list_for_each_entry(fud, &fc->devices, entry) {
- 		fpq =3D &fud->pq;
- 		spin_lock(&fpq->lock);
- 		if (fuse_request_expired(fc, &fpq->io) ||
- 		    fuse_fpq_processing_expired(fc, fpq->processing)) {
- 			spin_unlock(&fpq->lock);
- 			spin_unlock(&fc->lock);
- 			goto abort_conn;
- 		}
-=20
- 		spin_unlock(&fpq->lock);
- 	}
- 	spin_unlock(&fc->lock);
-=20
- 	if (fuse_uring_request_expired(fc))
- 	    goto abort_conn;
-=20
- out:
- 	queue_delayed_work(system_percpu_wq, &fc->timeout.work,
- 			   fuse_timeout_timer_freq);
- 	return;
-=20
- abort_conn:
- 	fuse_abort_conn(fc);
- }
-=20
- static void fuse_request_init(struct fuse_mount *fm, struct fuse_req *req)
+ static void fuse_request_init(struct fuse_chan *fch, struct fuse_req *req)
  {
  	INIT_LIST_HEAD(&req->list);
  	INIT_LIST_HEAD(&req->intr_entry);
  	init_waitqueue_head(&req->waitq);
  	refcount_set(&req->count, 1);
  	__set_bit(FR_PENDING, &req->flags);
- 	req->fm =3D fm;
+ 	req->chan =3D fch;
  	req->create_time =3D jiffies;
  }
 =20
- static struct fuse_req *fuse_request_alloc(struct fuse_mount *fm, gfp_t f=
lags)
+ static struct fuse_req *fuse_request_alloc(struct fuse_chan *fch, gfp_t f=
lags)
  {
  	struct fuse_req *req =3D kmem_cache_zalloc(fuse_req_cachep, flags);
  	if (req)
- 		fuse_request_init(fm, req);
+ 		fuse_request_init(fch, req);
 =20
  	return req;
  }
@@@ -162,110 -70,86 +70,86 @@@ static void __fuse_put_request(struct f
  	refcount_dec(&req->count);
  }
 =20
- void fuse_set_initialized(struct fuse_conn *fc)
+ void fuse_chan_set_initialized(struct fuse_chan *fch, struct fuse_chan_pa=
ram *param)
  {
+ 	if (param) {
+ 		fch->minor =3D param->minor;
+ 		fch->max_write =3D param->max_write;
+ 		fch->max_pages =3D param->max_pages;
+ 	}
+=20
  	/* Make sure stores before this are seen on another CPU */
  	smp_wmb();
- 	fc->initialized =3D 1;
+ 	fch->initialized =3D 1;
+ 	wake_up_all(&fch->blocked_waitq);
  }
 =20
- static bool fuse_block_alloc(struct fuse_conn *fc, bool for_background)
+ static bool fuse_block_alloc(struct fuse_chan *fch, bool for_background)
  {
- 	return !fc->initialized || (for_background && fc->blocked) ||
- 	       (fc->io_uring && fc->connected && !fuse_uring_ready(fc));
+ 	return !fch->initialized || (for_background && fch->blocked) ||
+ 	       (fch->io_uring && fch->connected && !fuse_uring_ready(fch));
  }
 =20
- static void fuse_drop_waiting(struct fuse_conn *fc)
+ static void fuse_drop_waiting(struct fuse_chan *fch)
  {
  	/*
- 	 * lockess check of fc->connected is okay, because atomic_dec_and_test()
- 	 * provides a memory barrier matched with the one in fuse_wait_aborted()
+ 	 * lockess check of fch->connected is okay, because atomic_dec_and_test()
+ 	 * provides a memory barrier matched with the one in fuse_chan_wait_abor=
ted()
  	 * to ensure no wake-up is missed.
  	 */
- 	if (atomic_dec_and_test(&fc->num_waiting) &&
- 	    !READ_ONCE(fc->connected)) {
+ 	if (atomic_dec_and_test(&fch->num_waiting) &&
+ 	    !READ_ONCE(fch->connected)) {
  		/* wake up aborters */
- 		wake_up_all(&fc->blocked_waitq);
+ 		wake_up_all(&fch->blocked_waitq);
  	}
  }
 =20
  static void fuse_put_request(struct fuse_req *req);
 =20
- static struct fuse_req *fuse_get_req(struct mnt_idmap *idmap,
- 				     struct fuse_mount *fm,
- 				     bool for_background)
+ static struct fuse_req *fuse_get_req(struct fuse_chan *fch, bool for_back=
ground)
  {
- 	struct fuse_conn *fc =3D fm->fc;
  	struct fuse_req *req;
- 	bool no_idmap =3D !fm->sb || (fm->sb->s_iflags & SB_I_NOIDMAP);
- 	kuid_t fsuid;
- 	kgid_t fsgid;
  	int err;
 =20
- 	atomic_inc(&fc->num_waiting);
+ 	atomic_inc(&fch->num_waiting);
 =20
- 	if (fuse_block_alloc(fc, for_background)) {
+ 	if (fuse_block_alloc(fch, for_background)) {
  		err =3D -EINTR;
- 		if (wait_event_state_exclusive(fc->blocked_waitq,
- 				!fuse_block_alloc(fc, for_background),
+ 		if (wait_event_state_exclusive(fch->blocked_waitq,
+ 				!fuse_block_alloc(fch, for_background),
  				(TASK_KILLABLE | TASK_FREEZABLE)))
  			goto out;
  	}
- 	/* Matches smp_wmb() in fuse_set_initialized() */
+=20
+ 	/* Matches smp_wmb() in fuse_chan_set_initialized() */
  	smp_rmb();
 =20
  	err =3D -ENOTCONN;
- 	if (!fc->connected)
+ 	if (!fch->connected)
  		goto out;
 =20
- 	err =3D -ECONNREFUSED;
- 	if (fc->conn_error)
- 		goto out;
-=20
- 	req =3D fuse_request_alloc(fm, GFP_KERNEL);
+ 	req =3D fuse_request_alloc(fch, GFP_KERNEL);
  	err =3D -ENOMEM;
  	if (!req) {
  		if (for_background)
- 			wake_up(&fc->blocked_waitq);
+ 			wake_up(&fch->blocked_waitq);
  		goto out;
  	}
 =20
- 	req->in.h.pid =3D pid_nr_ns(task_pid(current), fc->pid_ns);
-=20
  	__set_bit(FR_WAITING, &req->flags);
  	if (for_background)
  		__set_bit(FR_BACKGROUND, &req->flags);
 =20
- 	/*
- 	 * Keep the old behavior when idmappings support was not
- 	 * declared by a FUSE server.
- 	 *
- 	 * For those FUSE servers who support idmapped mounts,
- 	 * we send UID/GID only along with "inode creation"
- 	 * fuse requests, otherwise idmap =3D=3D &invalid_mnt_idmap and
- 	 * req->in.h.{u,g}id will be equal to FUSE_INVALID_UIDGID.
- 	 */
- 	fsuid =3D no_idmap ? current_fsuid() : mapped_fsuid(idmap, fc->user_ns);
- 	fsgid =3D no_idmap ? current_fsgid() : mapped_fsgid(idmap, fc->user_ns);
- 	req->in.h.uid =3D from_kuid(fc->user_ns, fsuid);
- 	req->in.h.gid =3D from_kgid(fc->user_ns, fsgid);
-=20
- 	if (no_idmap && unlikely(req->in.h.uid =3D=3D ((uid_t)-1) ||
- 				 req->in.h.gid =3D=3D ((gid_t)-1))) {
- 		fuse_put_request(req);
- 		return ERR_PTR(-EOVERFLOW);
- 	}
-=20
  	return req;
 =20
   out:
- 	fuse_drop_waiting(fc);
+ 	fuse_drop_waiting(fch);
  	return ERR_PTR(err);
  }
 =20
  static void fuse_put_request(struct fuse_req *req)
  {
- 	struct fuse_conn *fc =3D req->fm->fc;
+ 	struct fuse_chan *fch =3D req->chan;
 =20
  	if (refcount_dec_and_test(&req->count)) {
  		if (test_bit(FR_BACKGROUND, &req->flags)) {
@@@ -273,15 -157,15 +157,15 @@@
  			 * We get here in the unlikely case that a background
  			 * request was allocated but not sent
  			 */
- 			spin_lock(&fc->bg_lock);
- 			if (!fc->blocked)
- 				wake_up(&fc->blocked_waitq);
- 			spin_unlock(&fc->bg_lock);
+ 			spin_lock(&fch->bg_lock);
+ 			if (!fch->blocked)
+ 				wake_up(&fch->blocked_waitq);
+ 			spin_unlock(&fch->bg_lock);
  		}
 =20
  		if (test_bit(FR_WAITING, &req->flags)) {
  			__clear_bit(FR_WAITING, &req->flags);
- 			fuse_drop_waiting(fc);
+ 			fuse_drop_waiting(fch);
  		}
 =20
  		fuse_request_free(req);
@@@ -335,6 -219,11 +219,11 @@@ __releases(fiq->lock
  	spin_unlock(&fiq->lock);
  }
 =20
+ struct fuse_forget_link *fuse_alloc_forget(void)
+ {
+ 	return kzalloc_obj(struct fuse_forget_link, GFP_KERNEL_ACCOUNT);
+ }
+=20
  void fuse_dev_queue_forget(struct fuse_iqueue *fiq,
  			   struct fuse_forget_link *forget)
  {
@@@ -406,12 -295,271 +295,271 @@@ static void fuse_dev_queue_req(struct f
  	}
  }
 =20
- const struct fuse_iqueue_ops fuse_dev_fiq_ops =3D {
+ static const struct fuse_iqueue_ops fuse_dev_fiq_ops =3D {
  	.send_forget	=3D fuse_dev_queue_forget,
  	.send_interrupt	=3D fuse_dev_queue_interrupt,
  	.send_req	=3D fuse_dev_queue_req,
  };
- EXPORT_SYMBOL_GPL(fuse_dev_fiq_ops);
+=20
+ void fuse_iqueue_init(struct fuse_iqueue *fiq, const struct fuse_iqueue_o=
ps *ops, void *priv)
+ {
+ 	spin_lock_init(&fiq->lock);
+ 	init_waitqueue_head(&fiq->waitq);
+ 	INIT_LIST_HEAD(&fiq->pending);
+ 	INIT_LIST_HEAD(&fiq->interrupts);
+ 	fiq->forget_list_tail =3D &fiq->forget_list_head;
+ 	fiq->connected =3D 1;
+ 	fiq->ops =3D ops;
+ 	fiq->priv =3D priv;
+ }
+ EXPORT_SYMBOL_GPL(fuse_iqueue_init);
+=20
+ void fuse_chan_release(struct fuse_chan *fch)
+ {
+ 	struct fuse_iqueue *fiq =3D &fch->iq;
+=20
+ 	if (fiq->ops->release)
+ 		fiq->ops->release(fiq);
+=20
+ 	if (fch->timeout.req_timeout)
+ 		cancel_delayed_work_sync(&fch->timeout.work);
+ }
+=20
+ void fuse_chan_free(struct fuse_chan *fch)
+ {
+ 	WARN_ON(!list_empty(&fch->devices));
+ 	kfree(fch->pq_prealloc);
+ 	kfree(fch);
+ }
+ EXPORT_SYMBOL_GPL(fuse_chan_free);
+=20
+ struct fuse_chan *fuse_chan_new(void)
+ {
+ 	struct fuse_chan *fch =3D kzalloc_obj(struct fuse_chan);
+ 	if (!fch)
+ 		return NULL;
+=20
+ 	spin_lock_init(&fch->lock);
+ 	INIT_LIST_HEAD(&fch->devices);
+ 	spin_lock_init(&fch->bg_lock);
+ 	INIT_LIST_HEAD(&fch->bg_queue);
+ 	init_waitqueue_head(&fch->blocked_waitq);
+ 	atomic_set(&fch->num_waiting, 0);
+ 	fch->max_background =3D FUSE_DEFAULT_MAX_BACKGROUND;
+ 	fch->initialized =3D 0;
+ 	fch->blocked =3D 0;
+ 	fch->connected =3D 1;
+ 	fch->timeout.req_timeout =3D 0;
+=20
+ 	return fch;
+ }
+ EXPORT_SYMBOL_GPL(fuse_chan_new);
+=20
+ struct list_head *fuse_pqueue_alloc(void)
+ {
+ 	struct list_head *pq =3D kzalloc_objs(struct list_head, FUSE_PQ_HASH_SIZ=
E);
+=20
+ 	if (pq) {
+ 		for (int i =3D 0; i < FUSE_PQ_HASH_SIZE; i++)
+ 			INIT_LIST_HEAD(&pq[i]);
+ 	}
+ 	return pq;
+ }
+=20
+ struct fuse_chan *fuse_dev_chan_new(void)
+ {
+ 	struct fuse_chan *fch __free(kfree) =3D fuse_chan_new();
+ 	if (!fch)
+ 		return NULL;
+=20
+ 	fch->pq_prealloc =3D fuse_pqueue_alloc();
+ 	if (!fch->pq_prealloc)
+ 		return NULL;
+=20
+ 	fuse_iqueue_init(&fch->iq, &fuse_dev_fiq_ops, NULL);
+=20
+ 	return no_free_ptr(fch);
+ }
+ EXPORT_SYMBOL_GPL(fuse_dev_chan_new);
+=20
+ unsigned int fuse_chan_num_background(struct fuse_chan *fch)
+ {
+ 	return fch->num_background;
+ }
+=20
+ unsigned int fuse_chan_max_background(struct fuse_chan *fch)
+ {
+ 	return READ_ONCE(fch->max_background);
+ }
+=20
+ void fuse_chan_max_background_set(struct fuse_chan *fch, unsigned int val)
+ {
+ 	spin_lock(&fch->bg_lock);
+ 	fch->max_background =3D val;
+ 	fch->blocked =3D fch->num_background >=3D fch->max_background;
+ 	if (!fch->blocked)
+ 		wake_up(&fch->blocked_waitq);
+ 	spin_unlock(&fch->bg_lock);
+ }
+=20
+ unsigned int fuse_chan_num_waiting(struct fuse_chan *fch)
+ {
+ 	return atomic_read(&fch->num_waiting);
+ }
+=20
+ void fuse_chan_set_fc(struct fuse_chan *fch, struct fuse_conn *fc)
+ {
+ 	fch->conn =3D fc;
+ }
+=20
+ void fuse_chan_io_uring_enable(struct fuse_chan *fch)
+ {
+ 	fch->io_uring =3D 1;
+ }
+=20
+ void fuse_pqueue_init(struct fuse_pqueue *fpq)
+ {
+ 	spin_lock_init(&fpq->lock);
+ 	INIT_LIST_HEAD(&fpq->io);
+ 	fpq->connected =3D 1;
+ 	fpq->processing =3D NULL;
+ }
+=20
+ static struct fuse_dev *fuse_dev_alloc_no_pq(void)
+ {
+ 	struct fuse_dev *fud;
+=20
+ 	fud =3D kzalloc_obj(struct fuse_dev);
+ 	if (!fud)
+ 		return NULL;
+=20
+ 	refcount_set(&fud->ref, 1);
+ 	fuse_pqueue_init(&fud->pq);
+=20
+ 	return fud;
+ }
+=20
+ struct fuse_dev *fuse_dev_alloc(void)
+ {
+ 	struct fuse_dev *fud __free(kfree) =3D fuse_dev_alloc_no_pq();
+ 	if (!fud)
+ 		return NULL;
+=20
+ 	fud->pq.processing =3D fuse_pqueue_alloc();
+ 	if (!fud->pq.processing)
+ 		return NULL;
+=20
+ 	return no_free_ptr(fud);
+ }
+ EXPORT_SYMBOL_GPL(fuse_dev_alloc);
+=20
+ /*
+  * Installs @fch into @fud, return true on success.  "Consumes" @pq in ei=
ther case.
+  */
+ static bool fuse_dev_install_with_pq(struct fuse_dev *fud, struct fuse_ch=
an *fch,
+ 				     struct list_head *pq)
+ {
+ 	struct fuse_chan *old_fch;
+=20
+ 	guard(spinlock)(&fch->lock);
+ 	/*
+ 	 * Pairs with:
+ 	 *  - xchg() in fuse_dev_release()
+ 	 *  - smp_load_acquire() in fuse_dev_fc_get()
+ 	 */
+ 	old_fch =3D cmpxchg(&fud->chan, NULL, fch);
+ 	if (old_fch) {
+ 		/*
+ 		 * failed to set fud->chan because
+ 		 *  - it was already set to a different fc
+ 		 *  - it was set to disconneted
+ 		 */
+ 		kfree(pq);
+ 		return false;
+ 	}
+ 	if (pq) {
+ 		WARN_ON(fud->pq.processing);
+ 		fud->pq.processing =3D pq;
+ 	}
+ 	list_add_tail(&fud->entry, &fch->devices);
+ 	fuse_conn_get(fch->conn);
+ 	wake_up_all(&fuse_dev_waitq);
+ 	return true;
+ }
+=20
+ void fuse_dev_install(struct fuse_dev *fud, struct fuse_chan *fch)
+ {
+ 	struct list_head *pq =3D fch->pq_prealloc;
+=20
+ 	fch->pq_prealloc =3D NULL;
+ 	if (!fuse_dev_install_with_pq(fud, fch, pq)) {
+ 		/* Channel is not usable without a dev */
+ 		fuse_chan_abort(fch, false);
+ 	}
+ }
+ EXPORT_SYMBOL_GPL(fuse_dev_install);
+=20
+ struct fuse_dev *fuse_dev_alloc_install(struct fuse_chan *fch)
+ {
+ 	struct fuse_dev *fud;
+=20
+ 	fud =3D fuse_dev_alloc_no_pq();
+ 	if (!fud)
+ 		return NULL;
+=20
+ 	fuse_dev_install(fud, fch);
+ 	return fud;
+ }
+ EXPORT_SYMBOL_GPL(fuse_dev_alloc_install);
+=20
+ void fuse_dev_put(struct fuse_dev *fud)
+ {
+ 	struct fuse_chan *fch;
+=20
+ 	if (!refcount_dec_and_test(&fud->ref))
+ 		return;
+=20
+ 	fch =3D fuse_dev_chan_get(fud);
+ 	if (fch && fch !=3D FUSE_DEV_CHAN_DISCONNECTED) {
+ 		/* This is the virtiofs case (fuse_dev_release() not called) */
+ 		spin_lock(&fch->lock);
+ 		list_del(&fud->entry);
+ 		spin_unlock(&fch->lock);
+=20
+ 		fuse_conn_put(fch->conn);
+ 	}
+ 	kfree(fud->pq.processing);
+ 	kfree(fud);
+ }
+ EXPORT_SYMBOL_GPL(fuse_dev_put);
+=20
+ bool fuse_dev_is_installed(struct fuse_dev *fud)
+ {
+ 	struct fuse_chan *fch =3D fuse_dev_chan_get(fud);
+=20
+ 	return fch !=3D NULL && fch !=3D FUSE_DEV_CHAN_DISCONNECTED;
+ }
+=20
+ /*
+  * Checks if @fc matches the one installed in @fud
+  */
+ bool fuse_dev_verify(struct fuse_dev *fud, struct fuse_chan *fch)
+ {
+ 	return fuse_dev_chan_get(fud) =3D=3D fch;
+ }
+=20
+ bool fuse_dev_is_sync_init(struct fuse_dev *fud)
+ {
+ 	return fud->sync_init;
+ }
+=20
+ struct fuse_dev *fuse_dev_grab(struct file *file)
+ {
+ 	struct fuse_dev *fud =3D fuse_file_to_fud(file);
+=20
+ 	refcount_inc(&fud->ref);
+ 	return fud;
+ }
 =20
  static void fuse_send_one(struct fuse_iqueue *fiq, struct fuse_req *req)
  {
@@@ -421,10 -569,10 +569,10 @@@
  	fiq->ops->send_req(fiq, req);
  }
 =20
- void fuse_queue_forget(struct fuse_conn *fc, struct fuse_forget_link *for=
get,
- 		       u64 nodeid, u64 nlookup)
+ void fuse_chan_queue_forget(struct fuse_chan *fch, struct fuse_forget_lin=
k *forget,
+ 			    u64 nodeid, u64 nlookup)
  {
- 	struct fuse_iqueue *fiq =3D &fc->iq;
+ 	struct fuse_iqueue *fiq =3D &fch->iq;
 =20
  	forget->forget_one.nodeid =3D nodeid;
  	forget->forget_one.nlookup =3D nlookup;
@@@ -432,17 -580,17 +580,17 @@@
  	fiq->ops->send_forget(fiq, forget);
  }
 =20
- static void flush_bg_queue(struct fuse_conn *fc)
+ static void flush_bg_queue(struct fuse_chan *fch)
  {
- 	struct fuse_iqueue *fiq =3D &fc->iq;
+ 	struct fuse_iqueue *fiq =3D &fch->iq;
 =20
- 	while (fc->active_background < fc->max_background &&
- 	       !list_empty(&fc->bg_queue)) {
+ 	while (fch->active_background < fch->max_background &&
+ 	       !list_empty(&fch->bg_queue)) {
  		struct fuse_req *req;
 =20
- 		req =3D list_first_entry(&fc->bg_queue, struct fuse_req, list);
+ 		req =3D list_first_entry(&fch->bg_queue, struct fuse_req, list);
  		list_del(&req->list);
- 		fc->active_background++;
+ 		fch->active_background++;
  		fuse_send_one(fiq, req);
  	}
  }
@@@ -457,9 -605,8 +605,8 @@@
   */
  void fuse_request_end(struct fuse_req *req)
  {
- 	struct fuse_mount *fm =3D req->fm;
- 	struct fuse_conn *fc =3D fm->fc;
- 	struct fuse_iqueue *fiq =3D &fc->iq;
+ 	struct fuse_chan *fch =3D req->chan;
+ 	struct fuse_iqueue *fiq =3D &fch->iq;
 =20
  	if (test_and_set_bit(FR_FINISHED, &req->flags))
  		goto put_request;
@@@ -478,33 -625,33 +625,33 @@@
  	WARN_ON(test_bit(FR_PENDING, &req->flags));
  	WARN_ON(test_bit(FR_SENT, &req->flags));
  	if (test_bit(FR_BACKGROUND, &req->flags)) {
- 		spin_lock(&fc->bg_lock);
+ 		spin_lock(&fch->bg_lock);
  		clear_bit(FR_BACKGROUND, &req->flags);
- 		if (fc->num_background =3D=3D fc->max_background) {
- 			fc->blocked =3D 0;
- 			wake_up(&fc->blocked_waitq);
- 		} else if (!fc->blocked) {
+ 		if (fch->num_background =3D=3D fch->max_background) {
+ 			fch->blocked =3D 0;
+ 			wake_up(&fch->blocked_waitq);
+ 		} else if (!fch->blocked) {
  			/*
  			 * Wake up next waiter, if any.  It's okay to use
  			 * waitqueue_active(), as we've already synced up
- 			 * fc->blocked with waiters with the wake_up() call
+ 			 * fch->blocked with waiters with the wake_up() call
  			 * above.
  			 */
- 			if (waitqueue_active(&fc->blocked_waitq))
- 				wake_up(&fc->blocked_waitq);
+ 			if (waitqueue_active(&fch->blocked_waitq))
+ 				wake_up(&fch->blocked_waitq);
  		}
 =20
- 		fc->num_background--;
- 		fc->active_background--;
- 		flush_bg_queue(fc);
- 		spin_unlock(&fc->bg_lock);
+ 		fch->num_background--;
+ 		fch->active_background--;
+ 		flush_bg_queue(fch);
+ 		spin_unlock(&fch->bg_lock);
  	} else {
  		/* Wake up waiter sleeping in request_wait_answer() */
  		wake_up(&req->waitq);
  	}
 =20
  	if (test_bit(FR_ASYNC, &req->flags))
- 		req->args->end(fm, req->args, req->out.h.error);
+ 		req->args->end(req->args, req->out.h.error);
  put_request:
  	fuse_put_request(req);
  }
@@@ -512,7 -659,7 +659,7 @@@ EXPORT_SYMBOL_GPL(fuse_request_end)
 =20
  static int queue_interrupt(struct fuse_req *req)
  {
- 	struct fuse_iqueue *fiq =3D &req->fm->fc->iq;
+ 	struct fuse_iqueue *fiq =3D &req->chan->iq;
 =20
  	/* Check for we've sent request to interrupt this req */
  	if (unlikely(!test_bit(FR_INTERRUPTED, &req->flags)))
@@@ -543,11 -690,11 +690,11 @@@ bool fuse_remove_pending_req(struct fus
 =20
  static void request_wait_answer(struct fuse_req *req)
  {
- 	struct fuse_conn *fc =3D req->fm->fc;
- 	struct fuse_iqueue *fiq =3D &fc->iq;
+ 	struct fuse_chan *fch =3D req->chan;
+ 	struct fuse_iqueue *fiq =3D &fch->iq;
  	int err;
 =20
- 	if (!fc->no_interrupt) {
+ 	if (!fch->no_interrupt) {
  		/* Any signal may interrupt this */
  		err =3D wait_event_interruptible(req->waitq,
  					test_bit(FR_FINISHED, &req->flags));
@@@ -571,7 -718,7 +718,7 @@@
  			return;
 =20
  		if (req->args->abort_on_kill) {
- 			fuse_abort_conn(fc);
+ 			fuse_chan_abort(fch, false);
  			return;
  		}
 =20
@@@ -592,7 -739,7 +739,7 @@@
 =20
  static void __fuse_request_send(struct fuse_req *req)
  {
- 	struct fuse_iqueue *fiq =3D &req->fm->fc->iq;
+ 	struct fuse_iqueue *fiq =3D &req->chan->iq;
 =20
  	BUG_ON(test_bit(FR_BACKGROUND, &req->flags));
 =20
@@@ -606,12 -753,12 +753,12 @@@
  	smp_rmb();
  }
 =20
- static void fuse_adjust_compat(struct fuse_conn *fc, struct fuse_args *ar=
gs)
+ static void fuse_adjust_compat(struct fuse_chan *fch, struct fuse_args *a=
rgs)
  {
- 	if (fc->minor < 4 && args->opcode =3D=3D FUSE_STATFS)
+ 	if (fch->minor < 4 && args->opcode =3D=3D FUSE_STATFS)
  		args->out_args[0].size =3D FUSE_COMPAT_STATFS_SIZE;
 =20
- 	if (fc->minor < 9) {
+ 	if (fch->minor < 9) {
  		switch (args->opcode) {
  		case FUSE_LOOKUP:
  		case FUSE_CREATE:
@@@ -627,7 -774,7 +774,7 @@@
  			break;
  		}
  	}
- 	if (fc->minor < 12) {
+ 	if (fch->minor < 12) {
  		switch (args->opcode) {
  		case FUSE_CREATE:
  			args->in_args[0].size =3D sizeof(struct fuse_open_in);
@@@ -639,25 -786,13 +786,13 @@@
  	}
  }
 =20
- static void fuse_force_creds(struct fuse_req *req)
- {
- 	struct fuse_conn *fc =3D req->fm->fc;
-=20
- 	if (!req->fm->sb || req->fm->sb->s_iflags & SB_I_NOIDMAP) {
- 		req->in.h.uid =3D from_kuid_munged(fc->user_ns, current_fsuid());
- 		req->in.h.gid =3D from_kgid_munged(fc->user_ns, current_fsgid());
- 	} else {
- 		req->in.h.uid =3D FUSE_INVALID_UIDGID;
- 		req->in.h.gid =3D FUSE_INVALID_UIDGID;
- 	}
-=20
- 	req->in.h.pid =3D pid_nr_ns(task_pid(current), fc->pid_ns);
- }
-=20
  static void fuse_args_to_req(struct fuse_req *req, struct fuse_args *args)
  {
  	req->in.h.opcode =3D args->opcode;
  	req->in.h.nodeid =3D args->nodeid;
+ 	req->in.h.uid =3D args->uid;
+ 	req->in.h.gid =3D args->gid;
+ 	req->in.h.pid =3D args->pid;
  	req->args =3D args;
  	if (args->is_ext)
  		req->in.h.total_extlen =3D args->in_args[args->ext_idx].size / 8;
@@@ -665,33 -800,26 +800,26 @@@
  		__set_bit(FR_ASYNC, &req->flags);
  }
 =20
- ssize_t __fuse_simple_request(struct mnt_idmap *idmap,
- 			      struct fuse_mount *fm,
- 			      struct fuse_args *args)
+ ssize_t fuse_chan_send(struct fuse_chan *fch, struct fuse_args *args)
  {
- 	struct fuse_conn *fc =3D fm->fc;
  	struct fuse_req *req;
  	ssize_t ret;
 =20
  	if (args->force) {
- 		atomic_inc(&fc->num_waiting);
- 		req =3D fuse_request_alloc(fm, GFP_KERNEL | __GFP_NOFAIL);
-=20
- 		if (!args->nocreds)
- 			fuse_force_creds(req);
+ 		atomic_inc(&fch->num_waiting);
+ 		req =3D fuse_request_alloc(fch, GFP_KERNEL | __GFP_NOFAIL);
 =20
  		__set_bit(FR_WAITING, &req->flags);
  		if (!args->abort_on_kill)
  			__set_bit(FR_FORCE, &req->flags);
  	} else {
- 		WARN_ON(args->nocreds);
- 		req =3D fuse_get_req(idmap, fm, false);
+ 		req =3D fuse_get_req(fch, false);
  		if (IS_ERR(req))
  			return PTR_ERR(req);
  	}
 =20
- 	/* Needs to be done after fuse_get_req() so that fc->minor is valid */
- 	fuse_adjust_compat(fc, args);
+ 	/* Needs to be done after fuse_get_req() so that fch->minor is valid */
+ 	fuse_adjust_compat(fch, args);
  	fuse_args_to_req(req, args);
 =20
  	if (!args->noreply)
@@@ -708,10 -836,9 +836,9 @@@
  }
 =20
  #ifdef CONFIG_FUSE_IO_URING
- static bool fuse_request_queue_background_uring(struct fuse_conn *fc,
- 					       struct fuse_req *req)
+ static bool fuse_request_queue_background_uring(struct fuse_req *req)
  {
- 	struct fuse_iqueue *fiq =3D &fc->iq;
+ 	struct fuse_iqueue *fiq =3D &req->chan->iq;
 =20
  	req->in.h.len =3D sizeof(struct fuse_in_header) +
  		fuse_len_args(req->args->in_numargs,
@@@ -727,50 -854,46 +854,46 @@@
   */
  static int fuse_request_queue_background(struct fuse_req *req)
  {
- 	struct fuse_mount *fm =3D req->fm;
- 	struct fuse_conn *fc =3D fm->fc;
+ 	struct fuse_chan *fch =3D req->chan;
  	bool queued =3D false;
 =20
  	WARN_ON(!test_bit(FR_BACKGROUND, &req->flags));
  	if (!test_bit(FR_WAITING, &req->flags)) {
  		__set_bit(FR_WAITING, &req->flags);
- 		atomic_inc(&fc->num_waiting);
+ 		atomic_inc(&fch->num_waiting);
  	}
  	__set_bit(FR_ISREPLY, &req->flags);
 =20
  #ifdef CONFIG_FUSE_IO_URING
- 	if (fuse_uring_ready(fc))
- 		return fuse_request_queue_background_uring(fc, req);
+ 	if (fuse_uring_ready(fch))
+ 		return fuse_request_queue_background_uring(req);
  #endif
 =20
- 	spin_lock(&fc->bg_lock);
- 	if (likely(fc->connected)) {
- 		fc->num_background++;
- 		if (fc->num_background =3D=3D fc->max_background)
- 			fc->blocked =3D 1;
- 		list_add_tail(&req->list, &fc->bg_queue);
- 		flush_bg_queue(fc);
+ 	spin_lock(&fch->bg_lock);
+ 	if (likely(fch->connected)) {
+ 		fch->num_background++;
+ 		if (fch->num_background =3D=3D fch->max_background)
+ 			fch->blocked =3D 1;
+ 		list_add_tail(&req->list, &fch->bg_queue);
+ 		flush_bg_queue(fch);
  		queued =3D true;
  	}
- 	spin_unlock(&fc->bg_lock);
+ 	spin_unlock(&fch->bg_lock);
 =20
  	return queued;
  }
 =20
- int fuse_simple_background(struct fuse_mount *fm, struct fuse_args *args,
- 			    gfp_t gfp_flags)
+ int fuse_chan_send_bg(struct fuse_chan *fch, struct fuse_args *args, gfp_=
t gfp_flags)
  {
  	struct fuse_req *req;
 =20
  	if (args->force) {
- 		WARN_ON(!args->nocreds);
- 		req =3D fuse_request_alloc(fm, gfp_flags);
+ 		req =3D fuse_request_alloc(fch, gfp_flags);
  		if (!req)
  			return -ENOMEM;
  		__set_bit(FR_BACKGROUND, &req->flags);
  	} else {
- 		WARN_ON(args->nocreds);
- 		req =3D fuse_get_req(&invalid_mnt_idmap, fm, true);
+ 		req =3D fuse_get_req(fch, true);
  		if (IS_ERR(req))
  			return PTR_ERR(req);
  	}
@@@ -784,15 -907,13 +907,13 @@@
 =20
  	return 0;
  }
- EXPORT_SYMBOL_GPL(fuse_simple_background);
 =20
- static int fuse_simple_notify_reply(struct fuse_mount *fm,
- 				    struct fuse_args *args, u64 unique)
+ int fuse_chan_send_notify_reply(struct fuse_chan *fch, struct fuse_args *=
args, u64 unique)
  {
  	struct fuse_req *req;
- 	struct fuse_iqueue *fiq =3D &fm->fc->iq;
+ 	struct fuse_iqueue *fiq =3D &fch->iq;
 =20
- 	req =3D fuse_get_req(&invalid_mnt_idmap, fm, false);
+ 	req =3D fuse_get_req(fch, false);
  	if (IS_ERR(req))
  		return PTR_ERR(req);
 =20
@@@ -1122,8 -1243,8 +1243,8 @@@ static int fuse_ref_folio(struct fuse_c
   * Copy a folio in the request to/from the userspace buffer.  Must be
   * done atomically
   */
- static int fuse_copy_folio(struct fuse_copy_state *cs, struct folio **fol=
iop,
- 			   unsigned offset, unsigned count, int zeroing)
+ int fuse_copy_folio(struct fuse_copy_state *cs, struct folio **foliop,
+ 		    unsigned offset, unsigned count, int zeroing)
  {
  	int err;
  	struct folio *folio =3D *foliop;
@@@ -1204,7 -1325,7 +1325,7 @@@ static int fuse_copy_folios(struct fuse
  }
 =20
  /* Copy a single argument in the request to/from userspace buffer */
- static int fuse_copy_one(struct fuse_copy_state *cs, void *val, unsigned =
size)
+ int fuse_copy_one(struct fuse_copy_state *cs, void *val, unsigned size)
  {
  	while (size) {
  		if (!cs->len) {
@@@ -1256,7 -1377,7 +1377,7 @@@ static int request_pending(struct fuse_
   */
  static int fuse_read_interrupt(struct fuse_iqueue *fiq,
  			       struct fuse_copy_state *cs,
- 			       size_t nbytes, struct fuse_req *req)
+ 			       struct fuse_req *req)
  __releases(fiq->lock)
  {
  	struct fuse_in_header ih;
@@@ -1273,8 -1394,6 +1394,6 @@@
  	arg.unique =3D req->in.h.unique;
 =20
  	spin_unlock(&fiq->lock);
- 	if (nbytes < reqsize)
- 		return -EINVAL;
 =20
  	err =3D fuse_copy_one(cs, &ih, sizeof(ih));
  	if (!err)
@@@ -1307,8 -1426,7 +1426,7 @@@ static struct fuse_forget_link *fuse_de
  }
 =20
  static int fuse_read_single_forget(struct fuse_iqueue *fiq,
- 				   struct fuse_copy_state *cs,
- 				   size_t nbytes)
+ 				   struct fuse_copy_state *cs)
  __releases(fiq->lock)
  {
  	int err;
@@@ -1325,8 -1443,6 +1443,6 @@@
 =20
  	spin_unlock(&fiq->lock);
  	kfree(forget);
- 	if (nbytes < ih.len)
- 		return -EINVAL;
 =20
  	err =3D fuse_copy_one(cs, &ih, sizeof(ih));
  	if (!err)
@@@ -1354,11 -1470,6 +1470,6 @@@ __releases(fiq->lock
  		.len =3D sizeof(ih) + sizeof(arg),
  	};
 =20
- 	if (nbytes < ih.len) {
- 		spin_unlock(&fiq->lock);
- 		return -EINVAL;
- 	}
-=20
  	max_forgets =3D (nbytes - ih.len) / sizeof(struct fuse_forget_one);
  	head =3D fuse_dequeue_forget(fiq, max_forgets, &count);
  	spin_unlock(&fiq->lock);
@@@ -1388,13 -1499,13 +1499,13 @@@
  	return ih.len;
  }
 =20
- static int fuse_read_forget(struct fuse_conn *fc, struct fuse_iqueue *fiq,
+ static int fuse_read_forget(struct fuse_chan *fch, struct fuse_iqueue *fi=
q,
  			    struct fuse_copy_state *cs,
  			    size_t nbytes)
  __releases(fiq->lock)
  {
- 	if (fc->minor < 16 || fiq->forget_list_head.next->next =3D=3D NULL)
- 		return fuse_read_single_forget(fiq, cs, nbytes);
+ 	if (fch->minor < 16 || fiq->forget_list_head.next->next =3D=3D NULL)
+ 		return fuse_read_single_forget(fiq, cs);
  	else
  		return fuse_read_batch_forget(fiq, cs, nbytes);
  }
@@@ -1412,8 -1523,8 +1523,8 @@@ static ssize_t fuse_dev_do_read(struct=20
  				struct fuse_copy_state *cs, size_t nbytes)
  {
  	ssize_t err;
- 	struct fuse_conn *fc =3D fud->fc;
- 	struct fuse_iqueue *fiq =3D &fc->iq;
+ 	struct fuse_chan *fch =3D fud->chan;
+ 	struct fuse_iqueue *fiq =3D &fch->iq;
  	struct fuse_pqueue *fpq =3D &fud->pq;
  	struct fuse_req *req;
  	struct fuse_args *args;
@@@ -1435,7 -1546,7 +1546,7 @@@
  	if (nbytes < max_t(size_t, FUSE_MIN_READ_BUFFER,
  			   sizeof(struct fuse_in_header) +
  			   sizeof(struct fuse_write_in) +
- 			   fc->max_write))
+ 			   fch->max_write))
  		return -EINVAL;
 =20
   restart:
@@@ -1454,19 -1565,19 +1565,19 @@@
  	}
 =20
  	if (!fiq->connected) {
- 		err =3D fc->aborted ? -ECONNABORTED : -ENODEV;
+ 		err =3D fch->abort_with_err ? -ECONNABORTED : -ENODEV;
  		goto err_unlock;
  	}
 =20
  	if (!list_empty(&fiq->interrupts)) {
  		req =3D list_entry(fiq->interrupts.next, struct fuse_req,
  				 intr_entry);
- 		return fuse_read_interrupt(fiq, cs, nbytes, req);
+ 		return fuse_read_interrupt(fiq, cs, req);
  	}
 =20
  	if (forget_pending(fiq)) {
  		if (list_empty(&fiq->pending) || fiq->forget_batch-- > 0)
- 			return fuse_read_forget(fc, fiq, cs, nbytes);
+ 			return fuse_read_forget(fch, fiq, cs, nbytes);
 =20
  		if (fiq->forget_batch <=3D -8)
  			fiq->forget_batch =3D 16;
@@@ -1492,7 -1603,7 +1603,7 @@@
  	spin_lock(&fpq->lock);
  	/*
  	 *  Must not put request on fpq->io queue after having been shut down by
- 	 *  fuse_abort_conn()
+ 	 *  fuse_chan_abort()
  	 */
  	if (!fpq->connected) {
  		req->out.h.error =3D err =3D -ECONNABORTED;
@@@ -1510,7 -1621,7 +1621,7 @@@
  	spin_lock(&fpq->lock);
  	clear_bit(FR_LOCKED, &req->flags);
  	if (!fpq->connected) {
- 		err =3D fc->aborted ? -ECONNABORTED : -ENODEV;
+ 		err =3D fch->abort_with_err ? -ECONNABORTED : -ENODEV;
  		goto out_end;
  	}
  	if (err) {
@@@ -1548,7 -1659,7 +1659,7 @@@ out_end
 =20
  static int fuse_dev_open(struct inode *inode, struct file *file)
  {
- 	struct fuse_dev *fud =3D fuse_dev_alloc();
+ 	struct fuse_dev *fud =3D fuse_dev_alloc_no_pq();
 =20
  	if (!fud)
  		return -ENOMEM;
@@@ -1562,9 -1673,15 +1673,15 @@@ struct fuse_dev *fuse_get_dev(struct fi
  	struct fuse_dev *fud =3D fuse_file_to_fud(file);
  	int err;
 =20
- 	err =3D wait_event_interruptible(fuse_dev_waitq, fuse_dev_fc_get(fud) !=
=3D NULL);
- 	if (err)
- 		return ERR_PTR(err);
+ 	if (unlikely(!fuse_dev_chan_get(fud))) {
+ 		/* only block waiting for mount if sync init was requested */
+ 		if (!fud->sync_init)
+ 			return ERR_PTR(-EPERM);
+=20
+ 		err =3D wait_event_interruptible(fuse_dev_waitq, fuse_dev_chan_get(fud)=
 !=3D NULL);
+ 		if (err)
+ 			return ERR_PTR(err);
+ 	}
 =20
  	return fud;
  }
@@@ -1636,348 -1753,6 +1753,6 @@@ out
  	return ret;
  }
 =20
- static int fuse_notify_poll(struct fuse_conn *fc, unsigned int size,
- 			    struct fuse_copy_state *cs)
- {
- 	struct fuse_notify_poll_wakeup_out outarg;
- 	int err;
-=20
- 	if (size !=3D sizeof(outarg))
- 		return -EINVAL;
-=20
- 	err =3D fuse_copy_one(cs, &outarg, sizeof(outarg));
- 	if (err)
- 		return err;
-=20
- 	fuse_copy_finish(cs);
- 	return fuse_notify_poll_wakeup(fc, &outarg);
- }
-=20
- static int fuse_notify_inval_inode(struct fuse_conn *fc, unsigned int siz=
e,
- 				   struct fuse_copy_state *cs)
- {
- 	struct fuse_notify_inval_inode_out outarg;
- 	int err;
-=20
- 	if (size !=3D sizeof(outarg))
- 		return -EINVAL;
-=20
- 	err =3D fuse_copy_one(cs, &outarg, sizeof(outarg));
- 	if (err)
- 		return err;
- 	fuse_copy_finish(cs);
-=20
- 	down_read(&fc->killsb);
- 	err =3D fuse_reverse_inval_inode(fc, outarg.ino,
- 				       outarg.off, outarg.len);
- 	up_read(&fc->killsb);
- 	return err;
- }
-=20
- static int fuse_notify_inval_entry(struct fuse_conn *fc, unsigned int siz=
e,
- 				   struct fuse_copy_state *cs)
- {
- 	struct fuse_notify_inval_entry_out outarg;
- 	int err;
- 	char *buf;
- 	struct qstr name;
-=20
- 	if (size < sizeof(outarg))
- 		return -EINVAL;
-=20
- 	err =3D fuse_copy_one(cs, &outarg, sizeof(outarg));
- 	if (err)
- 		return err;
-=20
- 	if (outarg.namelen > fc->name_max)
- 		return -ENAMETOOLONG;
-=20
- 	err =3D -EINVAL;
- 	if (size !=3D sizeof(outarg) + outarg.namelen + 1)
- 		return -EINVAL;
-=20
- 	buf =3D kzalloc(outarg.namelen + 1, GFP_KERNEL);
- 	if (!buf)
- 		return -ENOMEM;
-=20
- 	name.name =3D buf;
- 	name.len =3D outarg.namelen;
- 	err =3D fuse_copy_one(cs, buf, outarg.namelen + 1);
- 	if (err)
- 		goto err;
- 	fuse_copy_finish(cs);
- 	buf[outarg.namelen] =3D 0;
-=20
- 	down_read(&fc->killsb);
- 	err =3D fuse_reverse_inval_entry(fc, outarg.parent, 0, &name, outarg.fla=
gs);
- 	up_read(&fc->killsb);
- err:
- 	kfree(buf);
- 	return err;
- }
-=20
- static int fuse_notify_delete(struct fuse_conn *fc, unsigned int size,
- 			      struct fuse_copy_state *cs)
- {
- 	struct fuse_notify_delete_out outarg;
- 	int err;
- 	char *buf;
- 	struct qstr name;
-=20
- 	if (size < sizeof(outarg))
- 		return -EINVAL;
-=20
- 	err =3D fuse_copy_one(cs, &outarg, sizeof(outarg));
- 	if (err)
- 		return err;
-=20
- 	if (outarg.namelen > fc->name_max)
- 		return -ENAMETOOLONG;
-=20
- 	if (size !=3D sizeof(outarg) + outarg.namelen + 1)
- 		return -EINVAL;
-=20
- 	buf =3D kzalloc(outarg.namelen + 1, GFP_KERNEL);
- 	if (!buf)
- 		return -ENOMEM;
-=20
- 	name.name =3D buf;
- 	name.len =3D outarg.namelen;
- 	err =3D fuse_copy_one(cs, buf, outarg.namelen + 1);
- 	if (err)
- 		goto err;
- 	fuse_copy_finish(cs);
- 	buf[outarg.namelen] =3D 0;
-=20
- 	down_read(&fc->killsb);
- 	err =3D fuse_reverse_inval_entry(fc, outarg.parent, outarg.child, &name,=
 0);
- 	up_read(&fc->killsb);
- err:
- 	kfree(buf);
- 	return err;
- }
-=20
- static int fuse_notify_store(struct fuse_conn *fc, unsigned int size,
- 			     struct fuse_copy_state *cs)
- {
- 	struct fuse_notify_store_out outarg;
- 	struct inode *inode;
- 	struct address_space *mapping;
- 	u64 nodeid;
- 	int err;
- 	unsigned int num;
- 	loff_t file_size;
- 	loff_t pos;
- 	loff_t end;
-=20
- 	if (size < sizeof(outarg))
- 		return -EINVAL;
-=20
- 	err =3D fuse_copy_one(cs, &outarg, sizeof(outarg));
- 	if (err)
- 		return err;
-=20
- 	if (size - sizeof(outarg) !=3D outarg.size)
- 		return -EINVAL;
-=20
- 	if (outarg.offset >=3D MAX_LFS_FILESIZE)
- 		return -EINVAL;
-=20
- 	nodeid =3D outarg.nodeid;
- 	pos =3D outarg.offset;
- 	num =3D min(outarg.size, MAX_LFS_FILESIZE - pos);
-=20
- 	down_read(&fc->killsb);
-=20
- 	err =3D -ENOENT;
- 	inode =3D fuse_ilookup(fc, nodeid,  NULL);
- 	if (!inode)
- 		goto out_up_killsb;
-=20
- 	mapping =3D inode->i_mapping;
- 	file_size =3D i_size_read(inode);
- 	end =3D pos + num;
- 	if (end > file_size) {
- 		file_size =3D end;
- 		fuse_write_update_attr(inode, file_size, num);
- 	}
-=20
- 	while (num) {
- 		struct folio *folio;
- 		unsigned int folio_offset;
- 		unsigned int nr_bytes;
- 		pgoff_t index =3D pos >> PAGE_SHIFT;
-=20
- 		folio =3D filemap_grab_folio(mapping, index);
- 		err =3D PTR_ERR(folio);
- 		if (IS_ERR(folio))
- 			goto out_iput;
-=20
- 		folio_offset =3D offset_in_folio(folio, pos);
- 		nr_bytes =3D min(num, folio_size(folio) - folio_offset);
-=20
- 		err =3D fuse_copy_folio(cs, &folio, folio_offset, nr_bytes, 0);
- 		if (!folio_test_uptodate(folio) && !err && folio_offset =3D=3D 0 &&
- 		    (nr_bytes =3D=3D folio_size(folio) || file_size =3D=3D end)) {
- 			folio_zero_segment(folio, nr_bytes, folio_size(folio));
- 			folio_mark_uptodate(folio);
- 		}
- 		folio_unlock(folio);
- 		folio_put(folio);
-=20
- 		if (err)
- 			goto out_iput;
-=20
- 		pos +=3D nr_bytes;
- 		num -=3D nr_bytes;
- 	}
-=20
- 	err =3D 0;
-=20
- out_iput:
- 	iput(inode);
- out_up_killsb:
- 	up_read(&fc->killsb);
- 	return err;
- }
-=20
- struct fuse_retrieve_args {
- 	struct fuse_args_pages ap;
- 	struct fuse_notify_retrieve_in inarg;
- };
-=20
- static void fuse_retrieve_end(struct fuse_mount *fm, struct fuse_args *ar=
gs,
- 			      int error)
- {
- 	struct fuse_retrieve_args *ra =3D
- 		container_of(args, typeof(*ra), ap.args);
-=20
- 	release_pages(ra->ap.folios, ra->ap.num_folios);
- 	kfree(ra);
- }
-=20
- static int fuse_retrieve(struct fuse_mount *fm, struct inode *inode,
- 			 struct fuse_notify_retrieve_out *outarg)
- {
- 	int err;
- 	struct address_space *mapping =3D inode->i_mapping;
- 	loff_t file_size;
- 	unsigned int num;
- 	unsigned int offset;
- 	size_t total_len =3D 0;
- 	unsigned int num_pages;
- 	struct fuse_conn *fc =3D fm->fc;
- 	struct fuse_retrieve_args *ra;
- 	size_t args_size =3D sizeof(*ra);
- 	struct fuse_args_pages *ap;
- 	struct fuse_args *args;
- 	loff_t pos =3D outarg->offset;
-=20
- 	offset =3D offset_in_page(pos);
- 	file_size =3D i_size_read(inode);
-=20
- 	num =3D min(outarg->size, fc->max_write);
- 	if (pos > file_size)
- 		num =3D 0;
- 	else if (num > file_size - pos)
- 		num =3D file_size - pos;
-=20
- 	num_pages =3D DIV_ROUND_UP(num + offset, PAGE_SIZE);
- 	num_pages =3D min(num_pages, fc->max_pages);
- 	num =3D min(num, num_pages << PAGE_SHIFT);
-=20
- 	args_size +=3D num_pages * (sizeof(ap->folios[0]) + sizeof(ap->descs[0])=
);
-=20
- 	ra =3D kzalloc(args_size, GFP_KERNEL);
- 	if (!ra)
- 		return -ENOMEM;
-=20
- 	ap =3D &ra->ap;
- 	ap->folios =3D (void *) (ra + 1);
- 	ap->descs =3D (void *) (ap->folios + num_pages);
-=20
- 	args =3D &ap->args;
- 	args->nodeid =3D outarg->nodeid;
- 	args->opcode =3D FUSE_NOTIFY_REPLY;
- 	args->in_numargs =3D 3;
- 	args->in_pages =3D true;
- 	args->end =3D fuse_retrieve_end;
-=20
- 	while (num && ap->num_folios < num_pages) {
- 		struct folio *folio;
- 		unsigned int folio_offset;
- 		unsigned int nr_bytes;
- 		pgoff_t index =3D pos >> PAGE_SHIFT;
-=20
- 		folio =3D filemap_get_folio(mapping, index);
- 		if (IS_ERR(folio))
- 			break;
- 		if (!folio_test_uptodate(folio)) {
- 			folio_put(folio);
- 			break;
- 		}
-=20
- 		folio_offset =3D offset_in_folio(folio, pos);
- 		nr_bytes =3D min(folio_size(folio) - folio_offset, num);
-=20
- 		ap->folios[ap->num_folios] =3D folio;
- 		ap->descs[ap->num_folios].offset =3D folio_offset;
- 		ap->descs[ap->num_folios].length =3D nr_bytes;
- 		ap->num_folios++;
-=20
- 		pos +=3D nr_bytes;
- 		num -=3D nr_bytes;
- 		total_len +=3D nr_bytes;
- 	}
- 	ra->inarg.offset =3D outarg->offset;
- 	ra->inarg.size =3D total_len;
- 	fuse_set_zero_arg0(args);
- 	args->in_args[1].size =3D sizeof(ra->inarg);
- 	args->in_args[1].value =3D &ra->inarg;
- 	args->in_args[2].size =3D total_len;
-=20
- 	err =3D fuse_simple_notify_reply(fm, args, outarg->notify_unique);
- 	if (err)
- 		fuse_retrieve_end(fm, args, err);
-=20
- 	return err;
- }
-=20
- static int fuse_notify_retrieve(struct fuse_conn *fc, unsigned int size,
- 				struct fuse_copy_state *cs)
- {
- 	struct fuse_notify_retrieve_out outarg;
- 	struct fuse_mount *fm;
- 	struct inode *inode;
- 	u64 nodeid;
- 	int err;
-=20
- 	if (size !=3D sizeof(outarg))
- 		return -EINVAL;
-=20
- 	err =3D fuse_copy_one(cs, &outarg, sizeof(outarg));
- 	if (err)
- 		return err;
-=20
- 	fuse_copy_finish(cs);
-=20
- 	if (outarg.offset >=3D MAX_LFS_FILESIZE)
- 		return -EINVAL;
-=20
- 	down_read(&fc->killsb);
- 	err =3D -ENOENT;
- 	nodeid =3D outarg.nodeid;
-=20
- 	inode =3D fuse_ilookup(fc, nodeid, &fm);
- 	if (inode) {
- 		err =3D fuse_retrieve(fm, inode, &outarg);
- 		iput(inode);
- 	}
- 	up_read(&fc->killsb);
-=20
- 	return err;
- }
-=20
  /*
   * Resending all processing queue requests.
   *
@@@ -1991,21 -1766,21 +1766,21 @@@
   * if the FUSE daemon takes careful measures to avoid processing duplicat=
ed
   * non-idempotent requests.
   */
- static void fuse_resend(struct fuse_conn *fc)
+ void fuse_chan_resend(struct fuse_chan *fch)
  {
  	struct fuse_dev *fud;
  	struct fuse_req *req, *next;
- 	struct fuse_iqueue *fiq =3D &fc->iq;
+ 	struct fuse_iqueue *fiq =3D &fch->iq;
  	LIST_HEAD(to_queue);
  	unsigned int i;
 =20
- 	spin_lock(&fc->lock);
- 	if (!fc->connected) {
- 		spin_unlock(&fc->lock);
+ 	spin_lock(&fch->lock);
+ 	if (!fch->connected) {
+ 		spin_unlock(&fch->lock);
  		return;
  	}
 =20
- 	list_for_each_entry(fud, &fc->devices, entry) {
+ 	list_for_each_entry(fud, &fch->devices, entry) {
  		struct fuse_pqueue *fpq =3D &fud->pq;
 =20
  		spin_lock(&fpq->lock);
@@@ -2013,7 -1788,7 +1788,7 @@@
  			list_splice_tail_init(&fpq->processing[i], &to_queue);
  		spin_unlock(&fpq->lock);
  	}
- 	spin_unlock(&fc->lock);
+ 	spin_unlock(&fch->lock);
 =20
  	list_for_each_entry_safe(req, next, &to_queue, list) {
  		set_bit(FR_PENDING, &req->flags);
@@@ -2035,108 -1810,6 +1810,6 @@@
  	fuse_dev_wake_and_unlock(fiq);
  }
 =20
- static int fuse_notify_resend(struct fuse_conn *fc)
- {
- 	fuse_resend(fc);
- 	return 0;
- }
-=20
- /*
-  * Increments the fuse connection epoch.  This will result of dentries fr=
om
-  * previous epochs to be invalidated.  Additionally, if inval_wq is set, =
a work
-  * queue is scheduled to trigger the invalidation.
-  */
- static int fuse_notify_inc_epoch(struct fuse_conn *fc)
- {
- 	atomic_inc(&fc->epoch);
- 	if (inval_wq)
- 		schedule_work(&fc->epoch_work);
-=20
- 	return 0;
- }
-=20
- static int fuse_notify_prune(struct fuse_conn *fc, unsigned int size,
- 			     struct fuse_copy_state *cs)
- {
- 	struct fuse_notify_prune_out outarg;
- 	const unsigned int batch =3D 512;
- 	u64 *nodeids __free(kfree) =3D kmalloc(sizeof(u64) * batch, GFP_KERNEL);
- 	unsigned int num, i;
- 	int err;
-=20
- 	if (!nodeids)
- 		return -ENOMEM;
-=20
- 	if (size < sizeof(outarg))
- 		return -EINVAL;
-=20
- 	err =3D fuse_copy_one(cs, &outarg, sizeof(outarg));
- 	if (err)
- 		return err;
-=20
- 	if (size - sizeof(outarg) !=3D outarg.count * sizeof(u64))
- 		return -EINVAL;
-=20
- 	for (; outarg.count; outarg.count -=3D num) {
- 		num =3D min(batch, outarg.count);
- 		err =3D fuse_copy_one(cs, nodeids, num * sizeof(u64));
- 		if (err)
- 			return err;
-=20
- 		scoped_guard(rwsem_read, &fc->killsb) {
- 			for (i =3D 0; i < num; i++)
- 				fuse_try_prune_one_inode(fc, nodeids[i]);
- 		}
- 	}
- 	return 0;
- }
-=20
- static int fuse_notify(struct fuse_conn *fc, enum fuse_notify_code code,
- 		       unsigned int size, struct fuse_copy_state *cs)
- {
- 	/*
- 	 * Only allow notifications during while the connection is in an
- 	 * initialized and connected state
- 	 */
- 	if (!fc->initialized || !fc->connected)
- 		return -EINVAL;
-=20
- 	/* Don't try to move folios (yet) */
- 	cs->move_folios =3D false;
-=20
- 	switch (code) {
- 	case FUSE_NOTIFY_POLL:
- 		return fuse_notify_poll(fc, size, cs);
-=20
- 	case FUSE_NOTIFY_INVAL_INODE:
- 		return fuse_notify_inval_inode(fc, size, cs);
-=20
- 	case FUSE_NOTIFY_INVAL_ENTRY:
- 		return fuse_notify_inval_entry(fc, size, cs);
-=20
- 	case FUSE_NOTIFY_STORE:
- 		return fuse_notify_store(fc, size, cs);
-=20
- 	case FUSE_NOTIFY_RETRIEVE:
- 		return fuse_notify_retrieve(fc, size, cs);
-=20
- 	case FUSE_NOTIFY_DELETE:
- 		return fuse_notify_delete(fc, size, cs);
-=20
- 	case FUSE_NOTIFY_RESEND:
- 		return fuse_notify_resend(fc);
-=20
- 	case FUSE_NOTIFY_INC_EPOCH:
- 		return fuse_notify_inc_epoch(fc);
-=20
- 	case FUSE_NOTIFY_PRUNE:
- 		return fuse_notify_prune(fc, size, cs);
-=20
- 	default:
- 		return -EINVAL;
- 	}
- }
-=20
  /* Look up request on processing list by unique ID */
  struct fuse_req *fuse_request_find(struct fuse_pqueue *fpq, u64 unique)
  {
@@@ -2189,7 -1862,7 +1862,7 @@@ static ssize_t fuse_dev_do_write(struc
  				 struct fuse_copy_state *cs, size_t nbytes)
  {
  	int err;
- 	struct fuse_conn *fc =3D fud->fc;
+ 	struct fuse_chan *fch =3D fud->chan;
  	struct fuse_pqueue *fpq =3D &fud->pq;
  	struct fuse_req *req;
  	struct fuse_out_header oh;
@@@ -2211,7 -1884,18 +1884,18 @@@
  	 * and error contains notification code.
  	 */
  	if (!oh.unique) {
- 		err =3D fuse_notify(fc, oh.error, nbytes - sizeof(oh), cs);
+ 		/*
+ 		 * Only allow notifications during while the connection is in an
+ 		 * initialized and connected state
+ 		 */
+ 		err =3D -EINVAL;
+ 		if (!fch->initialized || !fch->connected)
+ 			goto copy_finish;
+=20
+ 		/* Don't try to move folios (yet) */
+ 		cs->move_folios =3D false;
+=20
+ 		err =3D fuse_notify(fch->conn, oh.error, nbytes - sizeof(oh), cs);
  		goto copy_finish;
  	}
 =20
@@@ -2239,7 -1923,7 +1923,7 @@@
  		if (nbytes !=3D sizeof(struct fuse_out_header))
  			err =3D -EINVAL;
  		else if (oh.error =3D=3D -ENOSYS)
- 			fc->no_interrupt =3D 1;
+ 			fch->no_interrupt =3D 1;
  		else if (oh.error =3D=3D -EAGAIN)
  			err =3D queue_interrupt(req);
 =20
@@@ -2399,7 -2083,7 +2083,7 @@@ static __poll_t fuse_dev_poll(struct fi
  	if (IS_ERR(fud))
  		return EPOLLERR;
 =20
- 	fiq =3D &fud->fc->iq;
+ 	fiq =3D &fud->chan->iq;
  	poll_wait(file, &fiq->waitq, wait);
 =20
  	spin_lock(&fiq->lock);
@@@ -2425,21 -2109,6 +2109,6 @@@ void fuse_dev_end_requests(struct list_
  	}
  }
 =20
- static void end_polls(struct fuse_conn *fc)
- {
- 	struct rb_node *p;
-=20
- 	p =3D rb_first(&fc->polled_files);
-=20
- 	while (p) {
- 		struct fuse_file *ff;
- 		ff =3D rb_entry(p, struct fuse_file, polled_node);
- 		wake_up_interruptible_all(&ff->poll_wait);
-=20
- 		p =3D rb_next(p);
- 	}
- }
-=20
  /*
   * Abort all requests.
   *
@@@ -2458,27 -2127,29 +2127,29 @@@
   * is OK, the request will in that case be removed from the list before w=
e touch
   * it.
   */
- void fuse_abort_conn(struct fuse_conn *fc)
+ void fuse_chan_abort(struct fuse_chan *fch, bool abort_with_err)
  {
- 	struct fuse_iqueue *fiq =3D &fc->iq;
+ 	struct fuse_iqueue *fiq =3D &fch->iq;
 =20
- 	spin_lock(&fc->lock);
- 	if (fc->connected) {
+ 	fch->abort_with_err =3D abort_with_err;
+=20
+ 	spin_lock(&fch->lock);
+ 	if (fch->connected) {
  		struct fuse_dev *fud;
  		struct fuse_req *req, *next;
  		LIST_HEAD(to_end);
  		unsigned int i;
 =20
- 		if (fc->timeout.req_timeout)
- 			cancel_delayed_work(&fc->timeout.work);
+ 		if (fch->timeout.req_timeout)
+ 			cancel_delayed_work(&fch->timeout.work);
 =20
- 		/* Background queuing checks fc->connected under bg_lock */
- 		spin_lock(&fc->bg_lock);
- 		fc->connected =3D 0;
- 		spin_unlock(&fc->bg_lock);
+ 		/* Background queuing checks fch->connected under bg_lock */
+ 		spin_lock(&fch->bg_lock);
+ 		fch->connected =3D 0;
+ 		spin_unlock(&fch->bg_lock);
 =20
- 		fuse_set_initialized(fc);
- 		list_for_each_entry(fud, &fc->devices, entry) {
+ 		fuse_chan_set_initialized(fch, 0);
+ 		list_for_each_entry(fud, &fch->devices, entry) {
  			struct fuse_pqueue *fpq =3D &fud->pq;
 =20
  			spin_lock(&fpq->lock);
@@@ -2499,11 -2170,11 +2170,11 @@@
  						      &to_end);
  			spin_unlock(&fpq->lock);
  		}
- 		spin_lock(&fc->bg_lock);
- 		fc->blocked =3D 0;
- 		fc->max_background =3D UINT_MAX;
- 		flush_bg_queue(fc);
- 		spin_unlock(&fc->bg_lock);
+ 		spin_lock(&fch->bg_lock);
+ 		fch->blocked =3D 0;
+ 		fch->max_background =3D UINT_MAX;
+ 		flush_bg_queue(fch);
+ 		spin_unlock(&fch->bg_lock);
 =20
  		spin_lock(&fiq->lock);
  		fiq->connected =3D 0;
@@@ -2515,39 -2186,39 +2186,39 @@@
  		wake_up_all(&fiq->waitq);
  		spin_unlock(&fiq->lock);
  		kill_fasync(&fiq->fasync, SIGIO, POLL_IN);
- 		end_polls(fc);
- 		wake_up_all(&fc->blocked_waitq);
- 		spin_unlock(&fc->lock);
+ 		fuse_end_polls(fch->conn);
+ 		wake_up_all(&fch->blocked_waitq);
+ 		spin_unlock(&fch->lock);
 =20
  		fuse_dev_end_requests(&to_end);
 =20
  		/*
- 		 * fc->lock must not be taken to avoid conflicts with io-uring
+ 		 * fch->lock must not be taken to avoid conflicts with io-uring
  		 * locks
  		 */
- 		fuse_uring_abort(fc);
+ 		fuse_uring_abort(fch);
  	} else {
- 		spin_unlock(&fc->lock);
+ 		spin_unlock(&fch->lock);
  	}
  }
- EXPORT_SYMBOL_GPL(fuse_abort_conn);
+ EXPORT_SYMBOL_GPL(fuse_chan_abort);
 =20
- void fuse_wait_aborted(struct fuse_conn *fc)
+ void fuse_chan_wait_aborted(struct fuse_chan *fch)
  {
  	/* matches implicit memory barrier in fuse_drop_waiting() */
  	smp_mb();
- 	wait_event(fc->blocked_waitq, atomic_read(&fc->num_waiting) =3D=3D 0);
+ 	wait_event(fch->blocked_waitq, fuse_chan_num_waiting(fch) =3D=3D 0);
 =20
- 	fuse_uring_wait_stopped_queues(fc);
+ 	fuse_uring_wait_stopped_queues(fch);
  }
 =20
  int fuse_dev_release(struct inode *inode, struct file *file)
  {
  	struct fuse_dev *fud =3D fuse_file_to_fud(file);
  	/* Pairs with cmpxchg() in fuse_dev_install() */
- 	struct fuse_conn *fc =3D xchg(&fud->fc, FUSE_DEV_FC_DISCONNECTED);
+ 	struct fuse_chan *fch =3D xchg(&fud->chan, FUSE_DEV_CHAN_DISCONNECTED);
 =20
- 	if (fc) {
+ 	if (fch) {
  		struct fuse_pqueue *fpq =3D &fud->pq;
  		LIST_HEAD(to_end);
  		unsigned int i;
@@@ -2561,17 -2232,17 +2232,17 @@@
 =20
  		fuse_dev_end_requests(&to_end);
 =20
- 		spin_lock(&fc->lock);
+ 		spin_lock(&fch->lock);
  		list_del(&fud->entry);
  		/* Are we the last open device? */
- 		last =3D list_empty(&fc->devices);
- 		spin_unlock(&fc->lock);
+ 		last =3D list_empty(&fch->devices);
+ 		spin_unlock(&fch->lock);
 =20
  		if (last) {
- 			WARN_ON(fc->iq.fasync !=3D NULL);
- 			fuse_abort_conn(fc);
+ 			WARN_ON(fch->iq.fasync !=3D NULL);
+ 			fuse_chan_abort(fch, false);
  		}
- 		fuse_conn_put(fc);
+ 		fuse_conn_put(fch->conn);
  	}
  	fuse_dev_put(fud);
  	return 0;
@@@ -2586,13 -2257,14 +2257,14 @@@ static int fuse_dev_fasync(int fd, stru
  		return PTR_ERR(fud);
 =20
  	/* No locking - fasync_helper does its own locking */
- 	return fasync_helper(fd, file, on, &fud->fc->iq.fasync);
+ 	return fasync_helper(fd, file, on, &fud->chan->iq.fasync);
  }
 =20
  static long fuse_dev_ioctl_clone(struct file *file, __u32 __user *argp)
  {
  	int oldfd;
  	struct fuse_dev *fud, *new_fud;
+ 	struct list_head *pq;
 =20
  	if (get_user(oldfd, argp))
  		return -EFAULT;
@@@ -2612,11 -2284,13 +2284,13 @@@
  	if (IS_ERR(fud))
  		return PTR_ERR(fud);
 =20
- 	new_fud =3D fuse_file_to_fud(file);
- 	if (fuse_dev_fc_get(new_fud))
- 		return -EINVAL;
+ 	pq =3D fuse_pqueue_alloc();
+ 	if (!pq)
+ 		return -ENOMEM;
 =20
- 	fuse_dev_install(new_fud, fud->fc);
+ 	new_fud =3D fuse_file_to_fud(file);
+ 	if (!fuse_dev_install_with_pq(new_fud, fud->chan, pq))
+ 		return -EINVAL;
 =20
  	return 0;
  }
@@@ -2636,7 -2310,7 +2310,7 @@@ static long fuse_dev_ioctl_backing_open
  	if (copy_from_user(&map, argp, sizeof(map)))
  		return -EFAULT;
 =20
- 	return fuse_backing_open(fud->fc, &map);
+ 	return fuse_backing_open(fud->chan->conn, &map);
  }
 =20
  static long fuse_dev_ioctl_backing_close(struct file *file, __u32 __user =
*argp)
@@@ -2653,21 -2327,18 +2327,18 @@@
  	if (get_user(backing_id, argp))
  		return -EFAULT;
 =20
- 	return fuse_backing_close(fud->fc, backing_id);
+ 	return fuse_backing_close(fud->chan->conn, backing_id);
  }
 =20
  static long fuse_dev_ioctl_sync_init(struct file *file)
  {
- 	int err =3D -EINVAL;
  	struct fuse_dev *fud =3D fuse_file_to_fud(file);
 =20
- 	mutex_lock(&fuse_mutex);
- 	if (!fuse_dev_fc_get(fud)) {
- 		fud->sync_init =3D true;
- 		err =3D 0;
- 	}
- 	mutex_unlock(&fuse_mutex);
- 	return err;
+ 	if (fuse_dev_chan_get(fud))
+ 		return -EINVAL;
+=20
+ 	fud->sync_init =3D true;
+ 	return 0;
  }
 =20
  static long fuse_dev_ioctl(struct file *file, unsigned int cmd,
@@@ -2700,7 -2371,7 +2371,7 @@@ static void fuse_dev_show_fdinfo(struc
  	if (!fud)
  		return;
 =20
- 	seq_printf(seq, "fuse_connection:\t%u\n", fud->fc->dev);
+ 	seq_printf(seq, "fuse_connection:\t%u\n", fuse_conn_get_id(fud->chan->co=
nn));
  }
  #endif
 =20

--0iIF4C4eYh0lTPzI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoQOGsACgkQJNaLcl1U
h9A63Af+Mp3RxjTtjbM4mYiMM1TwRp6szdeeZEZjUE8FKnqLCUejtRixe6H7TVFN
ukjakm/6IQQda8yC0Dn5xyq+JA3Id5tOGeWPyGm3zhzJwpyiUzsJmfU63Dp4v1fT
i6soLH1i+bD4T6n0ZpdEFoayHyvlxOI+VYEVXB1g8pGCPFih10mtCUKJyNDKXPzc
0JnT9ynyozJ52KlrzJ8nOPHYqVQNj5lIHokylck++0QJuniMuqTIdi6lEuKvtKJT
yHGtMeOS0JqJcWmbBj6QCl5wMUStpc3C5HsoCS6SJTZ4oDJPtX2vLwubCyo0Z1vj
4nu5fGcwkIOEvp2BEIbAtjISIidOFQ==
=gyA+
-----END PGP SIGNATURE-----

--0iIF4C4eYh0lTPzI--
