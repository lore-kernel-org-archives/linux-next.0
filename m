From: Tejun Heo <tj@kernel.org>
Subject: [PATCH 11/17] mtd: update gfp/slab.h includes
Date: Tue, 30 Mar 2010 02:52:39 +0900
Message-ID: <1269885165-18617-12-git-send-email-tj@kernel.org>
References: <1269885165-18617-1-git-send-email-tj@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1269885165-18617-1-git-send-email-tj@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, David Woodhouse <dwmw2@infradead.org>
List-Id: linux-next.vger.kernel.org

Implicit slab.h inclusion via percpu.h is about to go away.  Make sure
gfp.h or slab.h is included as necessary.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Woodhouse <dwmw2@infradead.org>
---
 drivers/mtd/mtdcore.c          |    1 +
 drivers/mtd/nand/mpc5121_nfc.c |    1 +
 drivers/mtd/nand/r852.c        |    1 +
 3 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index e8573c9..3c48193 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -17,6 +17,7 @@
 #include <linux/mtd/compatmac.h>
 #include <linux/proc_fs.h>
 #include <linux/idr.h>
+#include <linux/gfp.h>
 
 #include <linux/mtd/mtd.h>
 #include "internal.h"
diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_nfc.c
index d7333f4..1a06f78 100644
--- a/drivers/mtd/nand/mpc5121_nfc.c
+++ b/drivers/mtd/nand/mpc5121_nfc.c
@@ -27,6 +27,7 @@
 
 #include <linux/module.h>
 #include <linux/clk.h>
+#include <linux/gfp.h>
 #include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
index 96bfbd8..dd5158c 100644
--- a/drivers/mtd/nand/r852.c
+++ b/drivers/mtd/nand/r852.c
@@ -15,6 +15,7 @@
 #include <linux/pci.h>
 #include <linux/pci_ids.h>
 #include <linux/delay.h>
+#include <linux/slab.h>
 #include <asm/byteorder.h>
 #include <linux/sched.h>
 #include "sm_common.h"
-- 
1.6.4.2
