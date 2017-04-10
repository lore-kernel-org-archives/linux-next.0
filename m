From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the clockevents tree with the arm-soc
 tree
Date: Mon, 10 Apr 2017 13:18:51 +1000
Message-ID: <20170410131851.556bc24f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57093 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751209AbdDJDSy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 9 Apr 2017 23:18:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>, Alexander Kochetkov <al.kochet@gmail.com>

Hi Daniel,

Today's linux-next merge of the clockevents tree got a conflict in:

  arch/arm/boot/dts/rk3188.dtsi

between commit:

  2e1aa605fadd ("ARM: dts: rockchip: fix PPI misconfiguration on Cortex-A9 socs")

from the arm-soc tree and commit:

  500d0aa918a2 ("ARM: dts: rockchip: disable arm-global-timer for rk3188")

from the clockevents tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm/boot/dts/rk3188.dtsi
index fa1bdb8875ae,1aff4ad22fc4..000000000000
--- a/arch/arm/boot/dts/rk3188.dtsi
+++ b/arch/arm/boot/dts/rk3188.dtsi
@@@ -529,7 -545,8 +545,8 @@@
  };
  
  &global_timer {
 -	interrupts = <GIC_PPI 11 0xf04>;
 +	interrupts = <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_EDGE_RISING)>;
+ 	status = "disabled";
  };
  
  &local_timer {
