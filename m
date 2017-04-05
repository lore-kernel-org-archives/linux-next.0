From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the crypto tree with the amlogic tree
Date: Wed, 5 Apr 2017 10:21:38 +1000
Message-ID: <20170405102138.3ac22175@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60005 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753859AbdDEAVm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 4 Apr 2017 20:21:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>

Hi Herbert,

Today's linux-next merge of the crypto tree got a conflict in:

  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi

between commit:

  6939db7e0dbf ("ARM64: dts: meson-gx: Add support for HDMI output")

from the amlogic tree and commit:

  1b3f6d148692 ("ARM64: dts: meson-gx: add clock CLKID_RNG0 to hwrng node")

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
index 4afe1c46ec11,a375cb21cc8b..000000000000
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@@ -621,14 -525,7 +621,19 @@@
  	compatible = "amlogic,meson-gxbb-vpu", "amlogic,meson-gx-vpu";
  };
  
 +&hdmi_tx {
 +	compatible = "amlogic,meson-gxbb-dw-hdmi", "amlogic,meson-gx-dw-hdmi";
 +	resets = <&reset RESET_HDMITX_CAPB3>,
 +		 <&reset RESET_HDMI_SYSTEM_RESET>,
 +		 <&reset RESET_HDMI_TX>;
 +	reset-names = "hdmitx_apb", "hdmitx", "hdmitx_phy";
 +	clocks = <&clkc CLKID_HDMI_PCLK>,
 +		 <&clkc CLKID_CLK81>,
 +		 <&clkc CLKID_GCLK_VENCI_INT0>;
 +	clock-names = "isfr", "iahb", "venci";
 +};
++
+ &hwrng {
+ 	clocks = <&clkc CLKID_RNG0>;
+ 	clock-names = "core";
+ };
