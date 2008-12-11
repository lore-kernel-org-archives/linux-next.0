From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: [bug?] bio: add experimental support for inlining a number of bio_vecs inside the bio
Date: Thu, 11 Dec 2008 08:32:28 +0100
Message-ID: <20081211073226.GW23742@kernel.dk>
References: <20081210164659.9ebb8158.sfr@canb.auug.org.au> <20081210183059.4FD6.KOSAKI.MOTOHIRO@jp.fujitsu.com> <20081210204630.4FE3.KOSAKI.MOTOHIRO@jp.fujitsu.com> <20081210121237.GQ23742@kernel.dk> <20081210131311.e03d6fc5.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([93.163.65.50]:27271 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751094AbYLKHcp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Dec 2008 02:32:45 -0500
Content-Disposition: inline
In-Reply-To: <20081210131311.e03d6fc5.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kosaki.motohiro@jp.fujitsu.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Dec 10 2008, Andrew Morton wrote:
> On Wed, 10 Dec 2008 13:12:38 +0100
> Jens Axboe <jens.axboe@oracle.com> wrote:
> 
> > > experimental??
> > 
> > Experimental in the sense that it's the first version, not the concept.
> > It's held up well for me, but just yesterday I received the first bug
> > report on a ppc platform and now you have this on ia64.
> 
> 
> Well there's another bug report up-list.  "next-20081209: pdflush: page
> allocation failure (xfs)".
> 
> The clearing of (__GFP_WAIT | __GFP_IO) will call the page allocator in the
> weakest possible mode and will of course spew page allocations warnings
> with great frequency.  It should at least add in __GFP_NOWARN.

OK, that must be for the change titled

"bio: only mempool back the largest bio_vec slab cache"

and yes, that does look like it wants a bit more gfp loving, probably
the same as mempool_alloc() would use anyway. I'll get that fixed.

-- 
Jens Axboe
