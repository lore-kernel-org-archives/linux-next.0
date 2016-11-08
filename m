From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Mon, 7 Nov 2016 20:28:08 -0700
Message-ID: <17000722-fd27-9f88-e44b-999f11545b17@kernel.dk>
References: <20161108142140.3232b3b2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f169.google.com ([209.85.192.169]:35772 "EHLO
        mail-pf0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752401AbcKHDfA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Nov 2016 22:35:00 -0500
Received: by mail-pf0-f169.google.com with SMTP id i88so99635064pfk.2
        for <linux-next@vger.kernel.org>; Mon, 07 Nov 2016 19:35:00 -0800 (PST)
In-Reply-To: <20161108142140.3232b3b2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ming Lei <tom.leiming@gmail.com>, Christoph Hellwig <hch@lst.de>

On 11/07/2016 08:21 PM, Stephen Rothwell wrote:
> Hi Jens,
>
> After merging the block tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> block/blk-flush.c: In function 'flush_data_end_io':
> block/blk-flush.c:369:20: error: 'REQ_STARTED' undeclared (first use in this function)
>   rq->cmd_flags &= ~REQ_STARTED;
>                     ^
>
> Caused by commit
>
>   e806402130c9 ("block: split out request-only flags into a new namespace")
>
> interacting with commit
>
>   94d7dea448fa ("block: flush: fix IO hang in case of flood fua req")
>
> from Linus' tree (v4.9-rc3).
>
> I have applied the following merge fix patch for today (I don't know if
> this is correct, but it does build):

It's correct, it needs to be applied if merging with master. It will
throw a real conflict as well, but this one tends to fly under the radar
since it merges cleanly.

I'll merge master into my for-next so you don't have to carry extra
patches for this.

-- 
Jens Axboe
