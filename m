From: Tejun Heo <tj@kernel.org>
Subject: [PATCH 12/17] mfd: update gfp/slab.h includes
Date: Tue, 30 Mar 2010 02:52:40 +0900
Message-ID: <1269885165-18617-13-git-send-email-tj@kernel.org>
References: <1269885165-18617-1-git-send-email-tj@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1269885165-18617-1-git-send-email-tj@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: linux-next.vger.kernel.org

Implicit slab.h inclusion via percpu.h is about to go away.  Make sure
gfp.h or slab.h is included as necessary.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Samuel Ortiz <sameo@linux.intel.com>
---
 drivers/gpio/rdc321x-gpio.c      |    1 +
 drivers/mfd/davinci_voicecodec.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/gpio/rdc321x-gpio.c b/drivers/gpio/rdc321x-gpio.c
index 46c5519..e344907 100644
--- a/drivers/gpio/rdc321x-gpio.c
+++ b/drivers/gpio/rdc321x-gpio.c
@@ -27,6 +27,7 @@
 #include <linux/pci.h>
 #include <linux/gpio.h>
 #include <linux/mfd/rdc321x.h>
+#include <linux/slab.h>
 
 struct rdc321x_gpio {
 	spinlock_t		lock;
diff --git a/drivers/mfd/davinci_voicecodec.c b/drivers/mfd/davinci_voicecodec.c
index 9886aa8..3e75f02 100644
--- a/drivers/mfd/davinci_voicecodec.c
+++ b/drivers/mfd/davinci_voicecodec.c
@@ -23,6 +23,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/device.h>
+#include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/clk.h>
-- 
1.6.4.2
