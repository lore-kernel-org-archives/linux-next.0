From: Rob Herring <robh@kernel.org>
Subject: Re: linux-next: build warnings after merge of the gpio tree
Date: Wed, 6 Dec 2017 14:51:24 -0600
Message-ID: <CAL_JsqL2+ZRWdywRSNKLuWWJhvbYb6RHQKTWhJQWvZLABCy7TA@mail.gmail.com>
References: <20171103163724.73fe268e@canb.auug.org.au> <20171109145125.4c505048@canb.auug.org.au>
 <CACRpkdahm-N7JyKQ8LA69qjvPG6Vf4TRKx67emxxFKVdszGiNA@mail.gmail.com>
 <CABGGisyhjtJN=Rgjb0MS9vg+TH2M8Rir27GNyv8jAT2LibjASg@mail.gmail.com>
 <20171116094244.55db9408@canb.auug.org.au> <CAL_JsqLMjMpz81rpZuG=TJSabLpstcU-=Ypnj4ARP2M+BesjVA@mail.gmail.com>
 <20171206094853.30cc0bb0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:53422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751544AbdLFUvr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 Dec 2017 15:51:47 -0500
In-Reply-To: <20171206094853.30cc0bb0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "arm@kernel.org" <arm@kernel.org>, Andy Gross <andy.gross@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Dec 5, 2017 at 4:48 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Rob,
>
> On Wed, 15 Nov 2017 17:12:00 -0600 Rob Herring <robh@kernel.org> wrote:
>>
>> On Wed, Nov 15, 2017 at 4:42 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> > Hi all,
>> >
>> > On Thu, 9 Nov 2017 08:37:00 -0600 Rob Herring <robh@kernel.org> wrote:
>> >>
>> >> On Thu, Nov 9, 2017 at 1:42 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> >> > On Thu, Nov 9, 2017 at 4:51 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> >> >> On Fri, 3 Nov 2017 16:37:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> >> >>>
>> >> >>> After merging the gpio tree, yesterday's linux-next build (arm
>> >> >>> multi_v7_defconfig) produced these warnings:
>> >> >>>
>> >> >>> arch/arm/boot/dts/bcm2835-rpi-b.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
>> >> >>> arch/arm/boot/dts/bcm2835-rpi-b-rev2.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
>> >> >>> arch/arm/boot/dts/bcm2835-rpi-a.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
>> >> >>> arch/arm/boot/dts/bcm2835-rpi-b-plus.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
>> >> >>> arch/arm/boot/dts/bcm2835-rpi-a-plus.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
>> >> >>> arch/arm/boot/dts/bcm2836-rpi-2-b.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
>> >> >>> arch/arm/boot/dts/bcm2837-rpi-3-b.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
>> >> >>> arch/arm/boot/dts/bcm2835-rpi-zero.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
>> >> >>> arch/arm/boot/dts/bcm2835-rpi-zero-w.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
>> >> >>> arch/arm/boot/dts/exynos5410-odroidxu.dtb: Warning (interrupts_property): Missing interrupt-controller or interrupt-map property in /soc/system-controller@10040000
>> >> >>>
>> >> >>> and many, many more.
>> >> >>>
>> >> >>> I have no idea what caused this.
>> >> >>
>> >> >> I am still getting lots of these ...
>> >> >
>> >> > I have absolutely no clue either.
>> >> >
>> >> > What I know is that there is a device tree compiler warning that can
>> >> > be turned on, and
>> >> > it generates these warnings a lot. The actual problems have been in
>> >> > the DTS files
>> >> > forever. They just recently started to look into them.
>> >> >
>> >> > It has nothing to do with the GPIO tree whatsoever, so I wonder if it
>> >> > is a side effect of
>> >> > something else?
>> >
>> > Probably just the first tree to cause a rebuild of the dtb files after
>> > the change below.
>> >
>> >> There's a dtc update in -next which adds these new checks. It's been
>> >> there for over a month now. Unlike other dtc checks, these are
>> >> generally actual errors, so they are not off by default (enabled with
>> >> W=1,2).
>> >>
>> >> In reality, there's only about 50-100 warnings. The way dts includes
>> >> are structured and because the dtc checks don't have the original
>> >> source file lines, it just multiplies the warnings.
>> >
>> > So these (many) warnings are now in Linus' tree :-(
>> >
>> > Please do something about them.
>>
>> Patches are in flight. I got all the low hanging fruit that are the
>> most duplicated[1]. There's other patches in flight too.
>>
>> Rob
>>
>> [1] https://www.spinics.net/lists/arm-kernel/msg616518.html
>
> How are these going?  I am still getting over 500 lines of output in my
> arm multi_v7_defconfig builds of Linus' tree :-(

Well, there's these five in -next that I guess haven't been sent to Linus yet:

912d7985f3ce ARM: dts: rockchip: fix rk3288 iep-IOMMU interrupts property cells
44e5dced2ef6 arm: dts: marvell: Add missing #phy-cells to usb-nop-xceiv
d53418dfe997 ARM: dts: imx: Add missing #phy-cells to usb-nop-xceiv
f0e11ff8ff65 ARM: dts: am33xx: Add missing #phy-cells to ti,am335x-usb-phy
f568f6f554b8 ARM: dts: omap: Add missing #phy-cells to usb-nop-xceiv

These 2 aren't in -next and seem to have been missed:

arm: dts: qcom: fix missing #phy-cells for apq8064
arm: dts: nspire: Add missing #phy-cells to usb-nop-xceiv

Arnd, Olof, can you pick these up?

Rob
