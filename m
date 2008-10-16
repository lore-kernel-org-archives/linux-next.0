From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: Re: linux-next: usb tree build failure
Date: Thu, 16 Oct 2008 21:27:51 +0400
Message-ID: <48F77997.80309@gmail.com>
References: <20081014145917.708bace4.sfr@canb.auug.org.au> <20081016160503.GB27769@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.186]:56498 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759495AbYJPR2W (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Oct 2008 13:28:22 -0400
Received: by nf-out-0910.google.com with SMTP id d3so63162nfc.21
        for <linux-next@vger.kernel.org>; Thu, 16 Oct 2008 10:28:20 -0700 (PDT)
In-Reply-To: <20081016160503.GB27769@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

Greg KH wrote:
> On Tue, Oct 14, 2008 at 02:59:17PM +1100, Stephen Rothwell wrote:
>> Hi Greg,
>>
>> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>>
>> drivers/usb/Kconfig:63:error: found recursive dependency: USB -> USB_OHCI_HCD -> I2C -> MCU_MPC8349EMITX -> ARCH_REQUIRE_GPIOLIB -> GPIOLIB -> MFD_TC6393XB -> USB_ARCH_HAS_OHCI -> USB_ARCH_HAS_HCD -> MOUSE_APPLETOUCH -> USB
>> make[2]: *** [ppc64_defconfig] Error 1
>> make[1]: *** [ppc64_defconfig] Error 2
>> make: *** [sub-make] Error 2
>>
>> Direct cause is commit 51f54ddba226b3b33f55d1be058e809fcfdc30c4 ("USB:
>> ohci: add support for tmio-ohci cell") which I have reverted.
> 
> Dmitry, I can reproduce this with this patch on top of Linus's tree
> right now.  Care to fix it up?

I'll look into it in a few hours. However if I get it correct, I don't 
know how to solve it, strictly speaking. Indeed, it adds a possibility
to have the OHCI if TC6393XB driver is loaded, thus adding dependancy
USB_ARCH_HAS_OHCI->MFD_TC6393XB closing this dependancy circle. In 
reality it isn't a problem, since e.g. MCU_MPC8349EMITX is PPC-only (if 
it isn't, it's a bug) and on the other hand MFD_TC6393XB is arm-only 
thing which correctly depends on ARM.

-- 
With best wishes
Dmitry
