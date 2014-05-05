From: Michele CURTI <michele.curti@gmail.com>
Subject: [PATCH v2 2/2] drm/radeon: use NULL instead of zero in clearstate
 headers
Date: Mon, 5 May 2014 22:32:19 +0200
Message-ID: <20140505203219.GC404@ativ>
References: <20140503135512.GA17068@ativ>
 <A3397C8B8B789E45844E7EC5DEAD89D040EEF93D@satlexdag05.amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ee0-f51.google.com ([74.125.83.51]:56905 "EHLO
	mail-ee0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752629AbaEEUcX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 May 2014 16:32:23 -0400
Received: by mail-ee0-f51.google.com with SMTP id e51so1077301eek.38
        for <linux-next@vger.kernel.org>; Mon, 05 May 2014 13:32:22 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <A3397C8B8B789E45844E7EC5DEAD89D040EEF93D@satlexdag05.amd.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>, "airlied@linux.ie" <airlied@linux.ie>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

drm/radeon: use NULL instead of zero in clearstate headers

Signed-off-by: Michele Curti <michele.curti@gmail.com>
---
 drivers/gpu/drm/radeon/clearstate_cayman.h | 8 ++++----
 drivers/gpu/drm/radeon/clearstate_ci.h     | 4 ++--
 drivers/gpu/drm/radeon/clearstate_si.h     | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

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
-- 
1.9.2
