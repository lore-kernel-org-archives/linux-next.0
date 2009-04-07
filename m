From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH next] pci: fix build error with !PCIE_ECRC
Date: Tue, 7 Apr 2009 16:37:08 +0400
Message-ID: <20090407123707.GA18687@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, andrew.patterson@hp.com, jbarnes@virtuousgeek.org, linux-pci@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Fix this build error:
drivers/built-in.o: In function `pci_init_capabilities':
drivers/pci/probe.c:989: undefined reference to `pcie_set_ecrc_checking'
drivers/built-in.o: In function `pci_setup':
drivers/pci/pci.c:2547: undefined reference to `pcie_ecrc_get_policy'

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 drivers/pci/pci.c        |    2 ++
 drivers/pci/pcie/Kconfig |    2 +-
 drivers/pci/probe.c      |    2 ++
 3 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index f61b2cf..f1c393e 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -2543,8 +2543,10 @@ static int __init pci_setup(char *str)
 			} else if (!strncmp(str, "resource_alignment=", 19)) {
 				pci_set_resource_alignment_param(str + 19,
 							strlen(str + 19));
+#ifdef CONFIG_PCIE_ECRC
 			} else if (!strncmp(str, "ecrc=", 5)) {
 				pcie_ecrc_get_policy(str + 5);
+#endif
 			} else {
 				printk(KERN_ERR "PCI: Unknown option `%s'\n",
 						str);
diff --git a/drivers/pci/pcie/Kconfig b/drivers/pci/pcie/Kconfig
index a79e52b..9d0e727 100644
--- a/drivers/pci/pcie/Kconfig
+++ b/drivers/pci/pcie/Kconfig
@@ -52,7 +52,7 @@ config PCIEASPM_DEBUG
 #
 config PCIE_ECRC
 	bool "PCI Express ECRC support"
-	depends on PCI
+	depends on PCI && PCIEPORTBUS
 	help
 	  Enables PCI Express ECRC (transaction layer end-to-end CRC
 	  checking)
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index d5125a1..8d402a8 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -985,8 +985,10 @@ static void pci_init_capabilities(struct pci_dev *dev)
 	/* Single Root I/O Virtualization */
 	pci_iov_init(dev);
 
+#ifdef CONFIG_PCIE_ECRC
 	/* PCIe end-to-end CRC checking */
 	pcie_set_ecrc_checking(dev);
+#endif
 }
 
 void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
