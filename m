From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the devicetree tree with the sound tree
Date: Wed, 6 Sep 2017 12:58:50 +1000
Message-ID: <20170906125850.1498cfad@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59709 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753550AbdIFC6w (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 5 Sep 2017 22:58:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>, Takashi Iwai <tiwai@suse.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sugar Zhang <sugar.zhang@rock-chips.com>, Mark Brown <broonie@kernel.org>

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/sound/rockchip,pdm.txt

between commit:

  fce7358b54c6 ("ASoC: rockchip: separate pinctrl pins from each other")

from the sound tree and commit:

  4da722ca19f3 ("dt-bindings: Remove "status" from examples")

from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/sound/rockchip,pdm.txt
index 2ad66f649a28,beb32ca26e5d..000000000000
--- a/Documentation/devicetree/bindings/sound/rockchip,pdm.txt
+++ b/Documentation/devicetree/bindings/sound/rockchip,pdm.txt
@@@ -33,10 -34,5 +33,9 @@@ pdm: pdm@ff040000 
  		     &pdmm0_sdi1
  		     &pdmm0_sdi2
  		     &pdmm0_sdi3>;
 -	pinctrl-1 = <&pdmm0_sleep>;
 +	pinctrl-1 = <&pdmm0_clk_sleep
 +		     &pdmm0_sdi0_sleep
 +		     &pdmm0_sdi1_sleep
 +		     &pdmm0_sdi2_sleep
 +		     &pdmm0_sdi3_sleep>;
- 	status = "disabled";
  };
