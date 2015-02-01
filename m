From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the block tree with the vfs tree
Date: Sun, 1 Feb 2015 05:56:19 +0000
Message-ID: <20150201055619.GA31780@ZenIV.linux.org.uk>
References: <20150127145754.03e711a3@canb.auug.org.au>
 <54C70D52.6030208@kernel.dk>
 <20150127045422.GY29656@ZenIV.linux.org.uk>
 <20150128171102.GC17528@lst.de>
 <20150129051555.GC29656@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:58265 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750755AbbBAF4X (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 1 Feb 2015 00:56:23 -0500
Content-Disposition: inline
In-Reply-To: <20150129051555.GC29656@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ming Lei <ming.lei@canonical.com>

On Thu, Jan 29, 2015 at 05:15:55AM +0000, Al Viro wrote:
> On Wed, Jan 28, 2015 at 06:11:02PM +0100, Christoph Hellwig wrote:
> > On Tue, Jan 27, 2015 at 04:54:22AM +0000, Al Viro wrote:
> > > I don't mind opening a never-rebased branch for generic iov_iter-related stuff;
> > > if you prefer to handle it that way - just tell.  The first two patches
> > > from that series would definitely go there; as for the rest... no preferences
> > > here.
> > 
> > It might make sense to just keep the VFS patches in your tree.
> > The target ones also are something I'd prefer if it goes through Nic
> > with additional review.  In addition they aren't really critical,
> > so if you merge the prep patches now we can feed the rest through
> > the proper trees in the .21 merge window.
> 
> Done.  The first two are in #iov_iter now (merged into #for-next), the
> rest is dropped.  And #iov_iter is in never-rebased mode, so feel free
> to pull it wherever you need it.

FWIW, there's an interesting question about the second commit in there -
what do we want vfs_iter_{read,write}() to do with *iter in case if it
has hit this:
        if (ret == -EIOCBQUEUED)
                ret = wait_on_sync_kiocb(&kiocb);

Do we require ->read_iter() and ->write_iter() on sync kiocb to do all
advancing the iter before returning -EIOCBQUEUED?  What's more, do we
ever want to have it returned on sync kiocb?  IOW, is there any point
in having that wait in callers?

Note that there are _very_ few drivers that ever do that; fs/direct_io.c,
for example, will wait for completion in case of sync kiocb.  AFAICS,
there are exactly two drivers like that: drivers/usb/gadget/legacy/inode.c
and drivers/usb/gadget/function/f_fs.c.  And the latter is very easy to
convert to "waits in case of sync kiocb" - there already are two codepaths
({read,write} and aio_{read,write}) and it's trivial to teach the sync
path to deal with arbitrary iov_iter, with aio side of things doing the
sync variant in case of sync kiocb.  Cheaper, as well, since we don't need
to copy iovec, etc.

I'm not sure if ep_io() and ep_aio_rwtail() + wait for completion are
eqiuvalent; ep_read/ep_write are very easy to turn into sync side of
->read_iter/->write_iter and if that's equivalent to ep_aio_read/ep_aio_write
on sync kiocb + waiting for completion, we are fine.

Comments?
