From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: linux-next: build failure after merge of the rtc tree
Date: Wed, 31 May 2017 07:45:07 +0200
Message-ID: <56de728c-b7eb-8093-e39e-41cf9b743d16@gmail.com>
References: <20170531143349.561d5e77@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wr0-f179.google.com ([209.85.128.179]:33167 "EHLO
        mail-wr0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750970AbdEaFpX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 May 2017 01:45:23 -0400
In-Reply-To: <20170531143349.561d5e77@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Lowe <dave-lowe@ntlworld.com>

Am 31.05.2017 um 06:33 schrieb Stephen Rothwell:
> Hi Alexandre,
> 
> After merging the rtc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/rtc/rtc-ds1307.c: In function 'ds1307_probe':
> drivers/rtc/rtc-ds1307.c:1410:29: error: 'struct ds1307' has no member named 'client'
>    if (chip->alarm && (ds1307->client->irq > 0 ||
>                              ^
ds1307->client->irq would have to be replaced with ds1307->irq.
Same what the regmap patch does e.g. at line 1477.
The regmap patch removes member client from struct ds1307.

Rgds, Heiner

> 
> Caused by commit
> 
>   345b89453dda ("rtc: rtc-ds1307: enable support for mcp794xx as a wakeup source without IRQ")
> 
> interacting with commit
> 
>   11e5890b5342 ("rtc: ds1307: convert driver to regmap")
> 
> I have used the rtc tree from next-20170530 for today.
> 
