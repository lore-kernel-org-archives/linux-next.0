Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A2CC4338F
	for <linux-next@archiver.kernel.org>; Wed, 18 Aug 2021 18:16:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65A22610A6
	for <linux-next@archiver.kernel.org>; Wed, 18 Aug 2021 18:16:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhHRSRQ (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 18 Aug 2021 14:17:16 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:60414 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbhHRSRQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Aug 2021 14:17:16 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 7247120A6DEA
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: linux-next: Fixes tag needs some work in the i2c tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Wolfram Sang <wsa@the-dreams.de>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>
References: <20210818075250.08a593f1@canb.auug.org.au>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <23d4fdb5-4a20-8d44-b98e-8b334bd2cdae@omp.ru>
Date:   Wed, 18 Aug 2021 21:16:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210818075250.08a593f1@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/18/21 12:52 AM, Stephen Rothwell wrote:

> In commit
> 
>   eef7fa1001c0 ("i2c: iop3xx: fix deferred probing")
> 
> Fixes tag
> 
>   Fixes: 489447380a29 ("handle errors returned by platform_get_irq*()")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'
> 
> So:
> 
> Fixes: 489447380a29 ("[PATCH] handle errors returned by platform_get_irq*()")

   In this case I was innocent, I guess something ate [PATCH] on Wolfram's side. :-)

MBR, Sergei
