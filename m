From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the crypto tree with the arm-soc tree
Date: Thu, 20 Apr 2017 11:23:35 +1000
Message-ID: <20170420112335.0b8449bc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51831 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752029AbdDTBXi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 19 Apr 2017 21:23:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Amelie Delaunay <amelie.delaunay@st.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Fabien DESSENNE <fabien.dessenne@st.com>

Hi all,

Today's linux-next merge of the crypto tree got a conflict in:

  arch/arm/boot/dts/stm32746g-eval.dts

between commit:

  4cc627472cd6 ("ARM: dts: stm32: enable RTC on stm32746g-eval")

from the arm-soc tree and commit:

  2e3db2931875 ("ARM: dts: stm32: enable CRC on stm32746g-eval board")

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

diff --cc arch/arm/boot/dts/stm32746g-eval.dts
index b5207588bdcb,0dc18a0f0940..000000000000
--- a/arch/arm/boot/dts/stm32746g-eval.dts
+++ b/arch/arm/boot/dts/stm32746g-eval.dts
@@@ -89,10 -89,10 +89,14 @@@
  	clock-frequency = <25000000>;
  };
  
+ &crc {
+ 	status = "okay";
+ };
+ 
 +&rtc {
 +	status = "okay";
 +};
 +
  &usart1 {
  	pinctrl-0 = <&usart1_pins_a>;
  	pinctrl-names = "default";
