From: Tejun Heo <tj@kernel.org>
Subject: [PATCH 15/17] libata: update gfp/slab.h includes
Date: Tue, 30 Mar 2010 02:52:43 +0900
Message-ID: <1269885165-18617-16-git-send-email-tj@kernel.org>
References: <1269885165-18617-1-git-send-email-tj@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1269885165-18617-1-git-send-email-tj@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Jeff Garzik <jgarzik@pobox.com>
List-Id: linux-next.vger.kernel.org

Implicit slab.h inclusion via percpu.h is about to go away.  Make sure
gfp.h or slab.h is included as necessary.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jeff Garzik <jgarzik@pobox.com>
---
 drivers/ata/ahci_platform.c |    1 +
 drivers/ata/libahci.c       |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/ata/ahci_platform.c b/drivers/ata/ahci_platform.c
index 42cdd73..19bfd1d 100644
--- a/drivers/ata/ahci_platform.c
+++ b/drivers/ata/ahci_platform.c
@@ -13,6 +13,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/gfp.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
diff --git a/drivers/ata/libahci.c b/drivers/ata/libahci.c
index 3f586ec..34fc57d 100644
--- a/drivers/ata/libahci.c
+++ b/drivers/ata/libahci.c
@@ -33,6 +33,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/gfp.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/blkdev.h>
-- 
1.6.4.2
