From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Wed, 28 Jun 2017 06:43:41 -0600
Message-ID: <664cc88d-18a5-18c4-5bce-4d4352d15f4f@kernel.dk>
References: <20170628180456.30cb9242@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f176.google.com ([209.85.192.176]:33295 "EHLO
        mail-pf0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751489AbdF1Mno (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Jun 2017 08:43:44 -0400
Received: by mail-pf0-f176.google.com with SMTP id e7so33029911pfk.0
        for <linux-next@vger.kernel.org>; Wed, 28 Jun 2017 05:43:43 -0700 (PDT)
In-Reply-To: <20170628180456.30cb9242@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>

On 06/28/2017 02:04 AM, Stephen Rothwell wrote:
> Hi Jens,
> 
> After merging the block tree, today's linux-next build (powerpc
> allnoconfig) failed like this:
> 
> fs/fcntl.o: In function `do_fcntl': 
> fcntl.c:(.text+0x6d4): undefined reference to `__get_user_bad'
> fcntl.c:(.text+0x730): undefined reference to `__get_user_bad'
> 
> Probably caused by commit
> 
>   c75b1d9421f8 ("fs: add fcntl() interface for setting/getting write life time hints")
> 
> On powerpc (at least) you cannot use get_user() to fetch anything larger
> than "unsigned long" i.e. 32 bits on 32 bit powerpc.
> 
> This has been discussed before (and, I think, a fix attempted).

Gah, thanks for letting me know. I'll test your patch and queue it
up to fix this issue.

-- 
Jens Axboe
