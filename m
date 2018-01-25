From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pci tree
Date: Thu, 25 Jan 2018 16:49:37 +1100
Message-ID: <20180125164937.32fef5a8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Bjorn,

After merging the pci tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/kernel/pci-common.c: In function 'pcibios_setup
_device':
arch/powerpc/kernel/pci-common.c:406:15: error: 'virq' may be used uninitialized in this function [-Werror=maybe-uninitialized]
  pci_dev->irq = virq;
  ~~~~~~~~~~~~~^~~~~~
arch/powerpc/kernel/pci-common.c:365:15: note: 'virq' was declared here
  unsigned int virq;
               ^~~~

Caused by commit

  c5042ac60fe5 ("powerpc/pci: Use of_irq_parse_and_map_pci() helper")

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 25 Jan 2018 16:44:19 +1100
Subject: [PATCH] powerpc/pci: fix for "Use of_irq_parse_and_map_pci() helper"

Fixes: c5042ac60fe5 ("powerpc/pci: Use of_irq_parse_and_map_pci() helper")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/kernel/pci-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index 6be3f2c22a9b..ae2ede4de6be 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -362,7 +362,7 @@ struct pci_controller* pci_find_hose_for_OF_device(struct device_node* node)
  */
 static int pci_read_irq_line(struct pci_dev *pci_dev)
 {
-	unsigned int virq;
+	unsigned int virq = 0;
 
 	pr_debug("PCI: Try to map irq for %s...\n", pci_name(pci_dev));
 
-- 
2.15.1

-- 
Cheers,
Stephen Rothwell
