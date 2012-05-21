From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Mon, 21 May 2012 10:19:32 +0100
Message-ID: <4FBA08A4.6030706@linaro.org>
References: <20120521134219.6d6396802bd6a097503bac92@canb.auug.org.au> <4FB9F818.4030801@linaro.org> <20120521184005.3b7661ec6468c5878a22615d@canb.auug.org.au> <4FBA0460.1070300@linaro.org> <20120521191007.9347651e88add2e7c247a24f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:37247 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757477Ab2EUJTk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 May 2012 05:19:40 -0400
Received: by lbbgm6 with SMTP id gm6so3282109lbb.19
        for <linux-next@vger.kernel.org>; Mon, 21 May 2012 02:19:38 -0700 (PDT)
In-Reply-To: <20120521191007.9347651e88add2e7c247a24f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 21/05/12 10:10, Stephen Rothwell wrote:
> Hi Lee,
>=20
> On Mon, 21 May 2012 10:01:20 +0100 Lee Jones<lee.jones@linaro.org>  w=
rote:
>>
>> That seems broken to me.
>>
>> Why would any of the X86_64 systems be building ab8500-core code?
>=20
> Because the Kconfig allows it to ...

I think the issue may be on the x86 side. In -next I see:

> arch/arm/configs/u8500_defconfig:CONFIG_AB8500_CORE=3Dy
> drivers/mfd/Kconfig:config AB8500_CORE

Expected

> drivers/gpio/Kconfig:           depends on AB8500_CORE && BROKEN
> drivers/input/misc/Kconfig:     depends on AB8500_CORE
> drivers/mfd/Kconfig:            depends on AB8500_CORE && MFD_DB8500_=
PRCMU
> drivers/mfd/Kconfig:            depends on AB8500_CORE && DEBUG_FS
> drivers/mfd/Kconfig:            depends on AB8500_CORE && REGULATOR_A=
B8500
> drivers/misc/Kconfig:           depends on AB8500_CORE && ARCH_U8500
> drivers/power/Kconfig:          depends on AB8500_CORE && AB8500_GPAD=
C
> drivers/regulator/Kconfig:      depends on AB8500_CORE
> drivers/rtc/Kconfig:            depends on AB8500_CORE
> drivers/usb/otg/Kconfig:        depends on AB8500_CORE

I've just checked these, they are all AB8500 related Kconfig entries.

> include/linux/mfd/abx500/ab8500-sysctrl.h:#ifdef CONFIG_AB8500_CORE
> include/linux/mfd/abx500/ab8500-sysctrl.h:#endif /* CONFIG_AB8500_COR=
E */

> drivers/mfd/Makefile:obj-$(CONFIG_AB8500_CORE)  +=3D ab8500-core.o ab=
8500-sysctrl.o

So somewhere along the line an X86 config is selecting CONFIG_AB8500_CO=
RE when it shouldn't.=20

I can't see anything relevant in my tree. I'll try to pull yours as hav=
e a look.

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
M: +44 77 88 633 515=20
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
