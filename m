From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: next-20161116 build: 0 failures 8 warnings (next-20161116)
Date: Wed, 16 Nov 2016 18:03:42 +0100
Message-ID: <2832056.miO8kTKNCC@wuerfel>
References: <E1c6uoX-0003lK-SU@optimist>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:56233 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753510AbcKPRDu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Nov 2016 12:03:50 -0500
In-Reply-To: <E1c6uoX-0003lK-SU@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linaro-kernel@lists.linaro.org
Cc: Build bot for Mark Brown <broonie@kernel.org>, kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org

On Wednesday, November 16, 2016 7:39:26 AM CET Build bot for Mark Brown wrote:
> 
> Errors summary: 1
>          20 drivers/remoteproc/Kconfig:3:error: recursive dependency detected!

Broke today, patch sent.

> Warnings Summary: 8
>          16 ../drivers/staging/vc04_services/interface/vchiq_arm/vchiq_killable.h:67:0: warning: "mutex_lock_interruptible" redefined

This was in my backlog, patch sent now

>           6 warning: (THUNDERBOLT) selects APPLE_PROPERTIES which has unmet direct dependencies (EFI && EFI_STUB && X86)

I sent a patch, but someone else had a better one already

>           4 ../include/linux/spinlock.h:246:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]

Not sure which one this is.

>           4 ../drivers/pinctrl/sunxi/pinctrl-sunxi.c:1194:8: warning: 'best_div' may be used uninitialized in this function [-Wmaybe-uninitialized]
>           4 ../drivers/pinctrl/sunxi/pinctrl-sunxi.c:1191:8: warning: 'best_div' may be used uninitialized in this function [-Wmaybe-uninitialized]

Sent a patch today

>           2 ../kernel/bpf/bpf_lru_list.c:201:28: warning: 'next' may be used uninitialized in this function [-Wmaybe-uninitialized]

Sent a patch today

>           2 ../drivers/staging/iio/frequency/ad9832.c:214:11: warning: 'st' may be used uninitialized in this function [-Wmaybe-uninitialized]

Sent a patch on Nov 8

>           2 ../drivers/phy/phy-rockchip-inno-usb2.c:717:7: warning: 'tmout' may be used uninitialized in this function [-Wmaybe-uninitialized]

Sent a patch today, along with two other bugfixes for the same driver.

> Section Mismatch Summary: 4
>           1 WARNING: vmlinux.o(.text+0x794934): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
>           1 WARNING: vmlinux.o(.text+0x547850): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
>           1 WARNING: drivers/built-in.o(.text+0x1a376c): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()
>           1 WARNING: drivers/built-in.o(.text+0x10f9c8): Section mismatch in reference from the function fsl_guts_probe() to the function .init.text:of_flat_dt_get_machine_name()

I thought I'd seen this but now I can't reproduce it. The code is clearly
broken though. Have to check my build system.

	Arnd
