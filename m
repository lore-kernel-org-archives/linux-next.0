From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the drm tree
Date: Wed, 1 Feb 2017 14:38:25 +1100
Message-ID: <20170201143825.43aa2f7a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40319 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750825AbdBADi2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 31 Jan 2017 22:38:28 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@amd.com>, Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/gpu/drm/ttm/ttm_bo.c

between commit:

  239ac65fa5ff ("drm/ttm: Make sure BOs being swapped out are cacheable")

from the drm tree and commit:

  bdfafc4ffdd2 ("locking/atomic, kref: Kill kref_sub()")
  cf6c467d67d3 ("drm/ttm: add BO priorities for the LRUs")
  896d630d240e ("drm/ttm: revert "add optional LRU removal callback v2"")

from the tip tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/ttm/ttm_bo.c
index 4562e53c8244,ffc6cb55c78c..000000000000
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@@ -184,37 -181,26 +184,26 @@@ void ttm_bo_add_to_lru(struct ttm_buffe
  }
  EXPORT_SYMBOL(ttm_bo_add_to_lru);
  
- int ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
+ static void ttm_bo_ref_bug(struct kref *list_kref)
  {
- 	int put_count = 0;
+ 	BUG();
+ }
  
+ void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
+ {
 -	struct ttm_bo_device *bdev = bo->bdev;
 -
 -	if (bdev->driver->lru_removal)
 -		bdev->driver->lru_removal(bo);
 -
  	if (!list_empty(&bo->swap)) {
  		list_del_init(&bo->swap);
- 		++put_count;
+ 		kref_put(&bo->list_kref, ttm_bo_ref_bug);
  	}
  	if (!list_empty(&bo->lru)) {
  		list_del_init(&bo->lru);
- 		++put_count;
+ 		kref_put(&bo->list_kref, ttm_bo_ref_bug);
  	}
 +
 +	/*
 +	 * TODO: Add a driver hook to delete from
 +	 * driver-specific LRU's here.
 +	 */
- 
- 	return put_count;
- }
- 
- static void ttm_bo_ref_bug(struct kref *list_kref)
- {
- 	BUG();
- }
- 
- void ttm_bo_list_ref_sub(struct ttm_buffer_object *bo, int count,
- 			 bool never_free)
- {
- 	kref_sub(&bo->list_kref, count,
- 		 (never_free) ? ttm_bo_ref_bug : ttm_bo_release_list);
  }
  
  void ttm_bo_del_sub_from_lru(struct ttm_buffer_object *bo)
@@@ -230,12 -213,14 +216,9 @@@ EXPORT_SYMBOL(ttm_bo_del_sub_from_lru)
  
  void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo)
  {
- 	int put_count = 0;
 -	struct ttm_bo_device *bdev = bo->bdev;
--
  	lockdep_assert_held(&bo->resv->lock.base);
  
- 	put_count = ttm_bo_del_from_lru(bo);
- 	ttm_bo_list_ref_sub(bo, put_count, true);
 -	if (bdev->driver->lru_removal)
 -		bdev->driver->lru_removal(bo);
 -
+ 	ttm_bo_del_from_lru(bo);
  	ttm_bo_add_to_lru(bo);
  }
  EXPORT_SYMBOL(ttm_bo_move_to_lru_tail);
@@@ -728,28 -718,21 +704,28 @@@ static int ttm_mem_evict_first(struct t
  	struct ttm_bo_global *glob = bdev->glob;
  	struct ttm_mem_type_manager *man = &bdev->man[mem_type];
  	struct ttm_buffer_object *bo;
- 	int ret = -EBUSY, put_count;
+ 	int ret = -EBUSY;
 +	unsigned i;
  
  	spin_lock(&glob->lru_lock);
 -	list_for_each_entry(bo, &man->lru, lru) {
 -		ret = __ttm_bo_reserve(bo, false, true, NULL);
 -		if (ret)
 -			continue;
 +	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
 +		list_for_each_entry(bo, &man->lru[i], lru) {
 +			ret = __ttm_bo_reserve(bo, false, true, NULL);
 +			if (ret)
 +				continue;
  
 -		if (place && !bdev->driver->eviction_valuable(bo, place)) {
 -			__ttm_bo_unreserve(bo);
 -			ret = -EBUSY;
 -			continue;
 +			if (place && !bdev->driver->eviction_valuable(bo,
 +								      place)) {
 +				__ttm_bo_unreserve(bo);
 +				ret = -EBUSY;
 +				continue;
 +			}
 +
 +			break;
  		}
  
 -		break;
 +		if (!ret)
 +			break;
  	}
  
  	if (ret) {
@@@ -1667,16 -1645,11 +1641,15 @@@ static int ttm_bo_swapout(struct ttm_me
  	    container_of(shrink, struct ttm_bo_global, shrink);
  	struct ttm_buffer_object *bo;
  	int ret = -EBUSY;
- 	int put_count;
 -	uint32_t swap_placement = (TTM_PL_FLAG_CACHED | TTM_PL_FLAG_SYSTEM);
 +	unsigned i;
  
  	spin_lock(&glob->lru_lock);
 -	list_for_each_entry(bo, &glob->swap_lru, swap) {
 -		ret = __ttm_bo_reserve(bo, false, true, NULL);
 +	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
 +		list_for_each_entry(bo, &glob->swap_lru[i], swap) {
 +			ret = __ttm_bo_reserve(bo, false, true, NULL);
 +			if (!ret)
 +				break;
 +		}
  		if (!ret)
  			break;
  	}
