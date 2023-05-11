Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F773C77B7C
	for <linux-next@archiver.kernel.org>; Thu, 11 May 2023 07:31:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjEKHbS (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 11 May 2023 03:31:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232059AbjEKHbR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 May 2023 03:31:17 -0400
X-Greylist: delayed 2348 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 11 May 2023 00:31:16 PDT
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A26BD1992;
        Thu, 11 May 2023 00:31:16 -0700 (PDT)
Received: from pd9e2f461.dip0.t-ipconnect.de ([217.226.244.97] helo=aktux)
        by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <andreas@kemnade.info>)
        id 1px09T-0001Jt-3e; Thu, 11 May 2023 08:51:47 +0200
Date:   Thu, 11 May 2023 08:51:44 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Lee Jones <lee@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the leds-lj tree
Message-ID: <20230511085144.054125a0@aktux>
In-Reply-To: <20230511090443.359b120b@canb.auug.org.au>
References: <20230511090443.359b120b@canb.auug.org.au>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 11 May 2023 09:04:43 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> The following commit is also in Linus Torvalds' tree as a `different
> commit (but the same patch):
> 
>   fea27b037127 ("leds: bd2606mvv: Driver for the Rohm 6 Channel i2c LED driver")
> 
> This is commit
> 
>   8325642d2757 ("leds: bd2606mvv: Driver for the Rohm 6 Channel i2c LED driver")
> 
BTW: and also:

3808b8424b476 ("leds: bd2606mvv: Driver for the Rohm 6 Channel i2c LED driver")

it went in probably by accident through both led and mfd pull requests for 6.4.

Regards,
Andreas
