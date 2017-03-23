From: Cyril Bur <cyrilbur@gmail.com>
Subject: [PATCH] drivers/misc: Aspeed LPC control fix format string warning
Date: Thu, 23 Mar 2017 15:29:05 +1100
Message-ID: <20170323042905.10354-1-cyrilbur@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: greg@kroah.com
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joel@jms.id.au, benh@kernel.crashing.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

resource_size_t is a derivative of phys_addr_t and should also be
printed with %pap:
    drivers/misc/aspeed-lpc-ctrl.c:232:17: warning: format '%x' expects
    argument of type 'unsigned int', but argument 4 has type
    'resource_size_t {aka long long unsigned int}' [-Wformat=] dev_info(dev,
    "Loaded at %pap (0x%08x)\n",

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 drivers/misc/aspeed-lpc-ctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/aspeed-lpc-ctrl.c b/drivers/misc/aspeed-lpc-ctrl.c
index c654651a7b6d..2f6bb2244be5 100644
--- a/drivers/misc/aspeed-lpc-ctrl.c
+++ b/drivers/misc/aspeed-lpc-ctrl.c
@@ -229,8 +229,8 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
 	if (rc)
 		dev_err(dev, "Unable to register device\n");
 	else
-		dev_info(dev, "Loaded at %pap (0x%08x)\n",
-			&lpc_ctrl->mem_base, lpc_ctrl->mem_size);
+		dev_info(dev, "Loaded at %pap (%pap)\n",
+			&lpc_ctrl->mem_base, &lpc_ctrl->mem_size);
 
 	return rc;
 }
-- 
2.12.1
