Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62EE4C2BBCA
	for <linux-next@archiver.kernel.org>; Tue, 15 Dec 2020 18:10:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B03F20578
	for <linux-next@archiver.kernel.org>; Tue, 15 Dec 2020 18:10:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730563AbgLOSKg (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 15 Dec 2020 13:10:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:41724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730696AbgLOSKf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Dec 2020 13:10:35 -0500
Date:   Tue, 15 Dec 2020 10:09:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608055795;
        bh=3HXUEkyLoQ9kUBeUPSh2juHmtsLehfa7AtKAN7InKi0=;
        h=From:To:Cc:Subject:In-Reply-To:References:From;
        b=k1jheIKOiHPNcmzmI01DCA87lNjsc1q5zLExqrBDJUUOd4p5tqjRUy2NBxCFceYuV
         7J/GrJo8L/wP+3Y2uliLDNZtCYyWsfS6CdR1/xWUDQl2j8GFj4DS3xCTplb/fncxRl
         2QbetHdqy2MkZreQJ1EN7uqYMYhMtz3JHN4Upwl8hEBSStAS0PkoSOYzcV7nKznhPK
         IY+tNfLV4xH62+Yat8ZnPb84xiSdWj9RWR84OFesRkltcgez8J9RPQb7EIBcmdEP02
         n8D9uvhErwqypCTlw3fT7tU2za1V8ara/D6a5lq4e1+hnui1D0NpNboxCpT21T7x4k
         uLbSUkJHC9Ccw==
From:   Jakub Kicinski <kuba@kernel.org>
To:     Ioana Ciornei <ciorneiioana@gmail.com>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, sfr@canb.auug.org.au,
        linux-next@vger.kernel.org, Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH] net: phy: fix kernel-doc for .config_intr()
Message-ID: <20201215100954.1022e87f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201215084240.lgg7tcq5tgbufqfr@skbuf>
References: <20201215083751.628794-1-ciorneiioana@gmail.com>
        <20201215084240.lgg7tcq5tgbufqfr@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 15 Dec 2020 10:42:40 +0200 Ioana Ciornei wrote:
> On Tue, Dec 15, 2020 at 10:37:51AM +0200, Ioana Ciornei wrote:
> > From: Ioana Ciornei <ioana.ciornei@nxp.com>
> > 
> > Fix the kernel-doc for .config_intr() so that we do not trigger a
> > warning like below.
> > 
> > include/linux/phy.h:869: warning: Function parameter or member 'config_intr' not described in 'phy_driver'
> > 
> > Fixes: 6527b938426f ("net: phy: remove the .did_interrupt() and .ack_interrupt() callback")
> > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>  
> 
> Sorry, I just realized that Jakub already sent a fix for this:
> 
> https://lore.kernel.org/netdev/20201215063750.3120976-1-kuba@kernel.org/

Bad timing :) Sorry for not CCing you
