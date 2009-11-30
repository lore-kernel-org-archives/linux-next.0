From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pcmcia tree with the pxa tree
Date: Mon, 30 Nov 2009 13:16:21 +1100
Message-ID: <20091130131621.f4d20c96.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60024 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752771AbZK3CQR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 29 Nov 2009 21:16:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marc Zyngier <maz@misterjones.org>, Eric Miao <eric.y.miao@gmail.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>

Hi Dominik,

Today's linux-next merge of the pcmcia tree got a conflict in
drivers/pcmcia/Kconfig between commit
c9b74a4489db7e6fe03fbee11f406b9641baae55 ("[ARM] pxa/zeus: make Viper
pcmcia support more generic to support Zeus") from the pxa tree and
commit 0f767de6a26a07f7d58394512b6f6c96322f047f ("PCMCIA: soc_common:
convert to a stand alone module") from the pcmcia tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/pcmcia/Kconfig
index d3faec3,f3ccbcc..0000000
--- a/drivers/pcmcia/Kconfig
+++ b/drivers/pcmcia/Kconfig
@@@ -242,7 -208,8 +229,8 @@@ config PCMCIA_PXA2X
  	depends on ARM && ARCH_PXA && PCMCIA
  	depends on (ARCH_LUBBOCK || MACH_MAINSTONE || PXA_SHARPSL \
  		    || MACH_ARMCORE || ARCH_PXA_PALM || TRIZEPS_PCMCIA \
 -		    || ARCH_VIPER || ARCH_PXA_ESERIES || MACH_STARGATE2)
 +		    || ARCOM_PCMCIA || ARCH_PXA_ESERIES || MACH_STARGATE2)
+ 	select PCMCIA_SOC_COMMON
  	help
  	  Say Y here to include support for the PXA2xx PCMCIA controller
  
