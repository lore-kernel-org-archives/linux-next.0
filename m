From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
Date: Thu, 22 Jun 2017 21:09:22 -0600
Message-ID: <f94e6ae4-e4d9-61fb-9e69-7b2ef08a38aa@kernel.dk>
References: <20170623130632.03bc60af@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f175.google.com ([209.85.192.175]:36128 "EHLO
        mail-pf0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754060AbdFWDJ0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Jun 2017 23:09:26 -0400
Received: by mail-pf0-f175.google.com with SMTP id q86so17569702pfl.3
        for <linux-next@vger.kernel.org>; Thu, 22 Jun 2017 20:09:25 -0700 (PDT)
In-Reply-To: <20170623130632.03bc60af@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>

On 06/22/2017 09:06 PM, Stephen Rothwell wrote:
> Hi Jens,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   block/blk-mq-sched.c
> 
> between commit:
> 
>   8e8320c9315c ("blk-mq: fix performance regression with shared tags")
> 
> from Linus' tree and commits:
> 
>   d2c0d3832469 ("blk-mq: move blk_mq_sched_{get,put}_request to blk-mq.c")
>   44e8c2bff80b ("blk-mq: refactor blk_mq_sched_assign_ioc")
> 
> from the block tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

I'll cherry pick that commit into the 4.13 branch to get this resolved.

-- 
Jens Axboe
