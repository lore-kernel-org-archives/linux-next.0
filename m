From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the crypto tree with the amlogic tree
Date: Tue, 14 Jun 2016 11:50:09 +1000
Message-ID: <20160614115009.597ebc07@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Carlo Caione <carlo@endlessm.com>
List-Id: linux-next.vger.kernel.org

Hi Herbert,

Today's linux-next merge of the crypto tree got a conflict in:

  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi

between commit:

  fab6b48ccab3 ("ARM64: dts: amlogic: Add hiu and periphs buses")

from the amlogic tree and commit:

  e434cd2dc4de ("ARM64: dts: meson-gxbb: Add Hardware Random Generator node")

from the crypto tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 063e3b679207,83536219d9f6..000000000000
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@@ -214,104 -167,11 +214,109 @@@
  			};
  		};
  
 +		periphs: periphs@c8834000 {
 +			compatible = "simple-bus";
 +			reg = <0x0 0xc8834000 0x0 0x2000>;
 +			#address-cells = <2>;
 +			#size-cells = <2>;
 +			ranges = <0x0 0x0 0x0 0xc8834000 0x0 0x2000>;
 +
 +			pinctrl_periphs: pinctrl@4b0 {
 +				compatible = "amlogic,meson-gxbb-periphs-pinctrl";
 +				#address-cells = <2>;
 +				#size-cells = <2>;
 +				ranges;
 +
 +				gpio: bank@4b0 {
 +					reg = <0x0 0x004b0 0x0 0x28>,
 +					      <0x0 0x004e8 0x0 0x14>,
 +					      <0x0 0x00120 0x0 0x14>,
 +					      <0x0 0x00430 0x0 0x40>;
 +					reg-names = "mux", "pull", "pull-enable", "gpio";
 +					gpio-controller;
 +					#gpio-cells = <2>;
 +				};
 +
 +				emmc_pins: emmc {
 +					mux {
 +						groups = "emmc_nand_d07",
 +						       "emmc_cmd",
 +						       "emmc_clk";
 +						function = "emmc";
 +					};
 +				};
 +
 +				sdcard_pins: sdcard {
 +					mux {
 +						groups = "sdcard_d0",
 +						       "sdcard_d1",
 +						       "sdcard_d2",
 +						       "sdcard_d3",
 +						       "sdcard_cmd",
 +						       "sdcard_clk";
 +						function = "sdcard";
 +					};
 +				};
 +
 +				uart_a_pins: uart_a {
 +					mux {
 +						groups = "uart_tx_a",
 +						       "uart_rx_a";
 +						function = "uart_a";
 +					};
 +				};
 +
 +				uart_b_pins: uart_b {
 +					mux {
 +						groups = "uart_tx_b",
 +						       "uart_rx_b";
 +						function = "uart_b";
 +					};
 +				};
 +
 +				uart_c_pins: uart_c {
 +					mux {
 +						groups = "uart_tx_c",
 +						       "uart_rx_c";
 +						function = "uart_c";
 +					};
 +				};
 +
 +				eth_pins: eth_c {
 +					mux {
 +						groups = "eth_mdio",
 +						       "eth_mdc",
 +						       "eth_clk_rx_clk",
 +						       "eth_rx_dv",
 +						       "eth_rxd0",
 +						       "eth_rxd1",
 +						       "eth_rxd2",
 +						       "eth_rxd3",
 +						       "eth_rgmii_tx_clk",
 +						       "eth_tx_en",
 +						       "eth_txd0",
 +						       "eth_txd1",
 +						       "eth_txd2",
 +						       "eth_txd3";
 +						function = "eth";
 +					};
 +				};
 +			};
 +		};
 +
 +		hiubus: hiubus@c883c000 {
 +			compatible = "simple-bus";
 +			reg = <0x0 0xc883c000 0x0 0x2000>;
 +			#address-cells = <2>;
 +			#size-cells = <2>;
 +			ranges = <0x0 0x0 0x0 0xc883c000 0x0 0x2000>;
 +		};
 +
+ 		rng {
+ 			compatible = "amlogic,meson-rng";
+ 			reg = <0x0 0xc8834000 0x0 0x4>;
+ 		};
+ 
  		apb: apb@d0000000 {
  			compatible = "simple-bus";
  			reg = <0x0 0xd0000000 0x0 0x200000>;
