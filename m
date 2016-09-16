From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Thu, 15 Sep 2016 22:13:36 -0600
Message-ID: <4c065ee5-865f-d0d5-103b-7c5a1749ad9f@kernel.dk>
References: <20160916111434.43bcf04e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f176.google.com ([209.85.192.176]:35415 "EHLO
        mail-pf0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750730AbcIPENl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Sep 2016 00:13:41 -0400
Received: by mail-pf0-f176.google.com with SMTP id z123so23280465pfz.2
        for <linux-next@vger.kernel.org>; Thu, 15 Sep 2016 21:13:40 -0700 (PDT)
In-Reply-To: <20160916111434.43bcf04e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Josef Bacik <jbacik@fb.com>

On 09/15/2016 07:14 PM, Stephen Rothwell wrote:
> Hi Jens,
>
> After merging the block tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> drivers/block/nbd.c:884:2: error: unknown field 'map_queue' specified in initializer
>   .map_queue = blk_mq_map_queue,
>   ^
> /home/sfr/next/next/drivers/block/nbd.c:884:15: error: 'blk_mq_map_queue' undeclared here (not in a function)
>   .map_queue = blk_mq_map_queue,
>                ^
>
> Caused by commit
>
>   9151bcb4fb38 ("blk-mq: kill unused blk_mq_create_mq_map()")
>
> interacting with commit
>
>   fd8383fd88a2 ("nbd: convert to blkmq")
>
> also in the block tree.

That's my fault, when merged together the nbd part needs an update. I've
pushed out a fix for it.

-- 
Jens Axboe
