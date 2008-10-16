From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: Re: linux-next: usb tree build failure
Date: Fri, 17 Oct 2008 01:36:13 +0400
Message-ID: <20081016213613.GB11876@doriath.ww600.siemens.net>
References: <20081014145917.708bace4.sfr@canb.auug.org.au> <20081016160503.GB27769@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ug-out-1314.google.com ([66.249.92.170]:33167 "EHLO
	ug-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750972AbYJPVgV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Oct 2008 17:36:21 -0400
Received: by ug-out-1314.google.com with SMTP id k3so1867160ugf.37
        for <linux-next@vger.kernel.org>; Thu, 16 Oct 2008 14:36:19 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20081016160503.GB27769@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Thu, Oct 16, 2008 at 09:05:03AM -0700, Greg KH wrote:
> On Tue, Oct 14, 2008 at 02:59:17PM +1100, Stephen Rothwell wrote:
> > Hi Greg,
> > 
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > 
> > drivers/usb/Kconfig:63:error: found recursive dependency: USB -> USB_OHCI_HCD -> I2C -> MCU_MPC8349EMITX -> ARCH_REQUIRE_GPIOLIB -> GPIOLIB -> MFD_TC6393XB -> USB_ARCH_HAS_OHCI -> USB_ARCH_HAS_HCD -> MOUSE_APPLETOUCH -> USB
> > make[2]: *** [ppc64_defconfig] Error 1
> > make[1]: *** [ppc64_defconfig] Error 2
> > make: *** [sub-make] Error 2
> > 
> > Direct cause is commit 51f54ddba226b3b33f55d1be058e809fcfdc30c4 ("USB:
> > ohci: add support for tmio-ohci cell") which I have reverted.
> 
> Dmitry, I can reproduce this with this patch on top of Linus's tree
> right now.  Care to fix it up?

After few tries I can come with pretty simple but pretty strange solution:

>From 1c6dd41e074c5f526fc29b00a2bf265497d2819d Mon Sep 17 00:00:00 2001
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Fri, 17 Oct 2008 01:30:15 +0400
Subject: [PATCH] USB: unbreak recursive dependancy

After addition of TMIO usb driver Kconfig sees the recursive dependency
Break it by rephrasing ARCH_PNX4008 OHCI deps.

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 drivers/usb/Kconfig      |    2 +-
 drivers/usb/host/Kconfig |    1 -
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
index 3f7827a..3be4730 100644
--- a/drivers/usb/Kconfig
+++ b/drivers/usb/Kconfig
@@ -36,7 +36,7 @@ config USB_ARCH_HAS_OHCI
 	default y if PXA3xx
 	default y if ARCH_EP93XX
 	default y if ARCH_AT91
-	default y if ARCH_PNX4008
+	default y if ARCH_PNX4008 && I2C
 	default y if MFD_TC6393XB
 	# PPC:
 	default y if STB03xxx
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 228797e..ba1c771 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -138,7 +138,6 @@ config USB_OHCI_HCD
 	tristate "OHCI HCD support"
 	depends on USB && USB_ARCH_HAS_OHCI
 	select ISP1301_OMAP if MACH_OMAP_H2 || MACH_OMAP_H3
-	select I2C if ARCH_PNX4008
 	---help---
 	  The Open Host Controller Interface (OHCI) is a standard for accessing
 	  USB 1.1 host controller hardware.  It does more in hardware than Intel's
-- 
1.5.6.5


-- 
With best wishes
Dmitry
