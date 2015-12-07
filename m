From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 block tree
Date: Mon, 7 Dec 2015 11:44:31 -0800
Message-ID: <20151207114431.5a5b50b54da49cbe6ab6ca67@linux-foundation.org>
References: <20151207191239.3c1a1c01@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151207191239.3c1a1c01@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On Mon, 7 Dec 2015 19:12:39 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> --- a/fs/block_dev.c
> +++ b/fs/block_dev.c
> @@@ -432,7 -432,7 +432,7 @@@ int bdev_write_page(struct block_devic
>   
>   	if (!ops->rw_page || bdev_get_integrity(bdev))
>   		return -EOPNOTSUPP;
> - 	result = blk_queue_enter(bdev->bd_queue, false);
>  -	result = blk_queue_enter(bdev->bd_queue, GFP_NOIO);
> ++	result = blk_queue_enter(bdev->bd_queue, true);
>   	if (result)

We want nowait==false here.
