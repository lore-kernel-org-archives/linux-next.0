From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pci tree
Date: Mon, 11 Jan 2016 12:42:22 +1100
Message-ID: <20160111124222.4eb47c81@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39773 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757590AbcAKBmX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 10 Jan 2016 20:42:23 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stanimir Varbanov <svarbanov@mm-sol.com>, Stanimir Varbanov <stanimir.varbanov@linaro.org>

Hi Bjorn,

After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/pci/host/pcie-designware.c: In function 'dw_pcie_host_init':
drivers/pci/host/pcie-designware.c:554:7: error: implicit declaration of function 'pci_has_flag' [-Werror=implicit-function-declaration]
  if (!pci_has_flag(PCI_PROBE_ONLY)) {
       ^
drivers/pci/host/pcie-designware.c:554:20: error: 'PCI_PROBE_ONLY' undeclared (first use in this function)
  if (!pci_has_flag(PCI_PROBE_ONLY)) {
                    ^

Caused by commit

  755007e88a5e ("PCI: qcom: Add Qualcomm PCIe controller driver")

Please only use CONFIG_COMPILE_TEST *after* testing for cross compile
problems ...

I have added thse folloeing patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 11 Jan 2016 12:37:58 +1100
Subject: [PATCH] PCI: qcom: the Qualcomm PCIe controller driver should not
 depend on COMPILE_TEST

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/pci/host/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/host/Kconfig b/drivers/pci/host/Kconfig
index de403b206391..75a605426538 100644
--- a/drivers/pci/host/Kconfig
+++ b/drivers/pci/host/Kconfig
@@ -183,7 +183,7 @@ config PCI_HISI
 
 config PCIE_QCOM
 	bool "Qualcomm PCIe controller"
-	depends on ARCH_QCOM && OF || COMPILE_TEST
+	depends on ARCH_QCOM && OF
 	select PCIE_DW
 	select PCIEPORTBUS
 	help
-- 
2.6.4

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
