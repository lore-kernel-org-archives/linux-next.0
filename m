From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: drbd tree build failure
Date: Tue, 15 Sep 2009 08:23:06 +0200
Message-ID: <20090915062306.GP14984@kernel.dk>
References: <20090915160739.86e85ab3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([93.163.65.50]:47894 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757260AbZIOGXD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Sep 2009 02:23:03 -0400
Content-Disposition: inline
In-Reply-To: <20090915160739.86e85ab3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@linbit.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nikanth Karthikesan <knikanth@suse.de>

On Tue, Sep 15 2009, Stephen Rothwell wrote:
> Hi Philipp,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/block/drbd/drbd_req.c: In function '_drbd_start_io_acct':
> drivers/block/drbd/drbd_req.c:45: error: lvalue required as increment operand
> drivers/block/drbd/drbd_req.c: In function '_drbd_end_io_acct':
> drivers/block/drbd/drbd_req.c:58: error: lvalue required as decrement operand
> 
> Caused by commit 954749162c98ca45c42cbc00c9ed6d5d6c0b8bb7 ("DRBD:
> request") from the drbd tree interacting with commit
> a9327cac440be4d8333bba975cbbf76045096275 ("Seperate read and write
> statistics of in_flight requests") from the block tree.
> 
> I have applied the following merge fix for today, but there may be a
> better fix.

Fix looks correct.

-- 
Jens Axboe
