From: Ian Kent <raven@themaw.net>
Subject: [PATCH 02/10] autofs4 - fix string.h include in auto_dev-ioctl.h
Date: Sat, 31 Aug 2013 19:42:31 +0800
Message-ID: <20130831114231.11807.17131.stgit@perseus.themaw.net>
References: <20130831114133.11807.35953.stgit@perseus.themaw.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <autofs-owner@vger.kernel.org>
In-Reply-To: <20130831114133.11807.35953.stgit@perseus.themaw.net>
Sender: autofs-owner@vger.kernel.org
To: linux-next@vger.kernel.org
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>, autofs mailing list <autofs@vger.kernel.org>, Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Since including linux/string.h will now do the right thing remove the
conditional check.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 include/linux/auto_dev-ioctl.h |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/auto_dev-ioctl.h b/include/linux/auto_dev-ioctl.h
index 850f39b..fe4f373 100644
--- a/include/linux/auto_dev-ioctl.h
+++ b/include/linux/auto_dev-ioctl.h
@@ -11,12 +11,7 @@
 #define _LINUX_AUTO_DEV_IOCTL_H
 
 #include <linux/auto_fs.h>
-
-#ifdef __KERNEL__
 #include <linux/string.h>
-#else
-#include <string.h>
-#endif /* __KERNEL__ */
 
 #define AUTOFS_DEVICE_NAME		"autofs"
 

