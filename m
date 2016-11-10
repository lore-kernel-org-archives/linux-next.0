From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mmc tree with the imx-mxs tree
Date: Thu, 10 Nov 2016 11:50:04 +1100
Message-ID: <20161110115004.431c171e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35641 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754569AbcKJAuH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Nov 2016 19:50:07 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawn.guo@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Yangbo Lu <yangbo.lu@nxp.com>, Hongtao Jia <hongtao.jia@nxp.com>

Hi Ulf,

Today's linux-next merge of the mmc tree got a conflict in:

  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi

between commit:

  784e94eeb377 ("arm64: dts: ls2080a: Add TMU device tree support for LS2080A")

from the imx-mxs tree and commit:

  61ab9ffac1b9 ("ARM64: dts: ls2080a: add device configuration node")

from the mmc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
index aa5a0fbf2cdf,d058e56db72d..000000000000
--- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
@@@ -222,100 -216,12 +222,106 @@@
  			clocks = <&sysclk>;
  		};
  
+ 		dcfg: dcfg@1e00000 {
+ 			compatible = "fsl,ls2080a-dcfg", "syscon";
+ 			reg = <0x0 0x1e00000 0x0 0x10000>;
+ 			little-endian;
+ 		};
+ 
 +		tmu: tmu@1f80000 {
 +			compatible = "fsl,qoriq-tmu";
 +			reg = <0x0 0x1f80000 0x0 0x10000>;
 +			interrupts = <0 23 0x4>;
 +			fsl,tmu-range = <0xb0000 0x9002a 0x6004c 0x30062>;
 +			fsl,tmu-calibration = <0x00000000 0x00000026
 +					       0x00000001 0x0000002d
 +					       0x00000002 0x00000032
 +					       0x00000003 0x00000039
 +					       0x00000004 0x0000003f
 +					       0x00000005 0x00000046
 +					       0x00000006 0x0000004d
 +					       0x00000007 0x00000054
 +					       0x00000008 0x0000005a
 +					       0x00000009 0x00000061
 +					       0x0000000a 0x0000006a
 +					       0x0000000b 0x00000071
 +
 +					       0x00010000 0x00000025
 +					       0x00010001 0x0000002c
 +					       0x00010002 0x00000035
 +					       0x00010003 0x0000003d
 +					       0x00010004 0x00000045
 +					       0x00010005 0x0000004e
 +					       0x00010006 0x00000057
 +					       0x00010007 0x00000061
 +					       0x00010008 0x0000006b
 +					       0x00010009 0x00000076
 +
 +					       0x00020000 0x00000029
 +					       0x00020001 0x00000033
 +					       0x00020002 0x0000003d
 +					       0x00020003 0x00000049
 +					       0x00020004 0x00000056
 +					       0x00020005 0x00000061
 +					       0x00020006 0x0000006d
 +
 +					       0x00030000 0x00000021
 +					       0x00030001 0x0000002a
 +					       0x00030002 0x0000003c
 +					       0x00030003 0x0000004e>;
 +			little-endian;
 +			#thermal-sensor-cells = <1>;
 +		};
 +
 +		thermal-zones {
 +			cpu_thermal: cpu-thermal {
 +				polling-delay-passive = <1000>;
 +				polling-delay = <5000>;
 +
 +				thermal-sensors = <&tmu 4>;
 +
 +				trips {
 +					cpu_alert: cpu-alert {
 +						temperature = <75000>;
 +						hysteresis = <2000>;
 +						type = "passive";
 +					};
 +					cpu_crit: cpu-crit {
 +						temperature = <85000>;
 +						hysteresis = <2000>;
 +						type = "critical";
 +					};
 +				};
 +
 +				cooling-maps {
 +					map0 {
 +						trip = <&cpu_alert>;
 +						cooling-device =
 +							<&cpu0 THERMAL_NO_LIMIT
 +							THERMAL_NO_LIMIT>;
 +					};
 +					map1 {
 +						trip = <&cpu_alert>;
 +						cooling-device =
 +							<&cpu2 THERMAL_NO_LIMIT
 +							THERMAL_NO_LIMIT>;
 +					};
 +					map2 {
 +						trip = <&cpu_alert>;
 +						cooling-device =
 +							<&cpu4 THERMAL_NO_LIMIT
 +							THERMAL_NO_LIMIT>;
 +					};
 +					map3 {
 +						trip = <&cpu_alert>;
 +						cooling-device =
 +							<&cpu6 THERMAL_NO_LIMIT
 +							THERMAL_NO_LIMIT>;
 +					};
 +				};
 +			};
 +		};
 +
  		serial0: serial@21c0500 {
  			compatible = "fsl,ns16550", "ns16550a";
  			reg = <0x0 0x21c0500 0x0 0x100>;
