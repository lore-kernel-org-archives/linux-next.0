From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Wed, 30 Nov 2016 20:00:36 -0700
Message-ID: <be0dd730-037a-2f42-489a-2a1fc90c8932@kernel.dk>
References: <20161201135517.273c9a4d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f171.google.com ([209.85.192.171]:33101 "EHLO
        mail-pf0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752576AbcLADAk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Nov 2016 22:00:40 -0500
Received: by mail-pf0-f171.google.com with SMTP id d2so42928885pfd.0
        for <linux-next@vger.kernel.org>; Wed, 30 Nov 2016 19:00:40 -0800 (PST)
In-Reply-To: <20161201135517.273c9a4d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Chinner <david@fromorbit.com>, xfs@oss.sgi.com
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

On 11/30/2016 07:55 PM, Stephen Rothwell wrote:
> Hi Jens,
> 
> After merging the block tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> fs/iomap.c: In function 'iomap_dio_zero':
> fs/iomap.c:725:38: error: 'WRITE_ODIRECT' undeclared (first use in this function)
>   bio_set_op_attrs(bio, REQ_OP_WRITE, WRITE_ODIRECT);
>                                       ^
> fs/iomap.c:725:38: note: each undeclared identifier is reported only once for each function it appears in
> fs/iomap.c: In function 'iomap_dio_actor':
> fs/iomap.c:808:40: error: 'WRITE_ODIRECT' undeclared (first use in this function)
>     bio_set_op_attrs(bio, REQ_OP_WRITE, WRITE_ODIRECT);
>                                         ^
> fs/iomap.c: In function 'iomap_dio_rw':
> fs/iomap.c:933:9: error: implicit declaration of function 'blk_poll' [-Werror=implicit-function-declaration]
>         !blk_poll(dio->submit.last_queue,
>          ^
> 
> Caused by commits
> 
>   70fd76140a6c ("block,fs: use REQ_* flags directly")
>   bbd7bb7017d5 ("block: move poll code to blk-mq")
> 
> interacting with commit
> 
>   ff6a9292e6f6 ("iomap: implement direct I/O")
> 
> from the xfs tree.
> 
> I love APIs changing :-(

It's a necessary evil...

This could have been avoided with the XFS tree pulling in the block
changes, but that obviously has other implications. Something to watch
for when the XFS tree is sent in for the merge window, however.

> I have applied the following merge fix patch for today.

The fix is correct.

-- 
Jens Axboe
