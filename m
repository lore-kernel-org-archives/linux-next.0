From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rcu tree with Linus' tree
Date: Wed, 8 Mar 2017 11:46:33 +1100
Message-ID: <20170308114633.42cc839c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54987 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933425AbdCHA4H (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Mar 2017 19:56:07 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>

Hi Paul,

Today's linux-next merge of the rcu tree got a conflict in:

  mm/slab_common.c

between commit:

  657dc2f97220 ("slab: remove synchronous rcu_barrier() call in memcg cache release path")

from Linus' tree and commit:

  24b7cb25b8d1 ("mm: Rename SLAB_DESTROY_BY_RCU to SLAB_TYPESAFE_BY_RCU")

from the rcu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc mm/slab_common.c
index 09d0e849b07f,296413c2bbcd..000000000000
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@@ -494,55 -458,29 +494,56 @@@ out_unlock
  }
  EXPORT_SYMBOL(kmem_cache_create);
  
 -static int shutdown_cache(struct kmem_cache *s,
 -		struct list_head *release, bool *need_rcu_barrier)
 +static void slab_caches_to_rcu_destroy_workfn(struct work_struct *work)
  {
 -	if (__kmem_cache_shutdown(s) != 0)
 -		return -EBUSY;
 +	LIST_HEAD(to_destroy);
 +	struct kmem_cache *s, *s2;
 +
 +	/*
- 	 * On destruction, SLAB_DESTROY_BY_RCU kmem_caches are put on the
++	 * On destruction, SLAB_TYPESAFE_BY_RCU kmem_caches are put on the
 +	 * @slab_caches_to_rcu_destroy list.  The slab pages are freed
 +	 * through RCU and and the associated kmem_cache are dereferenced
 +	 * while freeing the pages, so the kmem_caches should be freed only
 +	 * after the pending RCU operations are finished.  As rcu_barrier()
 +	 * is a pretty slow operation, we batch all pending destructions
 +	 * asynchronously.
 +	 */
 +	mutex_lock(&slab_mutex);
 +	list_splice_init(&slab_caches_to_rcu_destroy, &to_destroy);
 +	mutex_unlock(&slab_mutex);
 +
 +	if (list_empty(&to_destroy))
 +		return;
  
- 	rcu_barrier();
+ 	if (s->flags & SLAB_TYPESAFE_BY_RCU)
+ 		*need_rcu_barrier = true;
  
 -	list_move(&s->list, release);
 -	return 0;
 +	list_for_each_entry_safe(s, s2, &to_destroy, list) {
 +#ifdef SLAB_SUPPORTS_SYSFS
 +		sysfs_slab_release(s);
 +#else
 +		slab_kmem_cache_release(s);
 +#endif
 +	}
  }
  
 -static void release_caches(struct list_head *release, bool need_rcu_barrier)
 +static int shutdown_cache(struct kmem_cache *s)
  {
 -	struct kmem_cache *s, *s2;
 +	/* free asan quarantined objects */
 +	kasan_cache_shutdown(s);
  
 -	if (need_rcu_barrier)
 -		rcu_barrier();
 +	if (__kmem_cache_shutdown(s) != 0)
 +		return -EBUSY;
  
 -	list_for_each_entry_safe(s, s2, release, list) {
 +	memcg_unlink_cache(s);
 +	list_del(&s->list);
 +
- 	if (s->flags & SLAB_DESTROY_BY_RCU) {
++	if (s->flags & SLAB_TYPESAFE_BY_RCU) {
 +		list_add_tail(&s->list, &slab_caches_to_rcu_destroy);
 +		schedule_work(&slab_caches_to_rcu_destroy_work);
 +	} else {
  #ifdef SLAB_SUPPORTS_SYSFS
 -		sysfs_slab_remove(s);
 +		sysfs_slab_release(s);
  #else
  		slab_kmem_cache_release(s);
  #endif
