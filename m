From: Tony Lindgren <tony@atomide.com>
Subject: Re: linux-next: build failure after merge of the omap tree
Date: Sun, 12 Apr 2015 16:18:35 -0700
Message-ID: <20150412231834.GE5140@atomide.com>
References: <20150407113618.7ddb495c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:44075 "EHLO muru.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752406AbbDLXWD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 12 Apr 2015 19:22:03 -0400
Content-Disposition: inline
In-Reply-To: <20150407113618.7ddb495c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>

* Stephen Rothwell <sfr@canb.auug.org.au> [150406 18:37]:
> Hi Tony,
> 
> After merging the omap tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> ERROR (phandle_references): Reference to non-existent node or label "omap3_scm_general"
> 
> ERROR: Input tree has errors, aborting (use -f to force output)
> ERROR (phandle_references): Reference to non-existent node or label "omap3_scm_general"
> 
> ERROR: Input tree has errors, aborting (use -f to force output)
> make[2]: *** [arch/arm/boot/dts/am3517_mt_ventoux.dtb] Error 2
> make[2]: *** [arch/arm/boot/dts/omap3430-sdp.dtb] Error 2
> ERROR (phandle_references): Reference to non-existent node or label "omap3_scm_general"
> 
> ERROR: Input tree has errors, aborting (use -f to force output)
> make[2]: *** [arch/arm/boot/dts/omap3-beagle-xm.dtb] Error 2
> ERROR (phandle_references): Reference to non-existent node or label "omap3_scm_general"
> 
> ERROR: Input tree has errors, aborting (use -f to force output)
> make[2]: *** [arch/arm/boot/dts/omap3-beagle-xm-ab.dtb] Error 2
> ERROR (phandle_references): Reference to non-existent node or label "omap3_scm_general"
> 
> ERROR: Input tree has errors, aborting (use -f to force output)
> ERROR (phandle_references): Reference to non-existent node or label "omap3_scm_general"
> 
> ERROR: Input tree has errors, aborting (use -f to force output)
> make[2]: *** [arch/arm/boot/dts/omap3-beagle.dtb] Error 2
> make[2]: *** [arch/arm/boot/dts/omap3-devkit8000.dtb] Error 2
> ERROR (phandle_references): Reference to non-existent node or label "omap3_scm_general"
> 
> ERROR: Input tree has errors, aborting (use -f to force output)
> make[2]: *** [arch/arm/boot/dts/omap3-cm-t3530.dtb] Error 2
> ERROR (phandle_references): Reference to non-existent node or label "omap3_scm_general"
> 
> ERROR: Input tree has errors, aborting (use -f to force output)
> ERROR (phandle_references): Reference to non-existent node or label "omap3_scm_general"
> 
> ERROR: Input tree has errors, aborting (use -f to force output)
> make[2]: *** [arch/arm/boot/dts/omap3-cm-t3730.dtb] Error 2
> make[2]: *** [arch/arm/boot/dts/omap3-evm-37xx.dtb] Error 2
> ERROR (phandle_references): Reference to non-existent node or label "omap3_scm_general"
> 
> ERROR: Input tree has errors, aborting (use -f to force output)
> make[2]: *** [arch/arm/boot/dts/omap3-evm.dtb] Error 2
> 
> Presumably caused by commit b8845074cfbb ("ARM: dts: omap3: add minimal
> l4 bus layout with control module support") interacting with commit
> e52117638b79 ("ARM: dts: omap3: Add DT entries for OMAP 3 ISP") from
> the arm-soc tree.
> 
> I applied the following merge fix patch for today (probably wrong, but
> hopefully builds):
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 7 Apr 2015 11:30:14 +1000
> Subject: [PATCH] ARM: dts: omap3: fixup for merge conflict around
>  omap3_scm_general

Sorry did not notice this until today, yes that's the correct fix thanks.

Regards,

Tony
 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/arm/boot/dts/omap34xx.dtsi | 2 +-
>  arch/arm/boot/dts/omap36xx.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/omap34xx.dtsi b/arch/arm/boot/dts/omap34xx.dtsi
> index 7bc8c0f72ddb..4f6b2d5b1902 100644
> --- a/arch/arm/boot/dts/omap34xx.dtsi
> +++ b/arch/arm/boot/dts/omap34xx.dtsi
> @@ -46,7 +46,7 @@
>  			       0x480bd800 0x017c>;
>  			interrupts = <24>;
>  			iommus = <&mmu_isp>;
> -			syscon = <&omap3_scm_general 0xdc>;
> +			syscon = <&scm_conf 0xdc>;
>  			ti,phy-type = <OMAP3ISP_PHY_TYPE_COMPLEX_IO>;
>  			#clock-cells = <1>;
>  			ports {
> diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
> index 3502fe00ec7d..86253de5a97a 100644
> --- a/arch/arm/boot/dts/omap36xx.dtsi
> +++ b/arch/arm/boot/dts/omap36xx.dtsi
> @@ -78,7 +78,7 @@
>  			       0x480bd800 0x0600>;
>  			interrupts = <24>;
>  			iommus = <&mmu_isp>;
> -			syscon = <&omap3_scm_general 0x2f0>;
> +			syscon = <&scm_conf 0x2f0>;
>  			ti,phy-type = <OMAP3ISP_PHY_TYPE_CSIPHY>;
>  			#clock-cells = <1>;
>  			ports {
> -- 
> 2.1.4
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
