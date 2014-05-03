From: Michele CURTI <michele.curti@gmail.com>
Subject: [PATCH] drm/radeon: use NULL instead of zero
Date: Sat, 3 May 2014 15:55:12 +0200
Message-ID: <20140503135512.GA17068@ativ>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ee0-f44.google.com ([74.125.83.44]:49969 "EHLO
	mail-ee0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751202AbaECNzQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 3 May 2014 09:55:16 -0400
Received: by mail-ee0-f44.google.com with SMTP id c41so3896319eek.31
        for <linux-next@vger.kernel.org>; Sat, 03 May 2014 06:55:15 -0700 (PDT)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie
Cc: linux-next@vger.kernel.org


Use NULL instead of zero for NULL pointers

Signed-off-by: Michele Curti <michele.curti@gmail.com>
---
 drivers/gpu/drm/radeon/clearstate_cayman.h | 8 ++++----
 drivers/gpu/drm/radeon/clearstate_ci.h     | 4 ++--
 drivers/gpu/drm/radeon/clearstate_si.h     | 4 ++--
 drivers/gpu/drm/radeon/radeon_object.c     | 2 +-
 drivers/gpu/drm/radeon/radeon_object.h     | 2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/radeon/clearstate_cayman.h b/drivers/gpu/drm/radeon/clearstate_cayman.h
index aa908c5..ee428ac 100644
--- a/drivers/gpu/drm/radeon/clearstate_cayman.h
+++ b/drivers/gpu/drm/radeon/clearstate_cayman.h
@@ -1050,7 +1050,7 @@ static const struct cs_extent_def SECT_CONTEXT_defs[] =
     {SECT_CONTEXT_def_5, 0x0000a29e, 5 },
     {SECT_CONTEXT_def_6, 0x0000a2a5, 56 },
     {SECT_CONTEXT_def_7, 0x0000a2de, 290 },
-    { 0, 0, 0 }
+    {NULL, 0, 0 }
 };
 static const u32 SECT_CLEAR_def_1[] =
 {
@@ -1061,7 +1061,7 @@ static const u32 SECT_CLEAR_def_1[] =
 static const struct cs_extent_def SECT_CLEAR_defs[] =
 {
     {SECT_CLEAR_def_1, 0x0000ffc0, 3 },
-    { 0, 0, 0 }
+    {NULL, 0, 0 }
 };
 static const u32 SECT_CTRLCONST_def_1[] =
 {
@@ -1071,11 +1071,11 @@ static const u32 SECT_CTRLCONST_def_1[] =
 static const struct cs_extent_def SECT_CTRLCONST_defs[] =
 {
     {SECT_CTRLCONST_def_1, 0x0000f3fc, 2 },
-    { 0, 0, 0 }
+    {NULL, 0, 0 }
 };
 static const struct cs_section_def cayman_cs_data[] = {
     { SECT_CONTEXT_defs, SECT_CONTEXT },
     { SECT_CLEAR_defs, SECT_CLEAR },
     { SECT_CTRLCONST_defs, SECT_CTRLCONST },
-    { 0, SECT_NONE }
+    { NULL, SECT_NONE }
 };
diff --git a/drivers/gpu/drm/radeon/clearstate_ci.h b/drivers/gpu/drm/radeon/clearstate_ci.h
index c3982f9..1673c34 100644
--- a/drivers/gpu/drm/radeon/clearstate_ci.h
+++ b/drivers/gpu/drm/radeon/clearstate_ci.h
@@ -936,9 +936,9 @@ static const struct cs_extent_def ci_SECT_CONTEXT_defs[] =
     {ci_SECT_CONTEXT_def_5, 0x0000a2a0, 2 },
     {ci_SECT_CONTEXT_def_6, 0x0000a2a3, 1 },
     {ci_SECT_CONTEXT_def_7, 0x0000a2a5, 233 },
-    { 0, 0, 0 }
+    {NULL, 0, 0 }
 };
 static const struct cs_section_def ci_cs_data[] = {
     { ci_SECT_CONTEXT_defs, SECT_CONTEXT },
-    { 0, SECT_NONE }
+    { NULL, SECT_NONE }
 };
diff --git a/drivers/gpu/drm/radeon/clearstate_si.h b/drivers/gpu/drm/radeon/clearstate_si.h
index b994cb2..60474b8 100644
--- a/drivers/gpu/drm/radeon/clearstate_si.h
+++ b/drivers/gpu/drm/radeon/clearstate_si.h
@@ -933,9 +933,9 @@ static const struct cs_extent_def si_SECT_CONTEXT_defs[] =
     {si_SECT_CONTEXT_def_5, 0x0000a2a1, 1 },
     {si_SECT_CONTEXT_def_6, 0x0000a2a3, 1 },
     {si_SECT_CONTEXT_def_7, 0x0000a2a5, 233 },
-    { 0, 0, 0 }
+    {NULL, 0, 0 }
 };
 static const struct cs_section_def si_cs_data[] = {
     { si_SECT_CONTEXT_defs, SECT_CONTEXT },
-    { 0, SECT_NONE }
+    { NULL, SECT_NONE }
 };
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

Regards,
Michele
