From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the arc tree
Date: Thu, 12 May 2016 11:54:34 +1000
Message-ID: <20160512115434.3f6c6d3e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60006 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751552AbcELByh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 May 2016 21:54:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Noam Camus <noamc@ezchip.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/irqchip/Kconfig
  drivers/irqchip/Makefile

between commit:

  44df427c894a ("irqchip: add nps Internal and external irqchips")

from the arc tree and commit:

  b8f3ebe630a4 ("irqchip: Add Layerscape SCFG MSI controller support")

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

diff --cc drivers/irqchip/Kconfig
index 1ab632a94db3,81f88ada3a61..000000000000
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@@ -245,8 -246,10 +246,16 @@@ config MVEBU_ODM
  	bool
  	select GENERIC_MSI_IRQ_DOMAIN
  
 +config EZNPS_GIC
 +	bool "NPS400 Global Interrupt Manager (GIM)"
 +	select IRQ_DOMAIN
 +	help
 +	  Support the EZchip NPS400 global interrupt controller
++
+ config LS_SCFG_MSI
+ 	def_bool y if SOC_LS1021A || ARCH_LAYERSCAPE
+ 	depends on PCI && PCI_MSI
+ 	select PCI_MSI_IRQ_DOMAIN
+ 
+ config PARTITION_PERCPU
+ 	bool
diff --cc drivers/irqchip/Makefile
index 9d54d53fe223,f828244b44c2..000000000000
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@@ -65,4 -67,4 +67,5 @@@ obj-$(CONFIG_INGENIC_IRQ)		+= irq-ingen
  obj-$(CONFIG_IMX_GPCV2)			+= irq-imx-gpcv2.o
  obj-$(CONFIG_PIC32_EVIC)		+= irq-pic32-evic.o
  obj-$(CONFIG_MVEBU_ODMI)		+= irq-mvebu-odmi.o
 +obj-$(CONFIG_EZNPS_GIC)			+= irq-eznps.o
+ obj-$(CONFIG_LS_SCFG_MSI)		+= irq-ls-scfg-msi.o
