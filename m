From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mfd tree with the arm-soc tree
Date: Tue, 24 Jan 2017 13:43:19 +1100
Message-ID: <20170124134319.2a6ba85d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33779 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750749AbdAXCnX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Jan 2017 21:43:23 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lee Jones <lee.jones@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Fabrice GASNIER <fabrice.gasnier@st.com>

Hi all,

Today's linux-next merge of the mfd tree got a conflict in:

  arch/arm/boot/dts/stm32f429.dtsi

between commits:

  3604ef9c8154 ("ARM: dts: stm32: Add ADC support to stm32f429")
  dd3feb755a4a ("ARM: dts: stm32: Add RTC support for STM32F429 MCU")

from the arm-soc tree and commit:

  9072b6b2ba83 ("ARM: dts: stm32: add Timers driver for stm32f429 MCU")

from the mfd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm/boot/dts/stm32f429.dtsi
index f05a9d95ef23,b6089351c0d3..000000000000
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@@ -125,20 -218,73 +225,87 @@@
  			status = "disabled";
  		};
  
+ 		timers7: timers@40001400 {
+ 			#address-cells = <1>;
+ 			#size-cells = <0>;
+ 			compatible = "st,stm32-timers";
+ 			reg = <0x40001400 0x400>;
+ 			clocks = <&rcc 0 133>;
+ 			clock-names = "int";
+ 			status = "disabled";
+ 
+ 			timer@6 {
+ 				compatible = "st,stm32-timer-trigger";
+ 				reg = <6>;
+ 				status = "disabled";
+ 			};
+ 		};
+ 
+ 			timers12: timers@40001800 {
+ 			#address-cells = <1>;
+ 			#size-cells = <0>;
+ 			compatible = "st,stm32-timers";
+ 			reg = <0x40001800 0x400>;
+ 			clocks = <&rcc 0 134>;
+ 			clock-names = "int";
+ 			status = "disabled";
+ 
+ 			pwm {
+ 				compatible = "st,stm32-pwm";
+ 				status = "disabled";
+ 			};
+ 
+ 			timer@11 {
+ 				compatible = "st,stm32-timer-trigger";
+ 				reg = <11>;
+ 				status = "disabled";
+ 			};
+ 		};
+ 
+ 		timers13: timers@40001c00 {
+ 			#address-cells = <1>;
+ 			#size-cells = <0>;
+ 			compatible = "st,stm32-timers";
+ 			reg = <0x40001C00 0x400>;
+ 			clocks = <&rcc 0 135>;
+ 			clock-names = "int";
+ 			status = "disabled";
+ 
+ 			pwm {
+ 				compatible = "st,stm32-pwm";
+ 				status = "disabled";
+ 			};
+ 		};
+ 
+ 		timers14: timers@40002000 {
+ 			#address-cells = <1>;
+ 			#size-cells = <0>;
+ 			compatible = "st,stm32-timers";
+ 			reg = <0x40002000 0x400>;
+ 			clocks = <&rcc 0 136>;
+ 			clock-names = "int";
+ 			status = "disabled";
+ 
+ 			pwm {
+ 				compatible = "st,stm32-pwm";
+ 				status = "disabled";
+ 			};
+ 		};
+ 
 +		rtc: rtc@40002800 {
 +			compatible = "st,stm32-rtc";
 +			reg = <0x40002800 0x400>;
 +			clocks = <&rcc 1 CLK_RTC>;
 +			clock-names = "ck_rtc";
 +			assigned-clocks = <&rcc 1 CLK_RTC>;
 +			assigned-clock-parents = <&rcc 1 CLK_LSE>;
 +			interrupt-parent = <&exti>;
 +			interrupts = <17 1>;
 +			interrupt-names = "alarm";
 +			st,syscfg = <&pwrcfg>;
 +			status = "disabled";
 +		};
 +
  		usart2: serial@40004400 {
  			compatible = "st,stm32-usart", "st,stm32-uart";
  			reg = <0x40004400 0x400>;
@@@ -433,11 -616,20 +693,26 @@@
  				};
  			};
  
 +			adc3_in8_pin: adc@200 {
 +				pins {
 +					pinmux = <STM32F429_PF10_FUNC_ANALOG>;
 +				};
 +			};
++
+ 			pwm1_pins: pwm@1 {
+ 				pins {
+ 					pinmux = <STM32F429_PA8_FUNC_TIM1_CH1>,
+ 						 <STM32F429_PB13_FUNC_TIM1_CH1N>,
+ 						 <STM32F429_PB12_FUNC_TIM1_BKIN>;
+ 				};
+ 			};
+ 
+ 			pwm3_pins: pwm@3 {
+ 				pins {
+ 					pinmux = <STM32F429_PB4_FUNC_TIM3_CH1>,
+ 						 <STM32F429_PB5_FUNC_TIM3_CH2>;
+ 				};
+ 			};
  		};
  
  		rcc: rcc@40023810 {
