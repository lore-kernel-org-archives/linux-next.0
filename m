From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: linux-next: build failure after merge of the arm-soc tree
Date: Wed, 8 Apr 2015 16:59:49 +0200
Message-ID: <CABuKBe+p-hW_8fW4ocq10KM5=CZunoQwJ8+mp4n1U04NBoOPtw@mail.gmail.com>
References: <20150407111217.2b2cf440@canb.auug.org.au>
	<CABuKBe+iBfmxHat3Ezinpd-85CA5m1f2gYydk=uW4SwABQ-0Wg@mail.gmail.com>
	<CACRpkdZE0JB0xBENNPhi6g4Su5ZuZA0wf1mi8xzbLeKm3rOYjA@mail.gmail.com>
	<2111946.bc0NbpO0Gp@wuerfel>
	<CACRpkdYmnEsVkfw64ihMP6BHK3+R0eiYqzHbEM1-hBcau1Nwwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-la0-f47.google.com ([209.85.215.47]:33577 "EHLO
	mail-la0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753173AbbDHO7w (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 8 Apr 2015 10:59:52 -0400
In-Reply-To: <CACRpkdYmnEsVkfw64ihMP6BHK3+R0eiYqzHbEM1-hBcau1Nwwg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Hongzhou Yang <hongzhou.yang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

2015-04-08 16:49 GMT+02:00 Linus Walleij <linus.walleij@linaro.org>:
> On Tue, Apr 7, 2015 at 2:28 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Tuesday 07 April 2015 11:28:22 Linus Walleij wrote:
>>> On Tue, Apr 7, 2015 at 10:43 AM, Matthias Brugger
>>> <matthias.bgg@gmail.com> wrote:
>>> > 2015-04-07 3:12 GMT+02:00 Stephen Rothwell <sfr@canb.auug.org.au>:
>>> >> Hi all,
>>> >>
>>> >> After merging the arm-soc tree, today's linux-next build (arm
>>> >> multi_v7_defconfig) failed like this:
>>> >>
>>> >> In file included from arch/arm/boot/dts/mt8135.dtsi:18:0,
>>> >>                  from arch/arm/boot/dts/mt8135-evbp1.dts:16:
>>> >> arch/arm/boot/dts/mt8135-pinfunc.h:18:40: fatal error: dt-bindings/pinctrl/mt65xx.h: No such file or directory
>>> >>  #include <dt-bindings/pinctrl/mt65xx.h>
>>> >>                                         ^
>>> >>
>>> >> Caused by commit e6f219b8ec5e ("ARM: dts: mt8135: Add pinctrl/GPIO/EINT
>>> >> node for mt8135").
>>> >
>>> > This will be fixed as soon as Linus pinctrl for-next branch got merged [1].
>>>
>>> Hm that's unfortunate, we do not rely on merge orders.
>>>
>>> Either the ARM SoC tree needs to pull in the pinctrl commit
>>> or I need to carry this patch in the pinctrl tree.
>>>
>>> Is this sufficiently stand-alone to be merged into my tree
>>> or do you need to go by the former approach?
>>
>> Let's just delay this patch to another merge window. You can add the
>> driver now, and we should just revert the DT node addition in arm-soc,
>> and then we'll add it in 4.2, or come up with a better solution.
>
> OK. I'm not applying it then.

@arnd: I will send the patch in the next merge window then. Do you
want me to do anything else for this merge window (e.g. resend the
pull request without the patch)?

Cheers,
Matthias

-- 
motzblog.wordpress.com
