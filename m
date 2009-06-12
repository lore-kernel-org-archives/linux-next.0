From: Subrata Modak <subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [BUILD FAILURE 02/04] Next June 04:PPC64 randconfig
	[drivers/usb/host/ohci-hcd.o]
Date: Fri, 12 Jun 2009 15:05:48 +0530
Message-ID: <1244799348.5234.13.camel@subratamodak.linux.ibm.com>
References: <20090605182651.24094.36577.sendpatchset@elm3a191.beaverton.ibm.com>
	 <200906091738.58154.david-b@pacbell.net>
Reply-To: subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200906091738.58154.david-b-yBeKhBN/0LDR7s880joybQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Brownell <david-b-yBeKhBN/0LDR7s880joybQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sachin P Sant <sachinp-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Linux-Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Linux-Next <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Smirl <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linuxppc-dev <Linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, kernel-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Tue, 2009-06-09 at 17:38 -0700, David Brownell wrote:
> On Friday 05 June 2009, Subrata Modak wrote:
> > Correct, it fixes the issue. However, since few changes might have gone
> > to the Kconfig, the patch does not apply cleanly. Below is the patch, just
> > a retake of the earlier one, but on the latest code. 
> 
> And it got mangled a bit along the way.  Plus, the original one
> goofed up Kconfig dependency displays ... both issues fixed in
> this version, against current mainline GIT.
> 
> If someone can verify all four PPC/OF/OHCI configs build on
> on PPC64, I'm OK with it.
> 
> - Dave

Dave,

Sorry for being late. The patch fixes the issue on the latest git for
PPC64. Infact, the whole drivers/usb/host/ builds just fine:

linux-2.6 # make drivers/usb/host/
  CHK     include/linux/version.h
  CHK     include/linux/utsrelease.h
  SYMLINK include/asm -> include/asm-powerpc
  CALL    scripts/checksyscalls.sh
  CC      drivers/usb/host/ohci-hcd.o
  CC      drivers/usb/host/pci-quirks.o
  CC      drivers/usb/host/uhci-hcd.o
  LD      drivers/usb/host/built-in.o
  CC [M]  drivers/usb/host/isp116x-hcd.o
  CC [M]  drivers/usb/host/u132-hcd.o

You can check in the patch now.

Regards--
Subrata

> 
> 
> ========== CUT HERE
> From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Subject: fix build failure for PPC64 randconfig [usb/ohci]
> 
> We could just make the USB_OHCI_HCD_PPC_OF option implicit
> and selected only if at least one of USB_OHCI_HCD_PPC_OF_BE
> and USB_OHCI_HCD_PPC_OF_LE are set.
> 
> [ dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org: fix patch manglation and dependencies ]
> 
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Resent-by: Subrata Modak <subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> Signed-off-by: David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
> ---
>  drivers/usb/host/Kconfig |   29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
> 
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -180,26 +180,27 @@ config USB_OHCI_HCD_PPC_SOC
>  	  Enables support for the USB controller on the MPC52xx or
>  	  STB03xxx processor chip.  If unsure, say Y.
> 
> -config USB_OHCI_HCD_PPC_OF
> -	bool "OHCI support for PPC USB controller on OF platform bus"
> -	depends on USB_OHCI_HCD && PPC_OF
> -	default y
> -	---help---
> -	  Enables support for the USB controller PowerPC present on the
> -	  OpenFirmware platform bus.
> -
>  config USB_OHCI_HCD_PPC_OF_BE
> -	bool "Support big endian HC"
> -	depends on USB_OHCI_HCD_PPC_OF
> -	default y
> +	bool "OHCI support for OF platform bus (big endian)"
> +	depends on USB_OHCI_HCD && PPC_OF
>  	select USB_OHCI_BIG_ENDIAN_DESC
>  	select USB_OHCI_BIG_ENDIAN_MMIO
> +	---help---
> +	  Enables support for big-endian USB controllers present on the
> +	  OpenFirmware platform bus.
> 
>  config USB_OHCI_HCD_PPC_OF_LE
> -	bool "Support little endian HC"
> -	depends on USB_OHCI_HCD_PPC_OF
> -	default n
> +	bool "OHCI support for OF platform bus (little endian)"
> +	depends on USB_OHCI_HCD && PPC_OF
>  	select USB_OHCI_LITTLE_ENDIAN
> +	---help---
> +	  Enables support for little-endian USB controllers present on the
> +	  OpenFirmware platform bus.
> +
> +config USB_OHCI_HCD_PPC_OF
> +	bool
> +	depends on USB_OHCI_HCD && PPC_OF
> +	default USB_OHCI_HCD_PPC_OF_BE || USB_OHCI_HCD_PPC_OF_LE
> 
>  config USB_OHCI_HCD_PCI
>  	bool "OHCI support for PCI-bus USB controllers"
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
