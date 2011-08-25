From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (staging
 tree related)
Date: Thu, 25 Aug 2011 16:17:06 +1000
Message-ID: <20110825161706.2c8656538ee63a120570a5c1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Larry Finger <Larry.Finger@lwfinger.net>, wlanfae <wlanfae@realtek.com>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the final tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/staging/rtl8192e/rtl_core.c: In function 'rtl8192_init_priv_variable':
drivers/staging/rtl8192e/rtl_core.c:1270:2: error: implicit declaration of function 'vmalloc'
drivers/staging/rtl8192e/rtl_core.c:1270:20: warning: cast to pointer from integer of different size
drivers/staging/rtl8192e/rtl_core.c: In function 'rtl8192_pci_disconnect':
drivers/staging/rtl8192e/rtl_core.c:3101:4: error: implicit declaration of function 'vfree'

Caused by commit 94a799425eee ("rom: wlanfae <wlanfae@realtek.com>"
really "[PATCH 1/8] rtl8192e: Import new version of driver from realtek").

I have applied this patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 25 Aug 2011 16:13:02 +1000
Subject: [PATCH] staging/rtl8192e: using vmalloc/vfree requires including
 vmalloc.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/staging/rtl8192e/rtl_core.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl_core.c
index b38f626..15ee5ee 100644
--- a/drivers/staging/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl_core.c
@@ -43,6 +43,7 @@
 
 #include <asm/uaccess.h>
 #include <linux/pci.h>
+#include <linux/vmalloc.h>
 #include "rtl_core.h"
 #include "r8192E_phy.h"
 #include "r8192E_phyreg.h"
-- 
1.7.5.4

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
