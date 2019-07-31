Return-Path: <SRS0=W9k0=V4=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594D5C32751
	for <linux-next@archiver.kernel.org>; Wed, 31 Jul 2019 16:41:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 354A7206A2
	for <linux-next@archiver.kernel.org>; Wed, 31 Jul 2019 16:41:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729300AbfGaQly (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 31 Jul 2019 12:41:54 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:40244 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729199AbfGaQly (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 Jul 2019 12:41:54 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 4264A14470BAF;
        Wed, 31 Jul 2019 09:41:53 -0700 (PDT)
Date:   Wed, 31 Jul 2019 09:41:50 -0700 (PDT)
Message-Id: <20190731.094150.851749535529247096.davem@davemloft.net>
To:     natechancellor@gmail.com
Cc:     gregkh@linuxfoundation.org, devel@driverdev.osuosl.org,
        andrew@lunn.ch, f.fainelli@gmail.com,
        kernel-build-reports@lists.linaro.org, netdev@vger.kernel.org,
        willy@infradead.org, broonie@kernel.org,
        linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        hkallweit1@gmail.com
Subject: Re: next/master build: 221 builds: 11 failed, 210 passed, 13
 errors, 1174 warnings (next-20190731)
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190731163509.GA90028@archlinux-threadripper>
References: <20190731.084824.2244928058443049.davem@davemloft.net>
        <20190731160043.GA15520@kroah.com>
        <20190731163509.GA90028@archlinux-threadripper>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 31 Jul 2019 09:41:53 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

From: Nathan Chancellor <natechancellor@gmail.com>
Date: Wed, 31 Jul 2019 09:35:09 -0700

> In file included from ../drivers/net/phy/mdio-octeon.c:14:
> ../drivers/net/phy/mdio-cavium.h:111:36: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
>   111 | #define oct_mdio_writeq(val, addr) writeq(val, (void *)addr)

One of the hi-lo, lo-hi writeq/readq headers has to be included.
