From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the clk tree with the arm-soc tree
Date: Wed, 23 Nov 2016 10:59:27 +1100
Message-ID: <20161123105927.4d2c263c@canb.auug.org.au>
References: <20161122194130.4efdd019@canb.auug.org.au>
        <CAMuHMdU5Df2kNT=ccr7Ts6=a1ELRJdiBbh1xxuqo+e_UeYw-tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34581 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751245AbcKVX73 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Nov 2016 18:59:29 -0500
In-Reply-To: <CAMuHMdU5Df2kNT=ccr7Ts6=a1ELRJdiBbh1xxuqo+e_UeYw-tw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>

Hi Geert,

On Tue, 22 Nov 2016 10:36:46 +0100 Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Most of these are of the "add both sides" type.
> The only exception is the one in arch/arm/mach-shmobile/setup-rcar-gen2.c,
> where you just want to keep the call to of_clk_init(NULL);
> 
> There's a resolution in
> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/log/?h=renesas-devel-20161117v2-v4.9-rc5%2brcar-rst
> 
> Sorry for the mess.

Thanks for the help.  Today I did this much earlier in the build and
got the following merge resolution (which matches yours, I think).
The resolution for arch/arm/mach-shmobile/setup-rcar-gen2.c is empty
because I used the clk tree side of the conflicts.
-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm/boot/dts/r8a7779.dtsi
index 9d3bb74bd3f6,8cf16008a09b..000000000000
--- a/arch/arm/boot/dts/r8a7779.dtsi
+++ b/arch/arm/boot/dts/r8a7779.dtsi
@@@ -590,11 -590,11 +590,16 @@@
  		};
  	};
  
 +	prr: chipid@ff000044 {
 +		compatible = "renesas,prr";
 +		reg = <0xff000044 4>;
 +	};
 +
+ 	rst: reset-controller@ffcc0000 {
+ 		compatible = "renesas,r8a7779-reset-wdt";
+ 		reg = <0xffcc0000 0x48>;
+ 	};
+ 
  	sysc: system-controller@ffd85000 {
  		compatible = "renesas,r8a7779-sysc";
  		reg = <0xffd85000 0x0200>;
diff --cc arch/arm/boot/dts/r8a7790.dtsi
index f554ef3c8096,3f10b0bf1b08..000000000000
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@@ -1471,11 -1471,11 +1471,16 @@@
  		};
  	};
  
 +	prr: chipid@ff000044 {
 +		compatible = "renesas,prr";
 +		reg = <0 0xff000044 0 4>;
 +	};
 +
+ 	rst: reset-controller@e6160000 {
+ 		compatible = "renesas,r8a7790-rst";
+ 		reg = <0 0xe6160000 0 0x0100>;
+ 	};
+ 
  	sysc: system-controller@e6180000 {
  		compatible = "renesas,r8a7790-sysc";
  		reg = <0 0xe6180000 0 0x0200>;
diff --cc arch/arm/boot/dts/r8a7791.dtsi
index 4c50de2faef1,c465c79bcca6..000000000000
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@@ -1485,11 -1482,11 +1485,16 @@@
  		};
  	};
  
 +	prr: chipid@ff000044 {
 +		compatible = "renesas,prr";
 +		reg = <0 0xff000044 0 4>;
 +	};
 +
+ 	rst: reset-controller@e6160000 {
+ 		compatible = "renesas,r8a7791-rst";
+ 		reg = <0 0xe6160000 0 0x0100>;
+ 	};
+ 
  	sysc: system-controller@e6180000 {
  		compatible = "renesas,r8a7791-sysc";
  		reg = <0 0xe6180000 0 0x0200>;
diff --cc arch/arm/boot/dts/r8a7792.dtsi
index 69789020cf39,6e1f61f65d29..000000000000
--- a/arch/arm/boot/dts/r8a7792.dtsi
+++ b/arch/arm/boot/dts/r8a7792.dtsi
@@@ -120,11 -118,11 +120,16 @@@
  				      IRQ_TYPE_LEVEL_LOW)>;
  		};
  
 +		prr: chipid@ff000044 {
 +			compatible = "renesas,prr";
 +			reg = <0 0xff000044 0 4>;
 +		};
 +
+ 		rst: reset-controller@e6160000 {
+ 			compatible = "renesas,r8a7792-rst";
+ 			reg = <0 0xe6160000 0 0x0100>;
+ 		};
+ 
  		sysc: system-controller@e6180000 {
  			compatible = "renesas,r8a7792-sysc";
  			reg = <0 0xe6180000 0 0x0200>;
diff --cc arch/arm/boot/dts/r8a7793.dtsi
index a377dda17724,e4b385eccf74..000000000000
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@@ -1306,11 -1279,11 +1306,16 @@@
  		};
  	};
  
 +	prr: chipid@ff000044 {
 +		compatible = "renesas,prr";
 +		reg = <0 0xff000044 0 4>;
 +	};
 +
+ 	rst: reset-controller@e6160000 {
+ 		compatible = "renesas,r8a7793-rst";
+ 		reg = <0 0xe6160000 0 0x0100>;
+ 	};
+ 
  	sysc: system-controller@e6180000 {
  		compatible = "renesas,r8a7793-sysc";
  		reg = <0 0xe6180000 0 0x0200>;
diff --cc arch/arm/boot/dts/r8a7794.dtsi
index 63dc7f29d216,69e4f4fad89b..000000000000
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@@ -1377,11 -1375,11 +1377,16 @@@
  		};
  	};
  
 +	prr: chipid@ff000044 {
 +		compatible = "renesas,prr";
 +		reg = <0 0xff000044 0 4>;
 +	};
 +
+ 	rst: reset-controller@e6160000 {
+ 		compatible = "renesas,r8a7794-rst";
+ 		reg = <0 0xe6160000 0 0x0100>;
+ 	};
+ 
  	sysc: system-controller@e6180000 {
  		compatible = "renesas,r8a7794-sysc";
  		reg = <0 0xe6180000 0 0x0200>;
diff --cc arch/arm/mach-shmobile/setup-rcar-gen2.c
index 14c1f0ed2ecb,b527258e0a62..000000000000
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
diff --cc arch/arm64/boot/dts/renesas/r8a7795.dtsi
index a39a702b904d,625dda713548..000000000000
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@@ -321,11 -321,11 +321,16 @@@
  			#power-domain-cells = <0>;
  		};
  
 +		prr: chipid@fff00044 {
 +			compatible = "renesas,prr";
 +			reg = <0 0xfff00044 0 4>;
 +		};
 +
+ 		rst: reset-controller@e6160000 {
+ 			compatible = "renesas,r8a7795-rst";
+ 			reg = <0 0xe6160000 0 0x0200>;
+ 		};
+ 
  		sysc: system-controller@e6180000 {
  			compatible = "renesas,r8a7795-sysc";
  			reg = <0 0xe6180000 0 0x0400>;
diff --cc arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 41a050d2f192,75c8c55a8248..000000000000
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@@ -243,11 -233,11 +243,16 @@@
  			#power-domain-cells = <0>;
  		};
  
 +		prr: chipid@fff00044 {
 +			compatible = "renesas,prr";
 +			reg = <0 0xfff00044 0 4>;
 +		};
 +
+ 		rst: reset-controller@e6160000 {
+ 			compatible = "renesas,r8a7796-rst";
+ 			reg = <0 0xe6160000 0 0x0200>;
+ 		};
+ 
  		sysc: system-controller@e6180000 {
  			compatible = "renesas,r8a7796-sysc";
  			reg = <0 0xe6180000 0 0x0400>;
diff --cc drivers/soc/renesas/Makefile
index 91c42b34705f,86cc78cd1962..000000000000
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@@ -1,7 -1,8 +1,12 @@@
 +obj-$(CONFIG_SOC_BUS)		+= renesas-soc.o
 +
+ obj-$(CONFIG_ARCH_RCAR_GEN1)	+= rcar-rst.o
+ obj-$(CONFIG_ARCH_RCAR_GEN2)	+= rcar-rst.o
+ obj-$(CONFIG_ARCH_R8A7795)	+= rcar-rst.o
+ obj-$(CONFIG_ARCH_R8A7796)	+= rcar-rst.o
+ 
 +obj-$(CONFIG_ARCH_R8A7743)	+= rcar-sysc.o r8a7743-sysc.o
 +obj-$(CONFIG_ARCH_R8A7745)	+= rcar-sysc.o r8a7745-sysc.o
  obj-$(CONFIG_ARCH_R8A7779)	+= rcar-sysc.o r8a7779-sysc.o
  obj-$(CONFIG_ARCH_R8A7790)	+= rcar-sysc.o r8a7790-sysc.o
  obj-$(CONFIG_ARCH_R8A7791)	+= rcar-sysc.o r8a7791-sysc.o
