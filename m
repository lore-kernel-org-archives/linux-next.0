From: Simon Horman <horms@verge.net.au>
Subject: Re: linux-next: manual merge of the renesas tree with the arm tree
Date: Mon, 20 Mar 2017 09:07:01 +0100
Message-ID: <20170320080659.GA20257@verge.net.au>
References: <20170320100411.6970f7b1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170320100411.6970f7b1@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Russell King <rmk@armlinux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: linux-next.vger.kernel.org

On Mon, Mar 20, 2017 at 10:04:11AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the renesas tree got a conflict in:
> 
>   arch/arm/boot/dts/r7s72100.dtsi
> 
> between commit:
> 
>   f08578e6da96 ("ARM: 8661/1: dts: r7s72100: add l2 cache")
> 
> from the arm tree and commit:
> 
>   69ed50de582e ("ARM: dts: r7s72100: Add watchdog timer")
> 
> from the renesas tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks Stephen,

this looks correct to me.

> diff --cc arch/arm/boot/dts/r7s72100.dtsi
> index 1cf2bd038090,9b12d73e67dc..000000000000
> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@@ -369,16 -371,13 +372,23 @@@
>   			<0xe8202000 0x1000>;
>   	};
>   
>  +	L2: cache-controller@3ffff000 {
>  +		compatible = "arm,pl310-cache";
>  +		reg = <0x3ffff000 0x1000>;
>  +		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
>  +		arm,early-bresp-disable;
>  +		arm,full-line-zero-disable;
>  +		cache-unified;
>  +		cache-level = <2>;
>  +	};
>  +
> + 	wdt: watchdog@fcfe0000 {
> + 		compatible = "renesas,r7s72100-wdt", "renesas,rza-wdt";
> + 		reg = <0xfcfe0000 0x6>;
> + 		interrupts = <GIC_SPI 106 IRQ_TYPE_EDGE_RISING>;
> + 		clocks = <&p0_clk>;
> + 	};
> + 
>   	i2c0: i2c@fcfee000 {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
> 
