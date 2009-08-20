From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Thu, 20 Aug 2009 15:27:43 +1000
Message-ID: <20090820152743.a5f1088b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753346AbZHTF1p@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Hellstrom <thellstrom@vmware.com>
List-Id: linux-next.vger.kernel.org

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in
drivers/gpu/drm/radeon/radeon_ttm.c between commit
ad49f501867cba87e1e45e5ebae0b12435d68bf1 ("drm/ttm/radeon: add dma32
support") from Linus' tree and commit
a987fcaa805fcb24ba885c2e29fd4fdb6816f08f ("ttm: Make parts of a struct
ttm_bo_device global") from the drm tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/radeon/radeon_ttm.c
index 15c3531,343b6d6..0000000
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@@ -446,9 -462,8 +467,9 @@@ int radeon_ttm_init(struct radeon_devic
  	}
  	/* No others user of address space so set it to 0 */
  	r = ttm_bo_device_init(&rdev->mman.bdev,
- 			       rdev->mman.mem_global_ref.object,
+ 			       rdev->mman.bo_global_ref.ref.object,
 -			       &radeon_bo_driver, DRM_FILE_PAGE_OFFSET);
 +			       &radeon_bo_driver, DRM_FILE_PAGE_OFFSET,
 +			       rdev->need_dma32);
  	if (r) {
  		DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
  		return r;
