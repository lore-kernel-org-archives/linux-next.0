From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: build warnings after merge of the drm tree
Date: Mon, 3 Sep 2012 22:31:37 -0700
Message-ID: <20120904053137.GA9847@roeck-us.net>
References: <20120904135829.6beb08f80919aa2b5c8bf55f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.active-venture.com ([67.228.131.205]:54809 "EHLO
	mail.active-venture.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751682Ab2IDFfB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Sep 2012 01:35:01 -0400
Content-Disposition: inline
In-Reply-To: <20120904135829.6beb08f80919aa2b5c8bf55f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sachin Kamat <sachin.kamat@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Tue, Sep 04, 2012 at 01:58:29PM +1000, Stephen Rothwell wrote:
> Hi Dave,
> 
> After merging the drm tree, today's linux-next build (powerpc
> ppc64_defconfig) produced these warnings:
> 
> drivers/gpu/drm/udl/Kconfig:1:error: recursive dependency detected!
> drivers/gpu/drm/udl/Kconfig:1:	symbol DRM_UDL depends on USB_ARCH_HAS_HCD
> drivers/usb/Kconfig:76:	symbol USB_ARCH_HAS_HCD depends on USB_SUPPORT
> drivers/usb/Kconfig:58:	symbol USB_SUPPORT is selected by DRM_USB
> drivers/gpu/drm/Kconfig:22:	symbol DRM_USB is selected by DRM_UDL
> warning: (PPC_PS3) selects USB_OHCI_LITTLE_ENDIAN which has unmet direct dependencies (USB_SUPPORT && USB_OHCI_HCD)
> warning: (PPC_PS3 && PPC_CELLEB) selects USB_OHCI_BIG_ENDIAN_MMIO which has unmet direct dependencies (USB_SUPPORT && USB_OHCI_HCD)
> warning: (PPC_PS3 && PPC_CELLEB && USB_EHCI_HCD_PMC_MSP && XPS_USB_HCD_XILINX && USB_OCTEON_EHCI) selects USB_EHCI_BIG_ENDIAN_MMIO which has unmet direct dependencies (USB_SUPPORT && USB_EHCI_HCD && (PPC_CELLEB || PPC_PS3 || 440EPX || ARCH_IXP4XX || XPS_USB_HCD_XILINX || PPC_MPC512x || CPU_CAVIUM_OCTEON || PMC_MSP || SPARC_LEON || MIPS_SEAD3))
> 
> The x86_64 allmodconfig produces these:
> 
> drivers/gpu/drm/udl/Kconfig:1:error: recursive dependency detected!
> drivers/gpu/drm/udl/Kconfig:1:	symbol DRM_UDL depends on USB_ARCH_HAS_HCD
> drivers/usb/Kconfig:76:	symbol USB_ARCH_HAS_HCD depends on USB_SUPPORT
> drivers/usb/Kconfig:58:	symbol USB_SUPPORT is selected by DRM_USB
> drivers/gpu/drm/Kconfig:22:	symbol DRM_USB is selected by DRM_UDL
> warning: (MOUSE_APPLETOUCH && MOUSE_BCM5974 && MOUSE_SYNAPTICS_USB && JOYSTICK_XPAD && TABLET_USB_ACECAD && TABLET_USB_AIPTEK && TABLET_USB_HANWANG && TABLET_USB_KBTAB && TABLET_USB_WACOM && TOUCHSCREEN_USB_COMPOSITE && INPUT_ATI_REMOTE2 && INPUT_KEYSPAN_REMOTE && INPUT_POWERMATE && INPUT_YEALINK && INPUT_CM109 && RC_ATI_REMOTE && IR_IMON && IR_MCEUSB && IR_REDRAT3 && IR_STREAMZAP && IR_IGUANA && IR_TTUSBIR && DRM_USB) selects USB which has unmet direct dependencies (USB_SUPPORT && USB_ARCH_HAS_HCD)
> 
> Maybe introduced by commit df0b34430072 ("drm/usb: select USB_SUPPORT in
> Kconfig"), maybe interacting with a commit 8f057d7bca54 ("gpu/mfd/usb:
> Fix USB randconfig problems") from Linus' tree (that added "depends on
> USB_ARCH_HAS_HCD" to "config DRM_USB" and "config DRM_UDL").
> 
Looks like it. I'll have a look once the tree is available.

Guenter
