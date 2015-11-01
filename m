From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pci tree
Date: Mon, 2 Nov 2015 02:23:07 +1100
Message-ID: <20151102022307.774bde2c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57083 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751999AbbKAPXL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Nov 2015 10:23:11 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ley Foon Tan <lftan@altera.com>

Hi Bjorn,

After merging the pci tree, today's linux-next build (powerpc
allyesconfig) failed like this:

In file included from include/linux/kvm_host.h:20:0,
                 from arch/powerpc/kernel/asm-offsets.c:54:
include/linux/msi.h:174:21: fatal error: asm/msi.h: No such file or directory

Caused by commit

  f19eafec930f ("PCI: altera: Add Altera PCIe MSI driver")

I have disabled that driver for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 2 Nov 2015 02:12:54 +1100
Subject: [PATCH] PCI: altera: disable MSI driver for now

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/pci/host/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/host/Kconfig b/drivers/pci/host/Kconfig
index 2af0571356e8..7a31ebbc4379 100644
--- a/drivers/pci/host/Kconfig
+++ b/drivers/pci/host/Kconfig
@@ -158,6 +158,7 @@ config PCIE_ALTERA
 config PCIE_ALTERA_MSI
 	bool "Altera PCIe MSI feature"
 	depends on PCI_MSI
+	depends on BROKEN
 	select PCI_MSI_IRQ_DOMAIN
 	help
 	  Say Y here if you want PCIe MSI support for the Altera FPGA.
-- 
2.6.1

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
