From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the iommu tree with the arm-soc tree
Date: Mon, 29 Feb 2016 15:16:24 +1100
Message-ID: <20160229151624.338cef0e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50361 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754859AbcB2EQ1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 28 Feb 2016 23:16:27 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joerg Roedel <joro@8bytes.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Yong Wu <yong.wu@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>

Hi Joerg,

Today's linux-next merge of the iommu tree got a conflict in:

  arch/arm64/boot/dts/mediatek/mt8173.dtsi

between commit:

  93e9f5ee1e35 ("dts: arm64: Add EFUSE device node")

from the arm-soc tree and commit:

  5ff6b3a6d391 ("dts: mt8173: Add iommu/smi nodes for mt8173")

from the iommu tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm64/boot/dts/mediatek/mt8173.dtsi
index f4bd3c9182ad,804881181fcc..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@@ -277,11 -278,17 +278,22 @@@
  			reg = <0 0x10200620 0 0x20>;
  		};
  
+ 		iommu: iommu@10205000 {
+ 			compatible = "mediatek,mt8173-m4u";
+ 			reg = <0 0x10205000 0 0x1000>;
+ 			interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_LOW>;
+ 			clocks = <&infracfg CLK_INFRA_M4U>;
+ 			clock-names = "bclk";
+ 			mediatek,larbs = <&larb0 &larb1 &larb2
+ 					  &larb3 &larb4 &larb5>;
+ 			#iommu-cells = <1>;
+ 		};
+ 
 +		efuse: efuse@10206000 {
 +			compatible = "mediatek,mt8173-efuse";
 +			reg = <0 0x10206000 0 0x1000>;
 +		};
 +
  		apmixedsys: clock-controller@10209000 {
  			compatible = "mediatek,mt8173-apmixedsys";
  			reg = <0 0x10209000 0 0x1000>;
