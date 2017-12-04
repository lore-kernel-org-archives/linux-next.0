From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build warning after merge of the net-next tree
Date: Mon, 04 Dec 2017 13:21:29 -0500 (EST)
Message-ID: <20171204.132129.2201796826162314849.davem@davemloft.net>
References: <20171204110249.0d21a17d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:51248 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751208AbdLDSVa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Dec 2017 13:21:30 -0500
In-Reply-To: <20171204110249.0d21a17d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, hkallweit1@gmail.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 4 Dec 2017 11:02:49 +1100

> After merging the net-next tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> drivers/net/phy/broadcom.c:391:12: warning: 'bcm5482_read_status' defined but not used [-Wunused-function]
>  static int bcm5482_read_status(struct phy_device *phydev)
>             ^
> drivers/net/phy/broadcom.c:411:12: warning: 'bcm5481_config_aneg' defined but not used [-Wunused-function]
>  static int bcm5481_config_aneg(struct phy_device *phydev)
>             ^
> 
> Introduced by commit
> 
>   80274abafc60 ("net: phy: remove generic settings for callbacks config_aneg and read_status from drivers")

This shoudl be resolved now, thanks for the report.
