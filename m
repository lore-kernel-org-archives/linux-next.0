From: Tejun Heo <tj@kernel.org>
Subject: [PATCH 06/17] vbus: update gfp/slab.h includes
Date: Tue, 30 Mar 2010 02:52:34 +0900
Message-ID: <1269885165-18617-7-git-send-email-tj@kernel.org>
References: <1269885165-18617-1-git-send-email-tj@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1269885165-18617-1-git-send-email-tj@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Gregory Haskins <ghaskins@novell.com>
List-Id: linux-next.vger.kernel.org

Implicit slab.h inclusion via percpu.h is about to go away.  Make sure
gfp.h or slab.h is included as necessary.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Gregory Haskins <ghaskins@novell.com>
---
 drivers/vbus/pci-bridge.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/vbus/pci-bridge.c b/drivers/vbus/pci-bridge.c
index 0d51324..36de7c4 100644
--- a/drivers/vbus/pci-bridge.c
+++ b/drivers/vbus/pci-bridge.c
@@ -22,6 +22,7 @@
 #include <linux/pci.h>
 #include <linux/mm.h>
 #include <linux/workqueue.h>
+#include <linux/slab.h>
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
 #include <linux/ioq.h>
-- 
1.6.4.2
