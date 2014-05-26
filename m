From: "Li.Xiubo@freescale.com" <Li.Xiubo@freescale.com>
Subject: RE: linux-next: manual merge of the clockevents tree with the
 arm-soc tree
Date: Mon, 26 May 2014 06:03:38 +0000
Message-ID: <8c52af4f7de64210bb4e37e265e9e827@DM2PR03MB509.namprd03.prod.outlook.com>
References: <20140526154331.7fc6b30c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140526154331.7fc6b30c@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Lezcano <daniel.lezcano@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "cosminstefan.stoica@freescale.com" <cosminstefan.stoica@freescale.com>, Shawn Guo <Shawn.Guo@freescale.com>
List-Id: linux-next.vger.kernel.org

> Subject: linux-next: manual merge of the clockevents tree with the arm-soc
> tree
> 
> Hi Daniel,
> 
> Today's linux-next merge of the clockevents tree got a conflict in
> arch/arm/boot/dts/vf610.dtsi between commit 0517fe6aa880 ("ARM: dts:
> vf610-twr: Add support for sdhc1") from the arm-soc tree and commit
> 07513e1330a9 ("ARM: dts: vf610: Add Freescale FlexTimer Module timer
> node") from the clockevents tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 

Acked-by: Xiubo Li <Li.Xiubo@freescale.com>

Thanks,

BRs
Xiubo

> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc arch/arm/boot/dts/vf610.dtsi
> index 73355ddc5186,3c91b84066a1..000000000000
> --- a/arch/arm/boot/dts/vf610.dtsi
> +++ b/arch/arm/boot/dts/vf610.dtsi
> @@@ -360,17 -347,19 +360,30 @@@
>   				status = "disabled";
>   			};
> 
>  +			esdhc1: esdhc@400b2000 {
>  +				compatible = "fsl,imx53-esdhc";
>  +				reg = <0x400b2000 0x4000>;
>  +				interrupts = <0 28 0x04>;
>  +				clocks = <&clks VF610_CLK_IPG_BUS>,
>  +					<&clks VF610_CLK_PLATFORM_BUS>,
>  +					<&clks VF610_CLK_ESDHC1>;
>  +				clock-names = "ipg", "ahb", "per";
>  +				status = "disabled";
>  +			};
>  +
> + 			ftm: ftm@400b8000 {
> + 				compatible = "fsl,ftm-timer";
> + 				reg = <0x400b8000 0x1000 0x400b9000 0x1000>;
> + 				interrupts = <0 44 IRQ_TYPE_LEVEL_HIGH>;
> + 				clock-names = "ftm-evt", "ftm-src",
> + 					"ftm-evt-counter-en", "ftm-src-counter-en";
> + 				clocks = <&clks VF610_CLK_FTM2>,
> + 					<&clks VF610_CLK_FTM3>,
> + 					<&clks VF610_CLK_FTM2_EXT_FIX_EN>,
> + 					<&clks VF610_CLK_FTM3_EXT_FIX_EN>;
> + 				status = "disabled";
> + 			};
> +
>   			fec0: ethernet@400d0000 {
>   				compatible = "fsl,mvf600-fec";
>   				reg = <0x400d0000 0x1000>;
