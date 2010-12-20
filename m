From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build warning after merge of the block tree
Date: Mon, 20 Dec 2010 09:12:01 +0100
Message-ID: <4D0F0FD1.2080407@kernel.dk>
References: <20101220153127.ad8213b2.sfr@canb.auug.org.au> <20101220154259.9a84819e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 0122700014.0.fullrate.dk ([95.166.99.235]:57903 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753913Ab0LTIM1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Dec 2010 03:12:27 -0500
In-Reply-To: <20101220154259.9a84819e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>

On 2010-12-20 05:42, Stephen Rothwell wrote:
> Hi Jens,
> 
> On Mon, 20 Dec 2010 15:31:27 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the block tree, today's linux-next build (powerpc
>> ppc64_defconfig) produced this warning:
>>
>> drivers/block/loop.c: In function 'lo_splice_actor':
>> drivers/block/loop.c:398: warning: unused variable 'ret'
>>
>> Introduced by commit a8adbe378b56acd5945df70753c7e8f6fe223304
>> ("fs/splice: Pull buf->ops->confirm() from splice_from_pipe actors").
> 
> Also:
> 
> fs/nfsd/vfs.c: In function 'nfsd_splice_actor':
> fs/nfsd/vfs.c:848: warning: unused variable 'ret'

Hrmpf, that's not very nice. I'll add a fixup patch, thanks Stephen.

-- 
Jens Axboe
