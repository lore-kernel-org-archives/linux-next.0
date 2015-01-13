From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] next: drm/atomic: Use copy_from_user to copy 64 bit data from user space
Date: Mon, 12 Jan 2015 21:12:17 -0800
Message-ID: <1421125937-27394-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Rob Clark <robdclark@gmail.com>
List-Id: linux-next.vger.kernel.org

Copying 64 bit data from user space using get_user is not supported
on all architectures, and may result in the following build error.

ERROR: "__get_user_bad" [drivers/gpu/drm/drm.ko] undefined!

Avoid the problem by using copy_from_user.

Fixes: d34f20d6e2f2 ("drm: Atomic modeset ioctl")
Cc: Rob Clark <robdclark@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
Compile tested only.

 drivers/gpu/drm/drm_atomic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 1e38dfc..af3f3df 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1259,7 +1259,9 @@ retry:
 				goto fail;
 			}
 
-			if (get_user(prop_value, prop_values_ptr + copied_props)) {
+			if (copy_from_user(&prop_value,
+					   prop_values_ptr + copied_props,
+					   sizeof(prop_value))) {
 				ret = -EFAULT;
 				goto fail;
 			}
-- 
2.1.0
