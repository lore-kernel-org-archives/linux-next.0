From: Michele CURTI <michele.curti@gmail.com>
Subject: [PATCH v2 1/2] drm/radeon: use NULL instead of zero in object
 functions
Date: Mon, 5 May 2014 22:29:55 +0200
Message-ID: <20140505202955.GB404@ativ>
References: <20140503135512.GA17068@ativ>
 <A3397C8B8B789E45844E7EC5DEAD89D040EEF93D@satlexdag05.amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ee0-f42.google.com ([74.125.83.42]:47870 "EHLO
	mail-ee0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752330AbaEEU37 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 May 2014 16:29:59 -0400
Received: by mail-ee0-f42.google.com with SMTP id d49so1745502eek.1
        for <linux-next@vger.kernel.org>; Mon, 05 May 2014 13:29:58 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <A3397C8B8B789E45844E7EC5DEAD89D040EEF93D@satlexdag05.amd.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>, "airlied@linux.ie" <airlied@linux.ie>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

drm/radeon: use NULL instead of zero in object functions

Signed-off-by: Michele Curti <michele.curti@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_object.c | 2 +-
 drivers/gpu/drm/radeon/radeon_object.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index 19bec0d..95197aa 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -722,7 +722,7 @@ int radeon_bo_wait(struct radeon_bo *bo, u32 *mem_type, bool no_wait)
 {
 	int r;
 
-	r = ttm_bo_reserve(&bo->tbo, true, no_wait, false, 0);
+	r = ttm_bo_reserve(&bo->tbo, true, no_wait, false, NULL);
 	if (unlikely(r != 0))
 		return r;
 	spin_lock(&bo->tbo.bdev->fence_lock);
diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/radeon/radeon_object.h
index 9e7b25a..5a873f3 100644
--- a/drivers/gpu/drm/radeon/radeon_object.h
+++ b/drivers/gpu/drm/radeon/radeon_object.h
@@ -65,7 +65,7 @@ static inline int radeon_bo_reserve(struct radeon_bo *bo, bool no_intr)
 {
 	int r;
 
-	r = ttm_bo_reserve(&bo->tbo, !no_intr, false, false, 0);
+	r = ttm_bo_reserve(&bo->tbo, !no_intr, false, false, NULL);
 	if (unlikely(r != 0)) {
 		if (r != -ERESTARTSYS)
 			dev_err(bo->rdev->dev, "%p reserve failed\n", bo);
-- 
1.9.2
