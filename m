From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the arm-soc tree
Date: Tue, 7 Apr 2015 11:28:22 +0200
Message-ID: <CACRpkdZE0JB0xBENNPhi6g4Su5ZuZA0wf1mi8xzbLeKm3rOYjA@mail.gmail.com>
References: <20150407111217.2b2cf440@canb.auug.org.au>
	<CABuKBe+iBfmxHat3Ezinpd-85CA5m1f2gYydk=uW4SwABQ-0Wg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ig0-f171.google.com ([209.85.213.171]:36636 "EHLO
	mail-ig0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753307AbbDGJ2W (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Apr 2015 05:28:22 -0400
Received: by igblo3 with SMTP id lo3so6753358igb.1
        for <linux-next@vger.kernel.org>; Tue, 07 Apr 2015 02:28:22 -0700 (PDT)
In-Reply-To: <CABuKBe+iBfmxHat3Ezinpd-85CA5m1f2gYydk=uW4SwABQ-0Wg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hongzhou Yang <hongzhou.yang@mediatek.com>

On Tue, Apr 7, 2015 at 10:43 AM, Matthias Brugger
<matthias.bgg@gmail.com> wrote:
> 2015-04-07 3:12 GMT+02:00 Stephen Rothwell <sfr@canb.auug.org.au>:
>> Hi all,
>>
>> After merging the arm-soc tree, today's linux-next build (arm
>> multi_v7_defconfig) failed like this:
>>
>> In file included from arch/arm/boot/dts/mt8135.dtsi:18:0,
>>                  from arch/arm/boot/dts/mt8135-evbp1.dts:16:
>> arch/arm/boot/dts/mt8135-pinfunc.h:18:40: fatal error: dt-bindings/pinctrl/mt65xx.h: No such file or directory
>>  #include <dt-bindings/pinctrl/mt65xx.h>
>>                                         ^
>>
>> Caused by commit e6f219b8ec5e ("ARM: dts: mt8135: Add pinctrl/GPIO/EINT
>> node for mt8135").
>
> This will be fixed as soon as Linus pinctrl for-next branch got merged [1].

Hm that's unfortunate, we do not rely on merge orders.

Either the ARM SoC tree needs to pull in the pinctrl commit
or I need to carry this patch in the pinctrl tree.

Is this sufficiently stand-alone to be merged into my tree
or do you need to go by the former approach?

Yours,
Linus Walleij
