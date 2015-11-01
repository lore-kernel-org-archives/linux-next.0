From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 block tree
Date: Mon, 2 Nov 2015 08:51:12 +1100
Message-ID: <20151102085112.0505410a@canb.auug.org.au>
References: <20151102025125.0f335513@canb.auug.org.au>
	<20151101183853.GB22902@techsingularity.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40863 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752672AbbKAVvR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Nov 2015 16:51:17 -0500
In-Reply-To: <20151101183853.GB22902@techsingularity.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mel Gorman <mgorman@techsingularity.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>

Hi Mel,

On Sun, 1 Nov 2015 18:38:53 +0000 Mel Gorman <mgorman@techsingularity.net> wrote:
>
> On Mon, Nov 02, 2015 at 02:51:25AM +1100, Stephen Rothwell wrote:
> > 
> > @@ -2038,7 +2038,7 @@ void generic_make_request(struct bio *bio)
> >  	do {
> >  		struct request_queue *q = bdev_get_queue(bio->bi_bdev);
> >  
> > -		if (likely(blk_queue_enter(q, __GFP_WAIT) == 0)) {
> > +		if (likely(blk_queue_enter(q, __GFP_RECLAIM) == 0)) {
> >  
> >  			q->make_request_fn(q, bio);
> 
> ___GFP_DIRECT_RECLAIM is more appropriate than __GFP_RECLAIM in the
> second hunk.

OK, I have done that for today, thanks.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
