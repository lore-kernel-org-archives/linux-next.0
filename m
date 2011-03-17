From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Thu, 17 Mar 2011 11:18:56 +0100
Message-ID: <4D81E010.1090808@kernel.dk>
References: <20110314161919.15e6d983.sfr@canb.auug.org.au> <20110317103218.ca7f63bf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 0122700014.0.fullrate.dk ([95.166.99.235]:45915 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751689Ab1CQKS6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Mar 2011 06:18:58 -0400
In-Reply-To: <20110317103218.ca7f63bf.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jarkko Lavinen <jarkko.lavinen@nokia.com>, David Woodhouse <David.Woodhouse@intel.com>

On 2011-03-17 00:32, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 14 Mar 2011 16:19:19 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the block tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> drivers/mtd/mtd_blkdevs.c: In function 'mtd_blktrans_cease_background':
>> drivers/mtd/mtd_blkdevs.c:127: error: implicit declaration of function 'elv_queue_empty'
>>
>> Caused by commit 7eaceaccab5f ("block: remove per-queue plugging")
>> interacting with commit c7519dbf6f4b ("mtd_blkdevs: Add background
>> processing support") from the mtd tree.
>>
>> I have no idea how to fix this up, so I have reverted the above commit
>> from them mtd tree (along with commits a32159024620 "mtd: Add mtdswap
>> block driver" and 89d8d32060de "mtd: fix printf format warnings, mostly
>> lack of %zd for size_t, in mtdswap" that depend on it).
>>
>> Jens, maybe you could advise the mtd guys.
> 
> Ping?

Can you point me at the commit in question? Generally, elv_queue_empty()
can be replaced by blk_peek_request().

-- 
Jens Axboe
