From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Tue, 19 Dec 2017 11:51:07 +1100
Message-ID: <20171219115107.1897bf7a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38859 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933765AbdLSAvK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Dec 2017 19:51:10 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Zhao Qiang <qiang.zhao@nxp.com>, Heiner Kallweit <hkallweit1@gmail.com>

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/phy/marvell.c

between commit:

  c505873eaece ("net: phy: marvell: Limit 88m1101 autoneg errata to 88E1145 as well.")

from the net tree and commit:

  80274abafc60 ("net: phy: remove generic settings for callbacks config_aneg and read_status from drivers")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/net/phy/marvell.c
index 82104edca393,2fc026dc170a..000000000000
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@@ -2085,8 -2070,7 +2082,7 @@@ static struct phy_driver marvell_driver
  		.flags = PHY_HAS_INTERRUPT,
  		.probe = marvell_probe,
  		.config_init = &m88e1145_config_init,
 -		.config_aneg = &marvell_config_aneg,
 +		.config_aneg = &m88e1101_config_aneg,
- 		.read_status = &genphy_read_status,
  		.ack_interrupt = &marvell_ack_interrupt,
  		.config_intr = &marvell_config_intr,
  		.resume = &genphy_resume,
