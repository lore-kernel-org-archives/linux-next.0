From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 25 Aug 2017 18:12:54 +1000
Message-ID: <20170825181254.17e6541d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Minchan Kim <minchan@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/block/zram/zram_drv.c: In function 'read_from_bdev_a
sync':
drivers/block/zram/zram_drv.c:461:5: error: 'struct bio' has
 no member named 'bi_bdev'
  bio->bi_bdev = zram->bdev;
     ^
drivers/block/zram/zram_drv.c: In function 'write_to_bdev':
drivers/block/zram/zram_drv.c:555:5: error: 'struct bio' has
 no member named 'bi_bdev'
  bio->bi_bdev = zram->bdev;
     ^

Caused by commits

  827180946edf ("zram: write incompressible pages to backing device")
  83ff0ec8b13f ("zram: read page from backing device")

interacting with commit

  74d46992e0d9 ("block: replace bi_bdev with a gendisk pointer and partitions index")

from the block tree.

I have no idea how to fix this up, so I just disabled CONFIG_ZRAM
for today.

If someone could look at providing a resolution, that would help.
-- 
Cheers,
Stephen Rothwell
