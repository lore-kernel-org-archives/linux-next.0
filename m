From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the pci tree
Date: Fri, 9 Dec 2016 13:38:13 +1100
Message-ID: <20161209133813.79fe0f87@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/pci/msi.c

between commit:

  67f1e4473857 ("PCI/MSI: Document new parameter for msi_capability_init()")

from the pci tree and commit:

  61e1c5905290 ("PCI/MSI: Propagate IRQ affinity description through the MSI code")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/pci/msi.c
index da95f4e689f2,dd27f73a45fc..000000000000
--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@@ -753,14 -754,14 +754,14 @@@ static void msix_program_entries(struc
   * @dev: pointer to the pci_dev data structure of MSI-X device function
   * @entries: pointer to an array of struct msix_entry entries
   * @nvec: number of @entries
-  * @affinity: flag to indicate CPU IRQ affinity mask should be set
+  * @affd: Optional pointer to enable automatic affinity assignement
   *
   * Setup the MSI-X capability structure of device function with a
 - * single MSI-X irq. A return of zero indicates the successful setup of
 - * requested MSI-X entries with allocated irqs or non-zero for otherwise.
 + * single MSI-X IRQ. A return of zero indicates the successful setup of
 + * requested MSI-X entries with allocated IRQs or non-zero for otherwise.
   **/
  static int msix_capability_init(struct pci_dev *dev, struct msix_entry *entries,
- 				int nvec, bool affinity)
+ 				int nvec, const struct irq_affinity *affd)
  {
  	int ret;
  	u16 control;
