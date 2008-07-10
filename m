From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: drm tree build failure
Date: Thu, 10 Jul 2008 16:27:53 +1000
Message-ID: <20080710162753.553743c9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49672 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753191AbYGJG16 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Jul 2008 02:27:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

Hi Dave,

Today's linux-next build (x86_64 allmodconfig) failed like this:

  Using /scratch/sfr/next as source for kernel
/opt/crosstool/gcc-4.0.2-glibc-2.3.6/x86_64-unknown-linux-gnu/bin/x86_64-unknown-linux-gnu-ld: drivers/gpu/built-in.o: No such file: No such file or directory

We have:
CONFIG_DRM=m

drivers/gpu/Makefile says:

obj-$(CONFIG_DRM)		+= drm/

I changed it to "obj-y" and it seems to build further.  Sam, is that the
right thing?

It then fails like this:

ERROR: "i830_irq_wait" [drivers/gpu/drm/i830/i830.ko] undefined!
ERROR: "i830_irq_emit" [drivers/gpu/drm/i830/i830.ko] undefined!

Overall, I applied the following patch and subsumed it into the merge.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 0d267993201335a75b9a9ad7c485596b34ce6d28 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 10 Jul 2008 16:25:18 +1000
Subject: [PATCH] drm: fix fallout from moving stuff around

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/Makefile          |    2 +-
 drivers/gpu/drm/i830/Makefile |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
index 83e2e7a..f2584b7 100644
--- a/drivers/gpu/Makefile
+++ b/drivers/gpu/Makefile
@@ -1 +1 @@
-obj-$(CONFIG_DRM)		+= drm/
+obj-y		+= drm/
diff --git a/drivers/gpu/drm/i830/Makefile b/drivers/gpu/drm/i830/Makefile
index e194029..c642ee0 100644
--- a/drivers/gpu/drm/i830/Makefile
+++ b/drivers/gpu/drm/i830/Makefile
@@ -3,6 +3,6 @@
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
 ccflags-y := -Iinclude/drm
-i830-y := i830_drv.o i830_dma.o
+i830-y := i830_drv.o i830_dma.o i830_irq.o
 
 obj-$(CONFIG_DRM_I830) += i830.o
-- 
1.5.6.2
