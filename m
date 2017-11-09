From: Rob Herring <robh@kernel.org>
Subject: Re: linux-next: build warnings after merge of the gpio tree
Date: Thu, 9 Nov 2017 08:37:00 -0600
Message-ID: <CABGGisyhjtJN=Rgjb0MS9vg+TH2M8Rir27GNyv8jAT2LibjASg@mail.gmail.com>
References: <20171103163724.73fe268e@canb.auug.org.au> <20171109145125.4c505048@canb.auug.org.au>
 <CACRpkdahm-N7JyKQ8LA69qjvPG6Vf4TRKx67emxxFKVdszGiNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:56950 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753399AbdKIOhX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 9 Nov 2017 09:37:23 -0500
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com [209.85.128.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9CBE52193B
        for <linux-next@vger.kernel.org>; Thu,  9 Nov 2017 14:37:22 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id k61so5801124wrc.4
        for <linux-next@vger.kernel.org>; Thu, 09 Nov 2017 06:37:22 -0800 (PST)
In-Reply-To: <CACRpkdahm-N7JyKQ8LA69qjvPG6Vf4TRKx67emxxFKVdszGiNA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "arm@kernel.org" <arm@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Nov 9, 2017 at 1:42 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Nov 9, 2017 at 4:51 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> On Fri, 3 Nov 2017 16:37:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>
>>> After merging the gpio tree, yesterday's linux-next build (arm
>>> multi_v7_defconfig) produced these warnings:
>>>
>>> arch/arm/boot/dts/bcm2835-rpi-b.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
>>> arch/arm/boot/dts/bcm2835-rpi-b-rev2.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
>>> arch/arm/boot/dts/bcm2835-rpi-a.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
>>> arch/arm/boot/dts/bcm2835-rpi-b-plus.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
>>> arch/arm/boot/dts/bcm2835-rpi-a-plus.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
>>> arch/arm/boot/dts/bcm2836-rpi-2-b.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
>>> arch/arm/boot/dts/bcm2837-rpi-3-b.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
>>> arch/arm/boot/dts/bcm2835-rpi-zero.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
>>> arch/arm/boot/dts/bcm2835-rpi-zero-w.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
>>> arch/arm/boot/dts/exynos5410-odroidxu.dtb: Warning (interrupts_property): Missing interrupt-controller or interrupt-map property in /soc/system-controller@10040000
>>>
>>> and many, many more.
>>>
>>> I have no idea what caused this.
>>
>> I am still getting lots of these ...
>
> I have absolutely no clue either.
>
> What I know is that there is a device tree compiler warning that can
> be turned on, and
> it generates these warnings a lot. The actual problems have been in
> the DTS files
> forever. They just recently started to look into them.
>
> It has nothing to do with the GPIO tree whatsoever, so I wonder if it
> is a side effect of
> something else?

There's a dtc update in -next which adds these new checks. It's been
there for over a month now. Unlike other dtc checks, these are
generally actual errors, so they are not off by default (enabled with
W=1,2).

In reality, there's only about 50-100 warnings. The way dts includes
are structured and because the dtc checks don't have the original
source file lines, it just multiplies the warnings.

Rob
