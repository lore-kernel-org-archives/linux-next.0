From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH-next] liquidio: fix implicit irq include causing build failures
Date: Sun, 23 Jul 2017 10:44:52 -0400
Message-ID: <20170723144452.16556-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: linux-next@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Derek Chickles <derek.chickles@caviumnetworks.com>, Satanand Burla <satananda.burla@caviumnetworks.com>, Felix Manlunas <felix.manlunas@caviumnetworks.com>, Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>
List-Id: linux-next.vger.kernel.org

To fix

In file included from drivers/net/ethernet/cavium/liquidio/octeon_mem_ops.c:24:0:
drivers/net/ethernet/cavium/liquidio/octeon_device.h:216:2: error: expected specifier-qualifier-list before ‘irqreturn_t’
  irqreturn_t (*process_interrupt_regs)(void *);
  ^

as seen on arm64 allmodconfig builds.

Cc: Derek Chickles <derek.chickles@caviumnetworks.com>
Cc: Satanand Burla <satananda.burla@caviumnetworks.com>
Cc: Felix Manlunas <felix.manlunas@caviumnetworks.com>
Cc: Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---

[Seen on current linux-next, where similar implicit irq includes
 were recently revealed by some header shuffle somewhere.]

 drivers/net/ethernet/cavium/liquidio/octeon_device.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/cavium/liquidio/octeon_device.h b/drivers/net/ethernet/cavium/liquidio/octeon_device.h
index c90ed48ae8ab..ad464788c923 100644
--- a/drivers/net/ethernet/cavium/liquidio/octeon_device.h
+++ b/drivers/net/ethernet/cavium/liquidio/octeon_device.h
@@ -22,6 +22,8 @@
 #ifndef _OCTEON_DEVICE_H_
 #define  _OCTEON_DEVICE_H_
 
+#include <linux/interrupt.h>
+
 /** PCI VendorId Device Id */
 #define  OCTEON_CN68XX_PCIID          0x91177d
 #define  OCTEON_CN66XX_PCIID          0x92177d
-- 
2.11.0
