From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: OOPS at boot time
Date: Sat, 24 Jul 2010 13:27:50 +0100
Message-ID: <20100724122750.GA10675@ZenIV.linux.org.uk>
References: <20100720164145.e06242b3.sfr@canb.auug.org.au>
 <20100720033656.0ce6356f.akpm@linux-foundation.org>
 <20100720224525.GO32635@dastard>
 <20100720174424.12a4bf64.akpm@linux-foundation.org>
 <20100721052007.GT32635@dastard>
 <20100721002907.639802cd.akpm@linux-foundation.org>
 <20100721174809.4781c244.sfr@canb.auug.org.au>
 <20100721121116.GD3447@quack.suse.cz>
 <20100721214016.GA903@ZenIV.linux.org.uk>
 <20100723100408.GB3305@quack.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:59079 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755580Ab0GXM2G (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 24 Jul 2010 08:28:06 -0400
Content-Disposition: inline
In-Reply-To: <20100723100408.GB3305@quack.suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Dave Chinner <david@fromorbit.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>

On Fri, Jul 23, 2010 at 12:04:08PM +0200, Jan Kara wrote:

> > @@ -1428,8 +1429,10 @@ out:
> >  	/*
> >  	 * Undo the block allocation
> >  	 */
> > -	if (!performed_allocation)
> > -		dquot_free_block(inode, *count);
> > +	if (!performed_allocation) {
> > +		dquot_free_block_nodirty(inode, *count);
> > +		mark_inode_dirty(inode);
> > +	}
> >  	brelse(bitmap_bh);
> >  	return 0;
> >  }
>   Sorry, but the above two changes look stupid... Why call _nodirty variant
> and dirty the inode immediately after that? It happens in two other places
> in your patch as well...

Frankly, I don't believe that dquot_free_block() is _ever_ the right interface;
please, leave dirtying the inode to the filesystem and let it be explicit.
