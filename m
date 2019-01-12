From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: linux-next: build failure after merge of the imx-mxs tree
Date: Sat, 12 Jan 2019 09:23:26 +0800
Message-ID: <20190112012323.GA8478@dragon>
References: <20190111093003.2f00829e@canb.auug.org.au>
 <20190111095605.129a93a2@canb.auug.org.au>
 <20190111001559.12d91530@jawa>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190111001559.12d91530@jawa>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Majewski <lukma@denx.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Jan 11, 2019 at 12:15:59AM +0100, Lukasz Majewski wrote:
> Hi Stephen,
> 
> > Hi all,
> > 
> > On Fri, 11 Jan 2019 09:30:03 +1100 Stephen Rothwell
> > <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the imx-mxs tree, today's linux-next build (arm
> > > multi_v7_defconfig) failed like this:  
> > 
> > Actually this is only treated as a warning.

Thanks for reporting, Stephen.

> 
> Thanks for the notification. I will look on that (soon).

I just sent a fix for it.

https://patchwork.kernel.org/patch/10760827/

> 
> > 
> > > arch/arm/boot/dts/vfxxx.dtsi:550.24-563.6: Warning
> > > (spi_bus_bridge): /soc/aips-bus@40080000/spi@400ad000: incorrect
> > > #address-cells for SPI bus also defined at
> > > arch/arm/boot/dts/vf610-bk4.dts:130.8-142.3
> > > arch/arm/boot/dts/vf610-bk4.dtb: Warning (spi_bus_reg): Failed
> > > prerequisite 'spi_bus_bridge'
> > > 
> > > 
> > > Caused by commit
> > > 
> > >   cf91ce9696a0 ("ARM: dts: vf610-bk4: Provide support for reading
> > > ID code from MVB device")  

I found that the warning exists even on v5.0-rc1, so it's not caused by
Lukasz's change.

Shawn
