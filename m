From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: block tree build failure
Date: Fri, 27 Jun 2008 09:14:30 +0200
Message-ID: <20080627071430.GL20851@kernel.dk>
References: <20080627165326.9222c841.sfr@canb.auug.org.au> <20080627070031.GK20851@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([87.55.233.238]:21908 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751780AbYF0HOc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Jun 2008 03:14:32 -0400
Content-Disposition: inline
In-Reply-To: <20080627070031.GK20851@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>

On Fri, Jun 27 2008, Jens Axboe wrote:
> On Fri, Jun 27 2008, Stephen Rothwell wrote:
> > Hi Jens,
> > 
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > 
> > block/cmd-filter.c: In function 'rcf_set_defaults':
> > block/cmd-filter.c:245: error: 'MAINTENANCE_IN_CMD' undeclared (first use in this function)
> > 
> > Caused by commit e072328e626899abc7179842c0e3f4de68e368c9 ("cmdfilter:
> > extend default read filter") which I have reverted.

Fixed now, shame on Adel for not even compiling a patch he sends for
submission and shame on me for not double checking.

> > We also got lots of:
> > 
> > include/linux/blkdev.h:942: warning: passing argument 2 of 'constant_test_bit' from incompatible pointer type
> > 
> > from the x86_64 allmodconfig build because the flags element of struct
> > blk_integrity is an unsigned short and the bitop routines take a pointer
> > to an unsigned long.
> > 
> > I have reverted commit 1b769a557d6ed0d348656ddad4450525a1b6fdcb ("block:
> > Block layer data integrity support") (and the three that depended on that
> > one: 99b454690844b97c1e550c1609ba7397d506f924 ("block: Data integrity
> > infrastructure documentation"), cacd33a92c8f98041188ea99bdcc12f37ea8fcef
> > ("block: integrity checkpatch cleanups") and
> > 40ea047969676270e47d515468d7f849a9b37fec ("block: integrity cleanups"). 
> 
> I'll fix up these immediately! The flags clearly need to be unsigned
> long, don't know how that got by.

Fixed that by getting rid of the *_bit() operations, there's no need for
atomic bitops.

So everything should be OK now, sorry for the trouble.

-- 
Jens Axboe
