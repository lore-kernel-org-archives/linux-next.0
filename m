From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the rockchip tree
Date: Mon, 9 Jan 2017 13:55:21 +1100
Message-ID: <20170109135521.4bd995f5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48505 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S969188AbdAICzX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 8 Jan 2017 21:55:23 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  Documentation/devicetree/bindings/soc/rockchip/grf.txt

between commit:

  2c257ce6ab6f ("dt-bindings: add used but undocumented rockchip grf compatible values")

from the rockchip tree and patch:

   "scripts/spelling.txt: add "followings" pattern and fix typo instances"

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/soc/rockchip/grf.txt
index c6e62cb30712,76d6ccf677f5..000000000000
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.txt
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.txt
@@@ -10,19 -9,16 +10,19 @@@ From RK3368 SoCs, the GRF is divided in
  
  Required Properties:
  
- - compatible: GRF should be one of the followings
+ - compatible: GRF should be one of the following:
 +   - "rockchip,rk3036-grf", "syscon": for rk3036
     - "rockchip,rk3066-grf", "syscon": for rk3066
     - "rockchip,rk3188-grf", "syscon": for rk3188
     - "rockchip,rk3228-grf", "syscon": for rk3228
     - "rockchip,rk3288-grf", "syscon": for rk3288
     - "rockchip,rk3368-grf", "syscon": for rk3368
     - "rockchip,rk3399-grf", "syscon": for rk3399
- - compatible: PMUGRF should be one of the followings
+ - compatible: PMUGRF should be one of the following:
     - "rockchip,rk3368-pmugrf", "syscon": for rk3368
     - "rockchip,rk3399-pmugrf", "syscon": for rk3399
 +- compatible: SGRF should be one of the following
 +   - "rockchip,rk3288-sgrf", "syscon": for rk3288
  - reg: physical base address of the controller and length of memory mapped
    region.
  
