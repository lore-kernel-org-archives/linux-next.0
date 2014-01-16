From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: linux-next: manual merge of the libata tree with the arm-soc
 tree
Date: Thu, 16 Jan 2014 07:26:29 -0500
Message-ID: <20140116122629.GG29184@titan.lakedaemon.net>
References: <20140116114831.50261e22b6fb25aac2004b43@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mho-02-ewr.mailhop.org ([204.13.248.72]:16413 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752488AbaAPM0p (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Jan 2014 07:26:45 -0500
Content-Disposition: inline
In-Reply-To: <20140116114831.50261e22b6fb25aac2004b43@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tejun Heo <tj@kernel.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Guinot <simon.guinot@sequanux.org>, Kevin Hilman <khilman@linaro.org>

Stephen,

Thanks, this looks good.

Arnd, Olof, Kevin,

This patch is in Tejun's tree because it is part of a patch series
fixing SATA hotplug.  That series is marked for stable.

thx,

Jason.

On Thu, Jan 16, 2014 at 11:48:31AM +1100, Stephen Rothwell wrote:
> Hi Tejun,
> 
> Today's linux-next merge of the libata tree got a conflict in
> arch/arm/boot/dts/armada-370-xp.dtsi between commit a095b1c78a35 ("ARM:
> mvebu: sort DT nodes by address") from the arm-soc tree and commit
> a96cc303e42a ("ARM: mvebu: update the SATA compatible string for Armada
> 370/XP") from the libata tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc arch/arm/boot/dts/armada-370-xp.dtsi
> index b6b253924893,df141a1d6448..000000000000
> --- a/arch/arm/boot/dts/armada-370-xp.dtsi
> +++ b/arch/arm/boot/dts/armada-370-xp.dtsi
> @@@ -236,12 -183,13 +236,12 @@@
>   				status = "disabled";
>   			};
>   
>  -			i2c0: i2c@11000 {
>  -				compatible = "marvell,mv64xxx-i2c";
>  -				#address-cells = <1>;
>  -				#size-cells = <0>;
>  -				interrupts = <31>;
>  -				timeout-ms = <1000>;
>  -				clocks = <&coreclk 0>;
>  +			sata@a0000 {
> - 				compatible = "marvell,orion-sata";
> ++				compatible = "marvell,armada-370-sata";
>  +				reg = <0xa0000 0x5000>;
>  +				interrupts = <55>;
>  +				clocks = <&gateclk 15>, <&gateclk 30>;
>  +				clock-names = "0", "1";
>   				status = "disabled";
>   			};
>   
