From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: Re: linux-next: build warning after merge of the l2-mtd tree
Date: Fri, 23 Jun 2017 06:56:53 +0200
Message-ID: <c9987333f5d8485043e42c17947c59de@milecki.pl>
References: <20170623113206.29042011@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 6.mo69.mail-out.ovh.net ([46.105.50.107]:42744 "EHLO
        6.mo69.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754089AbdFWFeS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Jun 2017 01:34:18 -0400
Received: from player738.ha.ovh.net (b6.ovh.net [213.186.33.56])
        by mo69.mail-out.ovh.net (Postfix) with ESMTP id 016AB2C020
        for <linux-next@vger.kernel.org>; Fri, 23 Jun 2017 06:56:57 +0200 (CEST)
In-Reply-To: <20170623113206.29042011@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Brian Norris <computersforpeace@gmail.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 2017-06-23 03:32, Stephen Rothwell wrote:
> After merging the l2-mtd tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:

This code has been just moved, so the warning was already there before.

But it's of course a good opportunity to fix it :)
