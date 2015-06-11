From: Borislav Petkov <bp@alien8.de>
Subject: Re: linux-next: manual merge of the edac-amd tree with the pci tree
Date: Thu, 11 Jun 2015 10:51:26 +0200
Message-ID: <20150611085126.GC30382@pd.tnic>
References: <20150611152853.4102c2f1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150611152853.4102c2f1@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Duc Dang <dhdang@apm.com>, Loc Ho <lho@apm.com>, Tanmay Inamdar <tinamdar@apm.com>
List-Id: linux-next.vger.kernel.org

On Thu, Jun 11, 2015 at 03:28:53PM +1000, Stephen Rothwell wrote:
> Hi Borislav,
> 
> Today's linux-next merge of the edac-amd tree got a conflict in
> arch/arm64/boot/dts/apm/apm-storm.dtsi between commit e1e6e5c4de24
> ("arm64: dts: Add APM X-Gene PCIe MSI nodes") from the  tree and commit
> 8f2ae6f30d5e ("arm64: Add APM X-Gene SoC EDAC DTS entries") from the
> edac-amd tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks Stephen.

>From looking at this, the merge should be inclusive as that apm-storm DT
thing is supposed to collect all device tree definitions IMHO. But I'm
no devicetree dude.

Arnd, see below, am I making sense here?

Thanks.

(leaving in the rest for reference)

> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc arch/arm64/boot/dts/apm/apm-storm.dtsi
> index d8f3a1c65ecd,577799f0c5a3..000000000000
> --- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
> +++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
> @@@ -374,28 -374,89 +374,111 @@@
>   			};
>   		};
>   
>  +		msi: msi@79000000 {
>  +			compatible = "apm,xgene1-msi";
>  +			msi-controller;
>  +			reg = <0x00 0x79000000 0x0 0x900000>;
>  +			interrupts = <  0x0 0x10 0x4
>  +					0x0 0x11 0x4
>  +					0x0 0x12 0x4
>  +					0x0 0x13 0x4
>  +					0x0 0x14 0x4
>  +					0x0 0x15 0x4
>  +					0x0 0x16 0x4
>  +					0x0 0x17 0x4
>  +					0x0 0x18 0x4
>  +					0x0 0x19 0x4
>  +					0x0 0x1a 0x4
>  +					0x0 0x1b 0x4
>  +					0x0 0x1c 0x4
>  +					0x0 0x1d 0x4
>  +					0x0 0x1e 0x4
>  +					0x0 0x1f 0x4>;
>  +		};
>  +
> + 		csw: csw@7e200000 {
> + 			compatible = "apm,xgene-csw", "syscon";
> + 			reg = <0x0 0x7e200000 0x0 0x1000>;
> + 		};
> + 
> + 		mcba: mcba@7e700000 {
> + 			compatible = "apm,xgene-mcb", "syscon";
> + 			reg = <0x0 0x7e700000 0x0 0x1000>;
> + 		};
> + 
> + 		mcbb: mcbb@7e720000 {
> + 			compatible = "apm,xgene-mcb", "syscon";
> + 			reg = <0x0 0x7e720000 0x0 0x1000>;
> + 		};
> + 
> + 		efuse: efuse@1054a000 {
> + 			compatible = "apm,xgene-efuse", "syscon";
> + 			reg = <0x0 0x1054a000 0x0 0x20>;
> + 		};
> + 
> + 		edac@78800000 {
> + 			compatible = "apm,xgene-edac";
> + 			#address-cells = <2>;
> + 			#size-cells = <2>;
> + 			ranges;
> + 			regmap-csw = <&csw>;
> + 			regmap-mcba = <&mcba>;
> + 			regmap-mcbb = <&mcbb>;
> + 			regmap-efuse = <&efuse>;
> + 			reg = <0x0 0x78800000 0x0 0x100>;
> + 			interrupts = <0x0 0x20 0x4>,
> + 				     <0x0 0x21 0x4>,
> + 				     <0x0 0x27 0x4>;
> + 
> + 			edacmc@7e800000 {
> + 				compatible = "apm,xgene-edac-mc";
> + 				reg = <0x0 0x7e800000 0x0 0x1000>;
> + 				memory-controller = <0>;
> + 			};
> + 
> + 			edacmc@7e840000 {
> + 				compatible = "apm,xgene-edac-mc";
> + 				reg = <0x0 0x7e840000 0x0 0x1000>;
> + 				memory-controller = <1>;
> + 			};
> + 
> + 			edacmc@7e880000 {
> + 				compatible = "apm,xgene-edac-mc";
> + 				reg = <0x0 0x7e880000 0x0 0x1000>;
> + 				memory-controller = <2>;
> + 			};
> + 
> + 			edacmc@7e8c0000 {
> + 				compatible = "apm,xgene-edac-mc";
> + 				reg = <0x0 0x7e8c0000 0x0 0x1000>;
> + 				memory-controller = <3>;
> + 			};
> + 
> + 			edacpmd@7c000000 {
> + 				compatible = "apm,xgene-edac-pmd";
> + 				reg = <0x0 0x7c000000 0x0 0x200000>;
> + 				pmd-controller = <0>;
> + 			};
> + 
> + 			edacpmd@7c200000 {
> + 				compatible = "apm,xgene-edac-pmd";
> + 				reg = <0x0 0x7c200000 0x0 0x200000>;
> + 				pmd-controller = <1>;
> + 			};
> + 
> + 			edacpmd@7c400000 {
> + 				compatible = "apm,xgene-edac-pmd";
> + 				reg = <0x0 0x7c400000 0x0 0x200000>;
> + 				pmd-controller = <2>;
> + 			};
> + 
> + 			edacpmd@7c600000 {
> + 				compatible = "apm,xgene-edac-pmd";
> + 				reg = <0x0 0x7c600000 0x0 0x200000>;
> + 				pmd-controller = <3>;
> + 			};
> + 		};
> + 
>   		pcie0: pcie@1f2b0000 {
>   			status = "disabled";
>   			device_type = "pci";



-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
