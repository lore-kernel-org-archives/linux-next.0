Return-Path: <SRS0=e2RY=UN=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D230C31E44
	for <linux-next@archiver.kernel.org>; Fri, 14 Jun 2019 05:44:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 788FB21473
	for <linux-next@archiver.kernel.org>; Fri, 14 Jun 2019 05:44:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725891AbfFNFoP (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 14 Jun 2019 01:44:15 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:37324 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbfFNFoP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 Jun 2019 01:44:15 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 227E114DD4FC6;
        Thu, 13 Jun 2019 22:44:14 -0700 (PDT)
Date:   Thu, 13 Jun 2019 22:44:13 -0700 (PDT)
Message-Id: <20190613.224413.938595981926047101.davem@davemloft.net>
To:     olteanv@gmail.com
Cc:     f.fainelli@gmail.com, vivien.didelot@gmail.com, andrew@lunn.ch,
        rdunlap@infradead.org, sfr@canb.auug.org.au,
        netdev@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: [PATCH net-next] net: dsa: tag_sja1105: Select CONFIG_PACKING
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190611184745.6104-1-olteanv@gmail.com>
References: <20190611184745.6104-1-olteanv@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Thu, 13 Jun 2019 22:44:14 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

From: Vladimir Oltean <olteanv@gmail.com>
Date: Tue, 11 Jun 2019 21:47:45 +0300

> The packing facility is needed to decode Ethernet meta frames containing
> source port and RX timestamping information.
> 
> The DSA driver selects CONFIG_PACKING, but the tagger did not, and since
> taggers can be now compiled as modules independently from the drivers
> themselves, this is an issue now, as CONFIG_PACKING is disabled by
> default on all architectures.
> 
> Fixes: e53e18a6fe4d ("net: dsa: sja1105: Receive and decode meta frames")
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>

Applied.
