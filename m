From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Mon, 19 Sep 2016 08:22:32 -0600
Message-ID: <1e8697fe-a8e5-a5b6-25db-c4676d36efdf@kernel.dk>
References: <20160919161834.08302d33@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-it0-f50.google.com ([209.85.214.50]:35368 "EHLO
        mail-it0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755445AbcISOWe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Sep 2016 10:22:34 -0400
Received: by mail-it0-f50.google.com with SMTP id r192so69751937ita.0
        for <linux-next@vger.kernel.org>; Mon, 19 Sep 2016 07:22:34 -0700 (PDT)
In-Reply-To: <20160919161834.08302d33@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

On 09/19/2016 12:18 AM, Stephen Rothwell wrote:
> Hi Jens,
>
> After merging the block tree, today's linux-next build (powerpc
> allnoconfig) failed like this:
>
> In file included from block/blk-mq-pci.c:13:0:
> include/linux/blk-mq.h:57:18: error: field 'kobj' has incomplete type
>   struct kobject  kobj;
>                   ^
> include/linux/blk-mq.h:121:2: error: unknown type name 'softirq_done_fn'
>   softirq_done_fn  *complete;
>   ^
> include/linux/blk-mq.h: In function 'blk_mq_rq_from_pdu':
> include/linux/blk-mq.h:253:22: error: invalid application of 'sizeof' to incomplete type 'struct request'
>   return pdu - sizeof(struct request);
>                       ^
> include/linux/blk-mq.h: In function 'blk_mq_rq_to_pdu':
> include/linux/blk-mq.h:257:2: error: invalid use of undefined type 'struct request'
>   return rq + 1;
>   ^
>
> Caused by commit
>
>   973c4e372c8f ("blk-mq: provide a default queue mapping for PCI device")
>
> include/linux/blk-mq.h does not include all the headers files that it
> depends on, and building block/blk-mq-pci.c should depend on CONFIG_BLOCK.
>
> I applied this fix patch (the block/blk-mq-pci.c may not be becessary):

Added, thanks Stephen.

-- 
Jens Axboe
