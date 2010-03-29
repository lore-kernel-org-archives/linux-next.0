From: Tejun Heo <tj@kernel.org>
Subject: [PATCH 05/17] staging: update gfp/slab.h includes
Date: Tue, 30 Mar 2010 02:52:33 +0900
Message-ID: <1269885165-18617-6-git-send-email-tj@kernel.org>
References: <1269885165-18617-1-git-send-email-tj@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1269885165-18617-1-git-send-email-tj@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>
List-Id: linux-next.vger.kernel.org

Implicit slab.h inclusion via percpu.h is about to go away.  Make sure
gfp.h or slab.h is included as necessary.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg Kroah-Hartman <gregkh@suse.de>
---
 drivers/staging/comedi/drivers/quatech_daqp_cs.c |    1 +
 drivers/staging/otus/usbdrv.h                    |    1 +
 drivers/staging/tm6000/tm6000-alsa.c             |    1 +
 drivers/staging/tm6000/tm6000-cards.c            |    1 +
 drivers/staging/tm6000/tm6000-core.c             |    1 +
 drivers/staging/tm6000/tm6000-dvb.c              |    1 +
 6 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/comedi/drivers/quatech_daqp_cs.c b/drivers/staging/comedi/drivers/quatech_daqp_cs.c
index 92d7b72..ab00846 100644
--- a/drivers/staging/comedi/drivers/quatech_daqp_cs.c
+++ b/drivers/staging/comedi/drivers/quatech_daqp_cs.c
@@ -49,6 +49,7 @@ Devices: [Quatech] DAQP-208 (daqp), DAQP-308
 
 #include "../comedidev.h"
 #include <linux/semaphore.h>
+#include <linux/slab.h>
 
 #include <pcmcia/cs_types.h>
 #include <pcmcia/cs.h>
diff --git a/drivers/staging/otus/usbdrv.h b/drivers/staging/otus/usbdrv.h
index 330d1b9..7e66c2d 100644
--- a/drivers/staging/otus/usbdrv.h
+++ b/drivers/staging/otus/usbdrv.h
@@ -38,6 +38,7 @@
 #include <linux/uaccess.h>
 #include <linux/wireless.h>
 #include <linux/if_arp.h>
+#include <linux/slab.h>
 #include <linux/io.h>
 
 #include "zdcompat.h"
diff --git a/drivers/staging/tm6000/tm6000-alsa.c b/drivers/staging/tm6000/tm6000-alsa.c
index bc89f9d..3404516 100644
--- a/drivers/staging/tm6000/tm6000-alsa.c
+++ b/drivers/staging/tm6000/tm6000-alsa.c
@@ -15,6 +15,7 @@
 #include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/usb.h>
+#include <linux/slab.h>
 
 #include <asm/delay.h>
 #include <sound/core.h>
diff --git a/drivers/staging/tm6000/tm6000-cards.c b/drivers/staging/tm6000/tm6000-cards.c
index 2053008..2935533 100644
--- a/drivers/staging/tm6000/tm6000-cards.c
+++ b/drivers/staging/tm6000/tm6000-cards.c
@@ -24,6 +24,7 @@
 #include <linux/i2c.h>
 #include <linux/usb.h>
 #include <linux/version.h>
+#include <linux/slab.h>
 #include <media/v4l2-common.h>
 #include <media/tuner.h>
 #include <media/tvaudio.h>
diff --git a/drivers/staging/tm6000/tm6000-core.c b/drivers/staging/tm6000/tm6000-core.c
index d9cade0..2ae7ae0 100644
--- a/drivers/staging/tm6000/tm6000-core.c
+++ b/drivers/staging/tm6000/tm6000-core.c
@@ -22,6 +22,7 @@
 
 #include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/slab.h>
 #include <linux/usb.h>
 #include <linux/i2c.h>
 #include "tm6000.h"
diff --git a/drivers/staging/tm6000/tm6000-dvb.c b/drivers/staging/tm6000/tm6000-dvb.c
index 1072206..dfba5e6 100644
--- a/drivers/staging/tm6000/tm6000-dvb.c
+++ b/drivers/staging/tm6000/tm6000-dvb.c
@@ -18,6 +18,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/slab.h>
 #include <linux/usb.h>
 
 #include "tm6000.h"
-- 
1.6.4.2
