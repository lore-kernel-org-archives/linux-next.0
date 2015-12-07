From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 block tree
Date: Tue, 8 Dec 2015 07:24:50 +1100
Message-ID: <20151208072450.336a6f4d@canb.auug.org.au>
References: <20151207191239.3c1a1c01@canb.auug.org.au>
	<20151207114431.5a5b50b54da49cbe6ab6ca67@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58329 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932668AbbLGUYw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Dec 2015 15:24:52 -0500
In-Reply-To: <20151207114431.5a5b50b54da49cbe6ab6ca67@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Hi Andrew,

On Mon, 7 Dec 2015 11:44:31 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Mon, 7 Dec 2015 19:12:39 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > --- a/fs/block_dev.c
> > +++ b/fs/block_dev.c
> > @@@ -432,7 -432,7 +432,7 @@@ int bdev_write_page(struct block_devic
> >   
> >   	if (!ops->rw_page || bdev_get_integrity(bdev))
> >   		return -EOPNOTSUPP;
> > - 	result = blk_queue_enter(bdev->bd_queue, false);
> >  -	result = blk_queue_enter(bdev->bd_queue, GFP_NOIO);
> > ++	result = blk_queue_enter(bdev->bd_queue, true);
> >   	if (result)  
> 
> We want nowait==false here.

OK, I will fix that up today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
