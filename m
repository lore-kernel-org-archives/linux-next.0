From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Tue, 12 Dec 2017 12:07:38 +1100
Message-ID: <20171212120738.48cc29d8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48973 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750759AbdLLBHl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 Dec 2017 20:07:41 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Heiner Kallweit <hkallweit1@gmail.com>

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/phy/meson-gxl.c

between commit:

  f1e2400a80ff ("net: phy: meson-gxl: detect LPA corruption")

from the net tree and commit:

  80274abafc60 ("net: phy: remove generic settings for callbacks config_aneg and read_status from drivers")

from the net-next tree.

I fixed it up (I just used the former) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/net/phy/meson-gxl.c
index 700007dd4be5,401e3234be58..000000000000
--- a/drivers/net/phy/meson-gxl.c
+++ b/drivers/net/phy/meson-gxl.c
@@@ -130,9 -58,7 +130,8 @@@ static struct phy_driver meson_gxl_phy[
  		.features	= PHY_BASIC_FEATURES,
  		.flags		= PHY_IS_INTERNAL,
  		.config_init	= meson_gxl_config_init,
- 		.config_aneg	= genphy_config_aneg,
  		.aneg_done      = genphy_aneg_done,
 +		.read_status	= meson_gxl_read_status,
  		.suspend        = genphy_suspend,
  		.resume         = genphy_resume,
  	},
