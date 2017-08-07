From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rockchip tree with Linus' tree
Date: Mon, 7 Aug 2017 10:18:43 +1000
Message-ID: <20170807101843.4819a9a0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Simon Xue <xxm@rock-chips.com>, Tao Huang <huangtao@rock-chips.com>
List-Id: linux-next.vger.kernel.org

Hi Heiko,

Today's linux-next merge of the rockchip tree got a conflict in:

  arch/arm/boot/dts/rk3288.dtsi

between commit:

  ca12437303f3 ("ARM: dts: rockchip: fix mali gpu node on rk3288")

from Linus' tree and commits:

  79db45be2b8b ("ARM: dts: rockchip: convert rk3288 device tree files to 64 bits")
  1cc47e63599c ("ARM: dts: rockchip: add more iommu nodes on rk3288")

from the rockchip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm/boot/dts/rk3288.dtsi
index 858e1fed762a,c0c04e99e159..000000000000
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@@ -1126,9 -1145,27 +1145,27 @@@
  		};
  	};
  
+ 	vpu_mmu: iommu@ff9a0800 {
+ 		compatible = "rockchip,iommu";
+ 		reg = <0x0 0xff9a0800 0x0 0x100>;
+ 		interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+ 		interrupt-names = "vpu_mmu";
+ 		#iommu-cells = <0>;
+ 		status = "disabled";
+ 	};
+ 
+ 	hevc_mmu: iommu@ff9c0440 {
+ 		compatible = "rockchip,iommu";
+ 		reg = <0x0 0xff9c0440 0x0 0x40>, <0x0 0xff9c0480 0x0 0x40>;
+ 		interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+ 		interrupt-names = "hevc_mmu";
+ 		#iommu-cells = <0>;
+ 		status = "disabled";
+ 	};
+ 
 -	gpu: mali@ffa30000 {
 -		compatible = "rockchip,rk3288-mali", "arm,mali-t760", "arm,mali-midgard";
 +	gpu: gpu@ffa30000 {
 +		compatible = "rockchip,rk3288-mali", "arm,mali-t760";
- 		reg = <0xffa30000 0x10000>;
+ 		reg = <0x0 0xffa30000 0x0 0x10000>;
  		interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
  			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
  			     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
