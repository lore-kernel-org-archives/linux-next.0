Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1308C4167B
	for <linux-next@archiver.kernel.org>; Thu,  3 Dec 2020 20:44:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AB78221F4
	for <linux-next@archiver.kernel.org>; Thu,  3 Dec 2020 20:44:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728815AbgLCUoR (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 3 Dec 2020 15:44:17 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:60261 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgLCUoQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Dec 2020 15:44:16 -0500
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 2F532240003;
        Thu,  3 Dec 2020 20:43:32 +0000 (UTC)
Date:   Thu, 3 Dec 2020 21:43:32 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Nicolas Ferre <nicolas.ferre@atmel.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the at91 tree
Message-ID: <20201203204332.GA74177@piout.net>
References: <20201204072332.07154d06@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204072332.07154d06@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 04/12/2020 07:23:32+1100, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   d45879c1307f ("ARM: dts: at91: sam9x60ek: remove bypass property")
> 
> Fixes tag
> 
>   Fixes: 720329e86a463 ("ARM: dts: at91: sam9x60: add device tree for soc and board")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant:
> 
> Fixes: 1e5f532c2737 ("ARM: dts: at91: sam9x60: add device tree for soc and board")
> 

This is correct and checkpatch didn't complain because I actually have
that commit in my tree. This is unfortunate but I'll fix that. Thank you
for the information.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
