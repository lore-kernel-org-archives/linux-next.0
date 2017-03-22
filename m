From: Cyril Bur <cyrilbur@gmail.com>
Subject: [PATCH] drivers/misc: Aspeed LPC control fix compile error and warning
Date: Wed, 22 Mar 2017 14:13:28 +1100
Message-ID: <20170322031328.24043-1-cyrilbur@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, joel@jms.id.au, benh@kernel.crashing.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

pgprot_dmachoerent() is not defined on every architecture. Having
COMPILE_TEST set for the driver causes it to be compiled on
architectures which do not have pgprot_dmachoerent():
    drivers/misc/aspeed-lpc-ctrl.c: In function 'aspeed_lpc_ctrl_mmap':
    drivers/misc/aspeed-lpc-ctrl.c:51:9: error: implicit declaration of
        function 'pgprot_dmacoherent' [-Werror=implicit-function-declaration]
        prot = pgprot_dmacoherent(prot);

There are two possible solutions:
    1. Remove COMPILE_TEST to ensure the driver is only compiled on ARM
    2. Use pgprot_noncached() instead of pgprot_dmachoerent()

The first option results in less compile testing of the LPC control
driver which is undesirable.
The second option uses a function that is declared on all architectures
and therefore should always build. Currently there is no practical
difference between pgprot_noncached() and pgprot_dmachoerent() for the
aspeed chips that this driver is compatible with. The reason for
pgprot_dmachoerent() was that there may be chips made at some point in
the future that could include hardware that pgprot_dmachoerent() could
optimise for. As none of this hardware has even been announced there
isn't really a need for pgprot_dmachoerent().

Using pgprot_noncached() is completely correct and optimal for all
existing hardware on which the LPC control driver will run.

This commit also addresses that phys_addr_t should be printed using %pap
rather than %x:
    In file included from include/linux/miscdevice.h:6:0,
                     from drivers/misc/aspeed-lpc-ctrl.c:11:
    drivers/misc/aspeed-lpc-ctrl.c: In function 'aspeed_lpc_ctrl_probe':
    drivers/misc/aspeed-lpc-ctrl.c:232:17: warning: format '%x' expects
        argument of type 'unsigned int', but argument 3 has type 'phys_addr_t
        {aka long long unsigned int}' [-Wformat=]
        dev_info(dev, "Loaded at 0x%08x (0x%08x)\n",

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 drivers/misc/aspeed-lpc-ctrl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/aspeed-lpc-ctrl.c b/drivers/misc/aspeed-lpc-ctrl.c
index f6acbe1d9378..c654651a7b6d 100644
--- a/drivers/misc/aspeed-lpc-ctrl.c
+++ b/drivers/misc/aspeed-lpc-ctrl.c
@@ -48,7 +48,7 @@ static int aspeed_lpc_ctrl_mmap(struct file *file, struct vm_area_struct *vma)
 		return -EINVAL;
 
 	/* ast2400/2500 AHB accesses are not cache coherent */
-	prot = pgprot_dmacoherent(prot);
+	prot = pgprot_noncached(prot);
 
 	if (remap_pfn_range(vma, vma->vm_start,
 		(lpc_ctrl->mem_base >> PAGE_SHIFT) + vma->vm_pgoff,
@@ -229,8 +229,8 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
 	if (rc)
 		dev_err(dev, "Unable to register device\n");
 	else
-		dev_info(dev, "Loaded at 0x%08x (0x%08x)\n",
-			lpc_ctrl->mem_base, lpc_ctrl->mem_size);
+		dev_info(dev, "Loaded at %pap (0x%08x)\n",
+			&lpc_ctrl->mem_base, lpc_ctrl->mem_size);
 
 	return rc;
 }
-- 
2.12.0
