From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the block tree
Date: Thu, 24 Aug 2017 13:32:03 +1000
Message-ID: <20170824133203.18512289@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44283 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751062AbdHXDcF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Aug 2017 23:32:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>

Hi Jens,

After merging the block tree, today's linux-next build (x86_64
allmodconfig) failed like this:

block/bio-integrity.c: In function '__bio_integrity_endio':
block/bio-integrity.c:388:51: error: 'struct bio' has no member named 'bi_bdev'
  struct blk_integrity *bi = bdev_get_integrity(bio->bi_bdev);
                                                   ^

Caused by commit

  74d46992e0d9 ("block: replace bi_bdev with a gendisk pointer and partitions index")

interacting with commit

  c775d2098d35 ("bio-integrity: Fix regression if profile verify_fn is NULL")

from Linus' tree (before v4.13-rc5).

This should have been fixed up in commit

  3b8848b41130 ("Merge branch 'master' into for-next")

I have used the block tree from next-20170823 for today.

-- 
Cheers,
Stephen Rothwell
