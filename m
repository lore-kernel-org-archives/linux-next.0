From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the block tree with the vfs tree
Date: Mon, 2 Feb 2015 09:06:08 +0100
Message-ID: <20150202080608.GA9851@lst.de>
References: <20150127145754.03e711a3@canb.auug.org.au> <54C70D52.6030208@kernel.dk> <20150127045422.GY29656@ZenIV.linux.org.uk> <20150128171102.GC17528@lst.de> <20150129051555.GC29656@ZenIV.linux.org.uk> <20150201055619.GA31780@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:43188 "EHLO newverein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752315AbbBBIGL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Feb 2015 03:06:11 -0500
Content-Disposition: inline
In-Reply-To: <20150201055619.GA31780@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ming Lei <ming.lei@canonical.com>

On Sun, Feb 01, 2015 at 05:56:19AM +0000, Al Viro wrote:
> FWIW, there's an interesting question about the second commit in there -
> what do we want vfs_iter_{read,write}() to do with *iter in case if it
> has hit this:
>         if (ret == -EIOCBQUEUED)
>                 ret = wait_on_sync_kiocb(&kiocb);
> 
> Do we require ->read_iter() and ->write_iter() on sync kiocb to do all
> advancing the iter before returning -EIOCBQUEUED?  What's more, do we
> ever want to have it returned on sync kiocb?  IOW, is there any point
> in having that wait in callers?

See my "[RFC] split struct kiocb" series to sort out that mess.  For
now none of the callers relies on the iov_iter being advances, so until
then we can simply ignore that problem until then.

> I'm not sure if ep_io() and ep_aio_rwtail() + wait for completion are
> eqiuvalent; ep_read/ep_write are very easy to turn into sync side of
> ->read_iter/->write_iter and if that's equivalent to ep_aio_read/ep_aio_write
> on sync kiocb + waiting for completion, we are fine.

They are very similar, and yes thet should be moved to iter version of
the methods.  I actually started that but then ran into problems with
the aio core that needed addressing first.
