From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: arm64: build is broken on next-20170609 with merge-commit
 9afca2c4e379 (arm64: allwinner: sun50i-a64: add dwmac-sun8i Ethernet
 driver)
Date: Sat, 10 Jun 2017 09:29:44 +1000
Message-ID: <20170610092944.4022d550@canb.auug.org.au>
References: <20170609124325.p7b6fhdbwtki4w2z@yury-thinkpad>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47605 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751545AbdFIX3r (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 9 Jun 2017 19:29:47 -0400
In-Reply-To: <20170609124325.p7b6fhdbwtki4w2z@yury-thinkpad>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Yury Norov <ynorov@caviumnetworks.com>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, LABBE Corentin <clabbe.montjoie@gmail.com>, "David S. Miller" <davem@davemloft.net>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>

Hi Yury,

On Fri, 9 Jun 2017 15:43:25 +0300 Yury Norov <ynorov@caviumnetworks.com> wrote:
>
> Today's linux-next breaks build with:
>   DTC     arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dtb
> arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dtb: ERROR (duplicate_node_names): Duplicate node name /soc/ethernet@1c30000
> ERROR: Input tree has errors, aborting (use -f to force output)
> scripts/Makefile.lib:325: recipe for target 'arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dtb' failed
> make[2]: *** [arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dtb] Error 2
> scripts/Makefile.build:561: recipe for target 'arch/arm64/boot/dts/allwinner' failed
> make[1]: *** [arch/arm64/boot/dts/allwinner] Error 2 arch/arm64/Makefile:130: recipe for target 'dtbs' failed
> make: *** [dtbs] Error 2
> 
> It seems, it's due to duplication error in merge-commit 9afca2c4e379.
> Removing it fixes the build.

Thanks for the reports Yury and Sumit.  I will apply the following
merge fixup patch when I next build linux-next (unless one of the
patches is removed in the mean time).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Sat, 10 Jun 2017 09:18:14 +1000
Subject: [PATCH] remove duplicate ethernet noce intruduced by merge

caused by patch "arm64: allwinner: sun50i-a64: add dwmac-sun8i Ethernet
driver" being merged into the sunxi and net-next trees as different
commits (e53f67e981bc and 103aefa01c1b respectively). Presumably the
former will turn up in the arm-soc tree before being sent to Linus.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 1b36aab5afb6..9d00622ce845 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -469,26 +469,6 @@
 			};
 		};
 
-		emac: ethernet@1c30000 {
-			compatible = "allwinner,sun50i-a64-emac";
-			syscon = <&syscon>;
-			reg = <0x01c30000 0x100>;
-			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "macirq";
-			resets = <&ccu RST_BUS_EMAC>;
-			reset-names = "stmmaceth";
-			clocks = <&ccu CLK_BUS_EMAC>;
-			clock-names = "stmmaceth";
-			status = "disabled";
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			mdio: mdio {
-				#address-cells = <1>;
-				#size-cells = <0>;
-			};
-		};
-
 		gic: interrupt-controller@1c81000 {
 			compatible = "arm,gic-400";
 			reg = <0x01c81000 0x1000>,
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
