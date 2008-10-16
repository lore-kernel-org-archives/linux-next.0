From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: usb tree build failure
Date: Thu, 16 Oct 2008 09:05:03 -0700
Message-ID: <20081016160503.GB27769@kroah.com>
References: <20081014145917.708bace4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:42489 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754762AbYJPQIZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Oct 2008 12:08:25 -0400
Content-Disposition: inline
In-Reply-To: <20081014145917.708bace4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Dmitry Baryshkov <dbaryshkov@gmail.com>

On Tue, Oct 14, 2008 at 02:59:17PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> drivers/usb/Kconfig:63:error: found recursive dependency: USB -> USB_OHCI_HCD -> I2C -> MCU_MPC8349EMITX -> ARCH_REQUIRE_GPIOLIB -> GPIOLIB -> MFD_TC6393XB -> USB_ARCH_HAS_OHCI -> USB_ARCH_HAS_HCD -> MOUSE_APPLETOUCH -> USB
> make[2]: *** [ppc64_defconfig] Error 1
> make[1]: *** [ppc64_defconfig] Error 2
> make: *** [sub-make] Error 2
> 
> Direct cause is commit 51f54ddba226b3b33f55d1be058e809fcfdc30c4 ("USB:
> ohci: add support for tmio-ohci cell") which I have reverted.

Dmitry, I can reproduce this with this patch on top of Linus's tree
right now.  Care to fix it up?

thanks,

greg k-h
