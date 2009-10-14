From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree with Linus' tree
Date: Wed, 14 Oct 2009 11:05:32 +1100
Message-ID: <20091014110532.f543b915.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933383AbZJNAGP@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Woodhouse <David.Woodhouse@intel.com>, Tejun Heo <tj@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Jesse,

Today's linux-next merge of the pci tree got a conflict in
drivers/pci/pci.c between commit 8d86fb2c80ec376b35ae64ac858d406ae1d42a3f
("Rename pci_init() to pci_apply_final_quirks(), move it to quirks.c")
from Linus' tree and commit b20dd110d21aac94b3f4063cffbcf9718656ce51
("PCI: determine CLS more intelligently") from the pci tree.

I fixed it up by removing the bits of pci_init() that had been moved and
leaving the newly added bits where they are.  Hopefully this will be ok
since the moved bits are actually run earlier now.  Obviously, there is
probably a better fix ...
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/pci/pci.c
index 4e4c295,a6e22fd..0000000
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@@ -2723,6 -2724,45 +2724,45 @@@ int __attribute__ ((weak)) pci_ext_cfg_
  	return 1;
  }
  
+ static int __devinit pci_init(void)
+ {
+ 	struct pci_dev *dev = NULL;
+ 	u8 cls = 0;
+ 	u8 tmp;
+ 
+ 	if (pci_cache_line_size)
+ 		printk(KERN_DEBUG "PCI: CLS %u bytes\n",
+ 		       pci_cache_line_size << 2);
+ 
+ 	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
 -		pci_fixup_device(pci_fixup_final, dev);
+ 		/*
+ 		 * If arch hasn't set it explicitly yet, use the CLS
+ 		 * value shared by all PCI devices.  If there's a
+ 		 * mismatch, fall back to the default value.
+ 		 */
+ 		if (!pci_cache_line_size) {
+ 			pci_read_config_byte(dev, PCI_CACHE_LINE_SIZE, &tmp);
+ 			if (!cls)
+ 				cls = tmp;
+ 			if (!tmp || cls == tmp)
+ 				continue;
+ 
+ 			printk(KERN_DEBUG "PCI: CLS mismatch (%u != %u), "
+ 			       "using %u bytes\n", cls << 2, tmp << 2,
+ 			       pci_dfl_cache_line_size << 2);
+ 			pci_cache_line_size = pci_dfl_cache_line_size;
+ 		}
+ 	}
+ 	if (!pci_cache_line_size) {
+ 		printk(KERN_DEBUG "PCI: CLS %u bytes, default %u\n",
+ 		       cls << 2, pci_dfl_cache_line_size << 2);
+ 		pci_cache_line_size = cls;
+ 	}
+ 
+ 	return 0;
+ }
++device_initcall(pci_init);
+ 
  static int __init pci_setup(char *str)
  {
  	while (str) {
