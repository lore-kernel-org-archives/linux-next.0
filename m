From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the md tree with the block tree
Date: Tue, 13 Jun 2017 14:33:01 +1000
Message-ID: <20170613143301.0c4a80f9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shaohua Li <shli@kernel.org>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Guoqing Jiang <gqjiang@suse.com>
List-Id: linux-next.vger.kernel.org

Hi Shaohua,

Today's linux-next merge of the md tree got a conflict in:

  drivers/md/raid5.c

between commit:

  4e4cbee93d56 ("block: switch bios to blk_status_t")

from the block tree and commit:

  66a8066d55fd ("md: simplify code with bio_io_error")

from the md tree.

I fixed it up (the latter removed code updated by the former) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
