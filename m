From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the drm tree
Date: Thu, 17 Mar 2016 13:00:29 +1100
Message-ID: <20160317130029.5569b2f4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56608 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752581AbcCQCAc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Mar 2016 22:00:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Dave Hansen <dave.hansen@linux.intel.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c

between commit:

  637dd3b5ca9e ("drm/amdgpu: prevent get_user_pages recursion")

from the drm tree and commit:

  d4edcf0d5695 ("mm/gup: Switch all callers of get_user_pages() to not pass tsk/mm")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 0f42b1a24446,7b82e57aa09c..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@@ -532,21 -516,9 +532,20 @@@ int amdgpu_ttm_tt_get_user_pages(struc
  	do {
  		unsigned num_pages = ttm->num_pages - pinned;
  		uint64_t userptr = gtt->userptr + pinned * PAGE_SIZE;
 -		struct page **pages = ttm->pages + pinned;
 +		struct page **p = pages + pinned;
 +		struct amdgpu_ttm_gup_task_list guptask;
 +
 +		guptask.task = current;
 +		spin_lock(&gtt->guptasklock);
 +		list_add(&guptask.list, &gtt->guptasks);
 +		spin_unlock(&gtt->guptasklock);
  
- 		r = get_user_pages(current, current->mm, userptr, num_pages,
- 				   write, 0, p, NULL);
+ 		r = get_user_pages(userptr, num_pages, write, 0, pages, NULL);
 +
 +		spin_lock(&gtt->guptasklock);
 +		list_del(&guptask.list);
 +		spin_unlock(&gtt->guptasklock);
 +
  		if (r < 0)
  			goto release_pages;
  
