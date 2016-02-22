From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm tree
Date: Mon, 22 Feb 2016 11:45:55 +1100
Message-ID: <20160222114555.2dcebd3d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54017 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752434AbcBVAp4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 21 Feb 2016 19:45:56 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Dave,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:818:6: error: redefinition of 'amdgpu_ttm_tt_affect_userptr'
 bool amdgpu_ttm_tt_affect_userptr(struct ttm_tt *ttm, unsigned long start,
      ^
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:799:6: note: previous definition of 'amdgpu_ttm_tt_affect_userptr' was here
 bool amdgpu_ttm_tt_affect_userptr(struct ttm_tt *ttm, unsigned long start,
      ^

Caused by a bad git resolution in commit

  971f3e7dd355 ("Merge remote-tracking branch 'drm/drm-next'")

I have added the following as a merge fix up patch and can carry it
as necessary.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 22 Feb 2016 11:40:08 +1100
Subject: [PATCH] drm: fix bad merge of drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index b3e90cd91496..9ccdd189d717 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -815,25 +815,6 @@ bool amdgpu_ttm_tt_affect_userptr(struct ttm_tt *ttm, unsigned long start,
 	return true;
 }
 
-bool amdgpu_ttm_tt_affect_userptr(struct ttm_tt *ttm, unsigned long start,
-				  unsigned long end)
-{
-	struct amdgpu_ttm_tt *gtt = (void *)ttm;
-	unsigned long size;
-
-	if (gtt == NULL)
-		return false;
-
-	if (gtt->ttm.ttm.state != tt_bound || !gtt->userptr)
-		return false;
-
-	size = (unsigned long)gtt->ttm.ttm.num_pages * PAGE_SIZE;
-	if (gtt->userptr > end || gtt->userptr + size <= start)
-		return false;
-
-	return true;
-}
-
 bool amdgpu_ttm_tt_is_readonly(struct ttm_tt *ttm)
 {
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
-- 
2.7.0

-- 
Cheers,
Stephen Rothwell
