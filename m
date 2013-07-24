From: Peter Hurley <peter@hurleysoftware.com>
Subject: [PATCH tty-next] n_tty: Fix build breakage on ppc64
Date: Wed, 24 Jul 2013 09:30:05 -0400
Message-ID: <1374672605-12326-1-git-send-email-peter@hurleysoftware.com>
References: <20130724144232.86d30134a8bc829b5172a5c2@canb.auug.org.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130724144232.86d30134a8bc829b5172a5c2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Peter Hurley <peter@hurleysoftware.com>
List-Id: linux-next.vger.kernel.org

Commit 20bafb3d23d108bc0a896eb8b7c1501f4f649b77
  'n_tty: Move buffers into n_tty_data'
broke the ppc64 build.

Include vmalloc.h for the required function declarations.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
---
 drivers/tty/n_tty.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/n_tty.c b/drivers/tty/n_tty.c
index d8cf96a..dd8ae0c 100644
--- a/drivers/tty/n_tty.c
+++ b/drivers/tty/n_tty.c
@@ -50,6 +50,7 @@
 #include <linux/uaccess.h>
 #include <linux/module.h>
 #include <linux/ratelimit.h>
+#include <linux/vmalloc.h>
 
 
 /* number of characters left in xmit buffer before select has we have room */
-- 
1.8.1.2
