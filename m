From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the block tree with the vfs tree
Date: Thu, 29 Jan 2015 05:15:55 +0000
Message-ID: <20150129051555.GC29656@ZenIV.linux.org.uk>
References: <20150127145754.03e711a3@canb.auug.org.au>
 <54C70D52.6030208@kernel.dk>
 <20150127045422.GY29656@ZenIV.linux.org.uk>
 <20150128171102.GC17528@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:49023 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755661AbbA2FP7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Jan 2015 00:15:59 -0500
Content-Disposition: inline
In-Reply-To: <20150128171102.GC17528@lst.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ming Lei <ming.lei@canonical.com>

On Wed, Jan 28, 2015 at 06:11:02PM +0100, Christoph Hellwig wrote:
> On Tue, Jan 27, 2015 at 04:54:22AM +0000, Al Viro wrote:
> > I don't mind opening a never-rebased branch for generic iov_iter-related stuff;
> > if you prefer to handle it that way - just tell.  The first two patches
> > from that series would definitely go there; as for the rest... no preferences
> > here.
> 
> It might make sense to just keep the VFS patches in your tree.
> The target ones also are something I'd prefer if it goes through Nic
> with additional review.  In addition they aren't really critical,
> so if you merge the prep patches now we can feed the rest through
> the proper trees in the .21 merge window.

Done.  The first two are in #iov_iter now (merged into #for-next), the
rest is dropped.  And #iov_iter is in never-rebased mode, so feel free
to pull it wherever you need it.
