From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mfd tree with the powerpc tree
Date: Mon, 29 Jan 2018 14:02:10 +1100
Message-ID: <20180129140210.0deffb8c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frederic Barrat <fbarrat@linux.vnet.ibm.com>, Rui Feng <rui_feng@realsil.com.cn>
List-Id: linux-next.vger.kernel.org

Hi Lee,

Today's linux-next merge of the mfd tree got conflicts in:

  drivers/misc/Kconfig
  drivers/misc/Makefile

between commit:

  b97f02246e0d ("ocxl: Add Makefile and Kconfig")

from the powerpc tree and commit:

  e455b69ddf9b ("misc: rtsx: Move Realtek Card Reader Driver to misc")

from the mfd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/misc/Kconfig
index 0534f338c84a,7c0fa24f9067..000000000000
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@@ -508,5 -512,5 +512,6 @@@ source "drivers/misc/mic/Kconfig
  source "drivers/misc/genwqe/Kconfig"
  source "drivers/misc/echo/Kconfig"
  source "drivers/misc/cxl/Kconfig"
 +source "drivers/misc/ocxl/Kconfig"
+ source "drivers/misc/cardreader/Kconfig"
  endmenu
diff --cc drivers/misc/Makefile
index 73326d54e246,8d8cc096063b..000000000000
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@@ -55,7 -55,7 +55,8 @@@ obj-$(CONFIG_CXL_BASE)		+= cxl
  obj-$(CONFIG_ASPEED_LPC_CTRL)	+= aspeed-lpc-ctrl.o
  obj-$(CONFIG_ASPEED_LPC_SNOOP)	+= aspeed-lpc-snoop.o
  obj-$(CONFIG_PCI_ENDPOINT_TEST)	+= pci_endpoint_test.o
 +obj-$(CONFIG_OCXL)		+= ocxl/
+ obj-$(CONFIG_MISC_RTSX)	+= cardreader/
  
  lkdtm-$(CONFIG_LKDTM)		+= lkdtm_core.o
  lkdtm-$(CONFIG_LKDTM)		+= lkdtm_bugs.o
