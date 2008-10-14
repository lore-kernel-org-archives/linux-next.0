From: Dmitry <dbaryshkov@gmail.com>
Subject: Re: linux-next: usb tree build failure
Date: Tue, 14 Oct 2008 19:42:15 +0400
Message-ID: <bc64b4640810140842u34292b62mc8be005165f267a5@mail.gmail.com>
References: <20081014145917.708bace4.sfr@canb.auug.org.au>
	 <bc64b4640810140124h35dc9eb1ka2628ff64f2fdac3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wx-out-0506.google.com ([66.249.82.229]:5789 "EHLO
	wx-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751046AbYJNPmQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Oct 2008 11:42:16 -0400
Received: by wx-out-0506.google.com with SMTP id h27so714926wxd.4
        for <linux-next@vger.kernel.org>; Tue, 14 Oct 2008 08:42:15 -0700 (PDT)
In-Reply-To: <bc64b4640810140124h35dc9eb1ka2628ff64f2fdac3@mail.gmail.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org

2008/10/14 Dmitry <dbaryshkov@gmail.com>:
> Hi,
>
> 2008/10/14 Stephen Rothwell <sfr@canb.auug.org.au>:
>> Hi Greg,
>>
>> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>>
>> drivers/usb/Kconfig:63:error: found recursive dependency: USB -> USB_OHCI_HCD -> I2C -> MCU_MPC8349EMITX -> ARCH_REQUIRE_GPIOLIB -> GPIOLIB -> MFD_TC6393XB -> USB_ARCH_HAS_OHCI -> USB_ARCH_HAS_HCD -> MOUSE_APPLETOUCH -> USB
>> make[2]: *** [ppc64_defconfig] Error 1
>> make[1]: *** [ppc64_defconfig] Error 2
>> make: *** [sub-make] Error 2
>
> I don't quite understand, how this is possible, as MFD_TC6393XB
> depends on ARM and this is PPC64

Does the linux-next contain any updates to how recursive deps are
calculated? Since I ended up with current-git + i2c + mcu_mpc8349emitx
patch + powerpc tree + gregkh-2.6.27-all.patch and still can't
reproduce this error.

>>
>> Direct cause is commit 51f54ddba226b3b33f55d1be058e809fcfdc30c4 ("USB:
>> ohci: add support for tmio-ohci cell") which I have reverted.
>
> --
> With best wishes
> Dmitry
>



-- 
With best wishes
Dmitry
