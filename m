Return-Path: <SRS0=hAv5=VW=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A154C7618B
	for <linux-next@archiver.kernel.org>; Thu, 25 Jul 2019 12:23:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 53D75229F9
	for <linux-next@archiver.kernel.org>; Thu, 25 Jul 2019 12:23:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728910AbfGYMXu convert rfc822-to-8bit (ORCPT
        <rfc822;linux-next@archiver.kernel.org>);
        Thu, 25 Jul 2019 08:23:50 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:54505 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727816AbfGYMXu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Jul 2019 08:23:50 -0400
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id CFECCC000F;
        Thu, 25 Jul 2019 12:23:46 +0000 (UTC)
Date:   Thu, 25 Jul 2019 14:23:44 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christophe Kerello <christophe.kerello@st.com>
Subject: Re: linux-next: Fixes tag needs some work in the nand tree
Message-ID: <20190725142344.73e9d1b6@xps13>
In-Reply-To: <20190725210724.66cb82a6@canb.auug.org.au>
References: <20190725210724.66cb82a6@canb.auug.org.au>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Stephen Rothwell <sfr@canb.auug.org.au> wrote on Thu, 25 Jul 2019
21:07:24 +1000:

> Hi all,
> 
> In commit
> 
>   0ade3f0f5877 ("mtd: rawnand: stm32_fmc2: avoid warnings when building with W=1 option")
> 
> Fixes tag
> 
>   Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash
> 
> has these problem(s):
> 
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
> 
> Please do not split Fixes tags over more than one line.
> 

Sorry, I didn't spot the mistake. Corrected and pushed -f.


Thanks,
Miquèl
