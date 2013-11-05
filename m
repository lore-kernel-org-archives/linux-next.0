From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the block tree
Date: Tue, 5 Nov 2013 05:08:33 -0800
Message-ID: <20131105130833.GC19906@kroah.com>
References: <20131105160924.4da55b7e36aa2ab93443fdda@canb.auug.org.au>
 <20131105052010.GA14557@kroah.com>
 <20131105094926.GA12440@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:44157 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754607Ab3KENGT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Nov 2013 08:06:19 -0500
Content-Disposition: inline
In-Reply-To: <20131105094926.GA12440@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kent Overstreet <kmo@daterainc.com>, Jens Axboe <axboe@kernel.dk>

On Tue, Nov 05, 2013 at 01:49:26AM -0800, Christoph Hellwig wrote:
> On Mon, Nov 04, 2013 at 09:20:10PM -0800, Greg KH wrote:
> > > I fixed it up (see below) and can carry the fix as necessary (no action
> > > is required).
> > 
> > Looks good to me, thanks.
> 
> The lloop driver should simply be dropped.  It's a duplication of loop
> which had some lustre-specific hacks that are replaced with generic
> improvements already in linux-next.

That's fine with me, I figure it will be deleted eventually by someone
sending me a patch to do so...
