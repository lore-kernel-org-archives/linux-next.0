From: Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: build failure after merge of the tip tree
Date: Fri, 12 Jun 2015 20:51:29 +1000
Message-ID: <1434106289.20648.2.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "David S.Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au, derek.chickles@caviumnetworks.com, satananda.burla@caviumnetworks.com, felix.manlunas@caviumnetworks.com, Robert.Richter@caviumnetworks.com, Aleksey.Makarov@caviumnetworks.com, raghu.vatsavayi@caviumnetworks.com
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the tip tree, today's linux-next build (x86_allmodconfig)
failed like this:

  drivers/net/ethernet/cavium/liquidio/request_manager.c: In function 'octeon_init_instr_queue':
  drivers/net/ethernet/cavium/liquidio/request_manager.c:111:2: error: implicit declaration of function 'vmalloc' [-Werror=implicit-function-declaration]
    iq->request_list = vmalloc(sizeof(*iq->request_list) * num_descs);
    ^
  drivers/net/ethernet/cavium/liquidio/request_manager.c: In function 'octeon_delete_instr_queue':
  drivers/net/ethernet/cavium/liquidio/request_manager.c:178:3: error: implicit declaration of function 'vfree' [-Werror=implicit-function-declaration]
     vfree(iq->request_list);
     ^
  drivers/net/ethernet/cavium/liquidio/octeon_device.c: In function 'octeon_free_device_mem':
  drivers/net/ethernet/cavium/liquidio/octeon_device.c:653:4: error: implicit declaration of function 'vfree' [-Werror=implicit-function-declaration]
      vfree(oct->droq[i]);
      ^

And so on.

Caused by the interaction of commit d6472302f242 "x86/mm: Decouple
<linux/vmalloc.h> from <asm/io.h>" from the tip tree with commit f21fb3ed364b
"Add support of Cavium Liquidio ethernet adapters" from the net-next tree.

I applied the following fix for today:

diff --git a/drivers/net/ethernet/cavium/liquidio/octeon_device.c b/drivers/net/ethernet/cavium/liquidio/octeon_device.c
index 2ca91657295f..4e581facae2c 100644
--- a/drivers/net/ethernet/cavium/liquidio/octeon_device.c
+++ b/drivers/net/ethernet/cavium/liquidio/octeon_device.c
@@ -27,6 +27,7 @@
 #include <linux/crc32.h>
 #include <linux/kthread.h>
 #include <linux/netdevice.h>
+#include <linux/vmalloc.h>
 #include "octeon_config.h"
 #include "liquidio_common.h"
 #include "octeon_droq.h"
diff --git a/drivers/net/ethernet/cavium/liquidio/octeon_droq.c b/drivers/net/ethernet/cavium/liquidio/octeon_droq.c
index 60a186f1609b..94b502a0cf33 100644
--- a/drivers/net/ethernet/cavium/liquidio/octeon_droq.c
+++ b/drivers/net/ethernet/cavium/liquidio/octeon_droq.c
@@ -25,6 +25,7 @@
 #include <linux/pci.h>
 #include <linux/kthread.h>
 #include <linux/netdevice.h>
+#include <linux/vmalloc.h>
 #include "octeon_config.h"
 #include "liquidio_common.h"
 #include "octeon_droq.h"
diff --git a/drivers/net/ethernet/cavium/liquidio/request_manager.c b/drivers/net/ethernet/cavium/liquidio/request_manager.c
index adb428463495..cd58660dd161 100644
--- a/drivers/net/ethernet/cavium/liquidio/request_manager.c
+++ b/drivers/net/ethernet/cavium/liquidio/request_manager.c
@@ -26,6 +26,7 @@
 #include <linux/pci.h>
 #include <linux/kthread.h>
 #include <linux/netdevice.h>
+#include <linux/vmalloc.h>
 #include "octeon_config.h"
 #include "liquidio_common.h"
 #include "octeon_droq.h"


cheers
