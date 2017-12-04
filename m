From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the net-next tree
Date: Mon, 4 Dec 2017 11:02:49 +1100
Message-ID: <20171204110249.0d21a17d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57527 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752488AbdLDACv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 3 Dec 2017 19:02:51 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>

Hi all,

After merging the net-next tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/net/phy/broadcom.c:391:12: warning: 'bcm5482_read_status' defined but not used [-Wunused-function]
 static int bcm5482_read_status(struct phy_device *phydev)
            ^
drivers/net/phy/broadcom.c:411:12: warning: 'bcm5481_config_aneg' defined but not used [-Wunused-function]
 static int bcm5481_config_aneg(struct phy_device *phydev)
            ^

Introduced by commit

  80274abafc60 ("net: phy: remove generic settings for callbacks config_aneg and read_status from drivers")

-- 
Cheers,
Stephen Rothwell
