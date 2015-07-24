From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mmc-uh tree with the imx-mxs tree
Date: Fri, 24 Jul 2015 12:02:11 +1000
Message-ID: <20150724120211.4a965ddd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawn.guo@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dong Aisheng <aisheng.dong@freescale.com>, Tim Harvey <tharvey@gateworks.com>
List-Id: linux-next.vger.kernel.org

Hi Ulf,

Today's linux-next merge of the mmc-uh tree got conflicts in:

  arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
  arch/arm/boot/dts/imx6qdl-gw53xx.dtsi
  arch/arm/boot/dts/imx6qdl-gw54xx.dtsi

between commit:

  82a5485b6aef ("ARM: dts: ventana: add UHS-I support for Ventana boards")

from the imx-mxs tree and commit:

  849dea0a52d2 ("dts: imx6: fix sd card gpio polarity specified in device tree")

from the mmc-uh tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
index b8e35513aed2,4493f6e99330..000000000000
--- a/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
@@@ -316,13 -316,10 +316,13 @@@
  };
  
  &usdhc3 {
 -	pinctrl-names = "default";
 +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
  	pinctrl-0 = <&pinctrl_usdhc3>;
 +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
 +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
- 	cd-gpios = <&gpio7 0 GPIO_ACTIVE_HIGH>;
+ 	cd-gpios = <&gpio7 0 GPIO_ACTIVE_LOW>;
  	vmmc-supply = <&reg_3p3v>;
 +	no-1-8-v; /* firmware will remove if board revision supports */
  	status = "okay";
  };
  
diff --cc arch/arm/boot/dts/imx6qdl-gw53xx.dtsi
index 765c3a758ae0,a857d1294609..000000000000
--- a/arch/arm/boot/dts/imx6qdl-gw53xx.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw53xx.dtsi
@@@ -322,13 -322,10 +322,13 @@@
  };
  
  &usdhc3 {
 -	pinctrl-names = "default";
 +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
  	pinctrl-0 = <&pinctrl_usdhc3>;
 +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
 +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
- 	cd-gpios = <&gpio7 0 GPIO_ACTIVE_HIGH>;
+ 	cd-gpios = <&gpio7 0 GPIO_ACTIVE_LOW>;
  	vmmc-supply = <&reg_3p3v>;
 +	no-1-8-v; /* firmware will remove if board revision supports */
  	status = "okay";
  };
  
diff --cc arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
index 1100aab4be54,1afe3385e2d2..000000000000
--- a/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
@@@ -415,13 -415,10 +415,13 @@@
  };
  
  &usdhc3 {
 -	pinctrl-names = "default";
 +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
  	pinctrl-0 = <&pinctrl_usdhc3>;
 +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
 +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
- 	cd-gpios = <&gpio7 0 GPIO_ACTIVE_HIGH>;
+ 	cd-gpios = <&gpio7 0 GPIO_ACTIVE_LOW>;
  	vmmc-supply = <&reg_3p3v>;
 +	no-1-8-v; /* firmware will remove if board revision supports */
  	status = "okay";
  };
  
