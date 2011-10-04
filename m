From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree with the arm-soc tree
Date: Tue, 4 Oct 2011 16:50:30 +1100
Message-ID: <20111004165030.ab90295677251fc80bf843a2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:40117 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751727Ab1JDFuf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Oct 2011 01:50:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Felipe Balbi <balbi@ti.com>, Tony Lindgren <tony@atomide.com>

Hi Greg,

Today's linux-next merge of the usb tree got a conflict in
arch/arm/mach-omap2/Makefile between commit f41caddbe73f ("omap2+: Use
Kconfig symbol in Makefile instead of obj-y") from the arm-soc tree and
commitb 3c3dc22366b ("usb: musb: fix build breakage") from the usb tree.

I fixed it up (I think, see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mach-omap2/Makefile
index 8bd389d,7317a2b..0000000
--- a/arch/arm/mach-omap2/Makefile
+++ b/arch/arm/mach-omap2/Makefile
@@@ -218,21 -229,24 +218,17 @@@ obj-$(CONFIG_MACH_OMAP_ZOOM3)		+= board
  					   board-zoom-debugboard.o
  obj-$(CONFIG_MACH_OMAP_3630SDP)		+= board-3630sdp.o \
  					   board-zoom-peripherals.o \
 -					   board-zoom-display.o \
 -					   board-flash.o \
 -					   hsmmc.o
 -obj-$(CONFIG_MACH_CM_T35)		+= board-cm-t35.o \
 -					   hsmmc.o
 +					   board-zoom-display.o
 +obj-$(CONFIG_MACH_CM_T35)		+= board-cm-t35.o
  obj-$(CONFIG_MACH_CM_T3517)		+= board-cm-t3517.o
 -obj-$(CONFIG_MACH_IGEP0020)		+= board-igep0020.o \
 -					   hsmmc.o
 -obj-$(CONFIG_MACH_OMAP3_TOUCHBOOK)	+= board-omap3touchbook.o \
 -					   hsmmc.o
 -obj-$(CONFIG_MACH_OMAP_4430SDP)		+= board-4430sdp.o \
 -					   hsmmc.o
 -obj-$(CONFIG_MACH_OMAP4_PANDA)		+= board-omap4panda.o \
 -					   hsmmc.o
 +obj-$(CONFIG_MACH_IGEP0020)		+= board-igep0020.o
 +obj-$(CONFIG_MACH_OMAP3_TOUCHBOOK)	+= board-omap3touchbook.o
- obj-$(CONFIG_MACH_OMAP_4430SDP)		+= board-4430sdp.o \
- 					   omap_phy_internal.o
- obj-$(CONFIG_MACH_OMAP4_PANDA)		+= board-omap4panda.o \
- 					   omap_phy_internal.o
++obj-$(CONFIG_MACH_OMAP_4430SDP)		+= board-4430sdp.o
++obj-$(CONFIG_MACH_OMAP4_PANDA)		+= board-omap4panda.o
 +
- obj-$(CONFIG_MACH_PCM049)		+= board-omap4pcm049.o \
- 					   omap_phy_internal.o
++obj-$(CONFIG_MACH_PCM049)		+= board-omap4pcm049.o
  
- obj-$(CONFIG_MACH_OMAP3517EVM)		+= board-am3517evm.o \
- 					   omap_phy_internal.o
+ obj-$(CONFIG_MACH_OMAP3517EVM)		+= board-am3517evm.o
  
  obj-$(CONFIG_MACH_CRANEBOARD)		+= board-am3517crane.o
  
