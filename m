From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: block tree build failure
Date: Mon, 10 Nov 2008 13:12:56 +0100
Message-ID: <20081110121256.GD26778@kernel.dk>
References: <20081110145442.d60e57b7.sfr@canb.auug.org.au> <20081110044649.GA18587@us.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:56128 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754483AbYKJMOa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 10 Nov 2008 07:14:30 -0500
Content-Disposition: inline
In-Reply-To: <20081110044649.GA18587@us.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: malahal@us.ibm.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Sun, Nov 09 2008, malahal@us.ibm.com wrote:
> Stephen Rothwell [sfr@canb.auug.org.au] wrote:
> > Hi Jens,
> > 
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > 
> > block/blk-timeout.c: In function 'blk_rq_timed_out_timer':
> > block/blk-timeout.c:140: error: 'next_set' undeclared (first use in this function)
> > 
> > Caused by commit 66f067c93b0eefc8613fd7a91cd6853e2bf48806 ("block:
> > optimizations in blk_rq_timed_out_timer()").  Clearly not even
> > compiled ...
> > 
> 
> I compiled the code with the following patch on i386 arch. Should work
> on powerpc too!
> 
> Signed-off-by: Malahal Naineni <malahal@us.ibm.com>
> 
> 
> diff -r b824bf5f19d4 block/blk-timeout.c
> --- a/block/blk-timeout.c	Sun Nov 09 20:15:10 2008 -0800
> +++ b/block/blk-timeout.c	Sun Nov 09 20:18:07 2008 -0800
> @@ -137,7 +137,7 @@
>  	 * bump ->deadline to 1 so we can detect if the timer was ever added
>  	 * or not. See comment in blk_add_timer()
>  	 */
> -	if (next_set)
> +	if (next)
>  		mod_timer(&q->timeout, round_jiffies_up(next));
>  
>  	spin_unlock_irqrestore(q->queue_lock, flags);

Duh thanks, I'll rebase and fix it!

-- 
Jens Axboe
