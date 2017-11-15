From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings after merge of the gpio tree
Date: Thu, 16 Nov 2017 09:42:44 +1100
Message-ID: <20171116094244.55db9408@canb.auug.org.au>
References: <20171103163724.73fe268e@canb.auug.org.au>
        <20171109145125.4c505048@canb.auug.org.au>
        <CACRpkdahm-N7JyKQ8LA69qjvPG6Vf4TRKx67emxxFKVdszGiNA@mail.gmail.com>
        <CABGGisyhjtJN=Rgjb0MS9vg+TH2M8Rir27GNyv8jAT2LibjASg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41959 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753766AbdKOWmq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Nov 2017 17:42:46 -0500
In-Reply-To: <CABGGisyhjtJN=Rgjb0MS9vg+TH2M8Rir27GNyv8jAT2LibjASg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "arm@kernel.org" <arm@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

On Thu, 9 Nov 2017 08:37:00 -0600 Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Nov 9, 2017 at 1:42 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Thu, Nov 9, 2017 at 4:51 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:  
> >> On Fri, 3 Nov 2017 16:37:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:  
> >>>
> >>> After merging the gpio tree, yesterday's linux-next build (arm
> >>> multi_v7_defconfig) produced these warnings:
> >>>
> >>> arch/arm/boot/dts/bcm2835-rpi-b.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
> >>> arch/arm/boot/dts/bcm2835-rpi-b-rev2.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
> >>> arch/arm/boot/dts/bcm2835-rpi-a.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
> >>> arch/arm/boot/dts/bcm2835-rpi-b-plus.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
> >>> arch/arm/boot/dts/bcm2835-rpi-a-plus.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
> >>> arch/arm/boot/dts/bcm2836-rpi-2-b.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
> >>> arch/arm/boot/dts/bcm2837-rpi-3-b.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
> >>> arch/arm/boot/dts/bcm2835-rpi-zero.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
> >>> arch/arm/boot/dts/bcm2835-rpi-zero-w.dtb: Warning (phys_property): Missing property '#phy-cells' in node /phy or bad phandle (referred from /soc/usb@7e980000:phys[0])
> >>> arch/arm/boot/dts/exynos5410-odroidxu.dtb: Warning (interrupts_property): Missing interrupt-controller or interrupt-map property in /soc/system-controller@10040000
> >>>
> >>> and many, many more.
> >>>
> >>> I have no idea what caused this.  
> >>
> >> I am still getting lots of these ...  
> >
> > I have absolutely no clue either.
> >
> > What I know is that there is a device tree compiler warning that can
> > be turned on, and
> > it generates these warnings a lot. The actual problems have been in
> > the DTS files
> > forever. They just recently started to look into them.
> >
> > It has nothing to do with the GPIO tree whatsoever, so I wonder if it
> > is a side effect of
> > something else?  

Probably just the first tree to cause a rebuild of the dtb files after
the change below.

> There's a dtc update in -next which adds these new checks. It's been
> there for over a month now. Unlike other dtc checks, these are
> generally actual errors, so they are not off by default (enabled with
> W=1,2).
> 
> In reality, there's only about 50-100 warnings. The way dts includes
> are structured and because the dtc checks don't have the original
> source file lines, it just multiplies the warnings.

So these (many) warnings are now in Linus' tree :-(

Please do something about them.

-- 
Cheers,
Stephen Rothwell
