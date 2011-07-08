From: james_p_freyensee@linux.intel.com
Subject: [PATCH] PTI implicit declaration fix.
Date: Fri,  8 Jul 2011 14:34:11 -0700
Message-ID: <1310160851-26415-1-git-send-email-james_p_freyensee@linux.intel.com>
References: <james_p_freyensee@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <james_p_freyensee@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, randy.dunlap@oracle.com, sfr@canb.auug.org.au, christophe.guerard@intel.com, pranav.k.sanghadia@intel.com, geert@linux-m68k.org
List-Id: linux-next.vger.kernel.org

From: J Freyensee <james_p_freyensee@linux.intel.com>

In a certain compile configuration, functions like
'kmalloc' and 'copy_from_user' were coming up as
implicit errors.  This patch adds slab.h and
uaccess.h to the driver.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: J Freyensee <james_p_freyensee@linux.intel.com>
---
 drivers/misc/pti.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/misc/pti.c b/drivers/misc/pti.c
index 8653bd0..4ba4e5f 100644
--- a/drivers/misc/pti.c
+++ b/drivers/misc/pti.c
@@ -22,6 +22,8 @@
  */
 
 #include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
 #include <linux/sched.h>
 #include <linux/interrupt.h>
 #include <linux/console.h>
-- 
1.7.0.4
