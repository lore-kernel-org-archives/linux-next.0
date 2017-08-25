From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 25 Aug 2017 11:34:19 +0200
Message-ID: <20170825093419.GA11402@lst.de>
References: <20170825181254.17e6541d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170825181254.17e6541d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Minchan Kim <minchan@kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Aug 25, 2017 at 06:12:54PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/block/zram/zram_drv.c: In function 'read_from_bdev_a
> sync':
> drivers/block/zram/zram_drv.c:461:5: error: 'struct bio' has
>  no member named 'bi_bdev'
>   bio->bi_bdev = zram->bdev;
>      ^
> drivers/block/zram/zram_drv.c: In function 'write_to_bdev':
> drivers/block/zram/zram_drv.c:555:5: error: 'struct bio' has
>  no member named 'bi_bdev'
>   bio->bi_bdev = zram->bdev;

Replace this with:

	bio_set_dev(bio, zram->bdev);
