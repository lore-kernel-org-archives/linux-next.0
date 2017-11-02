From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the drm tree
Date: Thu, 2 Nov 2017 18:32:20 +1100
Message-ID: <20171102183220.3c0e852c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41537 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751321AbdKBHcW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 2 Nov 2017 03:32:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mel Gorman <mgorman@techsingularity.net>, Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got conflicts in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c

between commits:

  b72cf4fca2bb ("drm/amdgpu: move taking mmap_sem into get_user_pages v2")
  ca666a3c298f ("drm/amdgpu: stop using BO status for user pages")

from the drm tree and commit:

  b7e8af45222b ("mm: remove cold parameter for release_pages")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index f7fceb63413c,cd664832f9e8..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@@ -562,8 -553,7 +562,7 @@@ static int amdgpu_cs_parser_bos(struct 
  				 * invalidated it. Free it and try again
  				 */
  				release_pages(e->user_pages,
- 					      bo->tbo.ttm->num_pages,
- 					      false);
 -					      e->robj->tbo.ttm->num_pages);
++					      bo->tbo.ttm->num_pages);
  				kvfree(e->user_pages);
  				e->user_pages = NULL;
  			}
diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 51eacefadea1,d792959fac43..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@@ -746,8 -659,7 +746,8 @@@ int amdgpu_ttm_tt_get_user_pages(struc
  	return 0;
  
  release_pages:
- 	release_pages(pages, pinned, 0);
+ 	release_pages(pages, pinned);
 +	up_read(&current->mm->mmap_sem);
  	return r;
  }
  
