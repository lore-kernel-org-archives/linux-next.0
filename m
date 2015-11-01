From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pinctrl tree with the at91 tree
Date: Mon, 2 Nov 2015 01:16:19 +1100
Message-ID: <20151102011619.0ff847db@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33433 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751270AbbKAOQW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Nov 2015 09:16:22 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ludovic Desroches <ludovic.desroches@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>

Hi Linus,

Today's linux-next merge of the pinctrl tree got a conflict in:

  arch/arm/boot/dts/sama5d2.dtsi

between commit:

  512fc048e4fd ("ARM: at91/dt: sama5d2: add missing devices")

from the at91 tree and commit:

  f6c804b08ca5 ("ARM: at91/dt: sama5d2: add pio controller node")

from the pinctrl tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/boot/dts/sama5d2.dtsi
index c1f0cba40289,cc05cde0f9a4..000000000000
--- a/arch/arm/boot/dts/sama5d2.dtsi
+++ b/arch/arm/boot/dts/sama5d2.dtsi
@@@ -1054,21 -922,19 +1054,35 @@@
  				status = "disabled";
  			};
  
 +			tdes@fc044000 {
 +				compatible = "atmel,at91sam9g46-tdes";
 +				reg = <0xfc044000 0x100>;
 +				interrupts = <11 IRQ_TYPE_LEVEL_HIGH 0>;
 +				dmas = <&dma0
 +					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
 +					 AT91_XDMAC_DT_PERID(28))>,
 +				       <&dma0
 +					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
 +					 AT91_XDMAC_DT_PERID(29))>;
 +				dma-names = "tx", "rx";
 +				clocks = <&tdes_clk>;
 +				clock-names = "tdes_clk";
 +				status = "okay";
 +			};
++
+ 			pioA: pinctrl@fc038000 {
+ 				compatible = "atmel,sama5d2-pinctrl";
+ 				reg = <0xfc038000 0x600>;
+ 				interrupts = <18 IRQ_TYPE_LEVEL_HIGH 7>,
+ 					     <68 IRQ_TYPE_LEVEL_HIGH 7>,
+ 					     <69 IRQ_TYPE_LEVEL_HIGH 7>,
+ 					     <70 IRQ_TYPE_LEVEL_HIGH 7>;
+ 				interrupt-controller;
+ 				#interrupt-cells = <2>;
+ 				gpio-controller;
+ 				#gpio-cells = <2>;
+ 				clocks = <&pioA_clk>;
+ 			};
  		};
  	};
  };
