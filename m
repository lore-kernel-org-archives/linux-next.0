From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the block tree
Date: Fri, 16 Sep 2016 11:14:34 +1000
Message-ID: <20160916111434.43bcf04e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Josef Bacik <jbacik@fb.com>
List-Id: linux-next.vger.kernel.org

Hi Jens,

After merging the block tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/block/nbd.c:884:2: error: unknown field 'map_queue' specified in initializer
  .map_queue = blk_mq_map_queue,
  ^
/home/sfr/next/next/drivers/block/nbd.c:884:15: error: 'blk_mq_map_queue' undeclared here (not in a function)
  .map_queue = blk_mq_map_queue,
               ^

Caused by commit

  9151bcb4fb38 ("blk-mq: kill unused blk_mq_create_mq_map()")

interacting with commit

  fd8383fd88a2 ("nbd: convert to blkmq")

also in the block tree.

I have used the block tree from next-20160915 for today.

-- 
Cheers,
Stephen Rothwell
