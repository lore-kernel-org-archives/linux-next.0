Return-Path: <SRS0=Ie+F=V7=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 607BAC433FF
	for <linux-next@archiver.kernel.org>; Sat,  3 Aug 2019 01:11:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2E0972054F
	for <linux-next@archiver.kernel.org>; Sat,  3 Aug 2019 01:11:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388144AbfHCBLe (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 2 Aug 2019 21:11:34 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:53034 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387926AbfHCBLe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Aug 2019 21:11:34 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 16D1612665355;
        Fri,  2 Aug 2019 18:11:33 -0700 (PDT)
Date:   Fri, 02 Aug 2019 18:11:32 -0700 (PDT)
Message-Id: <20190802.181132.1425585873361511856.davem@davemloft.net>
To:     natechancellor@gmail.com
Cc:     andrew@lunn.ch, broonie@kernel.org, devel@driverdev.osuosl.org,
        f.fainelli@gmail.com, gregkh@linuxfoundation.org,
        hkallweit1@gmail.com, kernel-build-reports@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org,
        netdev@vger.kernel.org, willy@infradead.org, lkp@intel.com,
        rdunlap@infradead.org
Subject: Re: [PATCH] net: mdio-octeon: Fix build error and Kconfig warning
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190731185023.20954-1-natechancellor@gmail.com>
References: <20190731.094150.851749535529247096.davem@davemloft.net>
        <20190731185023.20954-1-natechancellor@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Fri, 02 Aug 2019 18:11:33 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

From: Nathan Chancellor <natechancellor@gmail.com>
Date: Wed, 31 Jul 2019 11:50:24 -0700

> arm allyesconfig warns:
> 
> WARNING: unmet direct dependencies detected for MDIO_OCTEON
>   Depends on [n]: NETDEVICES [=y] && MDIO_DEVICE [=y] && MDIO_BUS [=y]
> && 64BIT && HAS_IOMEM [=y] && OF_MDIO [=y]
>   Selected by [y]:
>   - OCTEON_ETHERNET [=y] && STAGING [=y] && (CAVIUM_OCTEON_SOC &&
> NETDEVICES [=y] || COMPILE_TEST [=y])
> 
> and errors:
> 
> In file included from ../drivers/net/phy/mdio-octeon.c:14:
> ../drivers/net/phy/mdio-octeon.c: In function 'octeon_mdiobus_probe':
> ../drivers/net/phy/mdio-cavium.h:111:36: error: implicit declaration of
> function 'writeq'; did you mean 'writeb'?

The proper way to fix this is to include either

	linux/io-64-nonatomic-hi-lo.h

or

	linux/io-64-nonatomic-lo-hi.h

whichever is appropriate.
