From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: linux-next: build warning after merge of the net-next tree
Date: Mon, 4 Dec 2017 07:33:39 +0100
Message-ID: <c9ab011c-960b-b371-094b-ceb698cc17b0@gmail.com>
References: <20171204110249.0d21a17d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wr0-f172.google.com ([209.85.128.172]:43568 "EHLO
        mail-wr0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751407AbdLDGdu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Dec 2017 01:33:50 -0500
In-Reply-To: <20171204110249.0d21a17d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Am 04.12.2017 um 01:02 schrieb Stephen Rothwell:
> Hi all,
> 
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
> 
This issue has been addressed addressed already, see this patch:
https://marc.info/?l=linux-netdev&m=151220825402398&w=2

Rgds, Heiner
