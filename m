From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the f2fs tree
Date: Tue, 22 Nov 2016 14:42:25 +1100
Message-ID: <20161122144225.71ded882@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56647 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754895AbcKVDm2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Nov 2016 22:42:28 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  fs/f2fs/segment.c

between commit:

  792b84b74b54 ("f2fs: support multiple devices")

from the f2fs tree and commit:

  70fd76140a6c ("block,fs: use REQ_* flags directly")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc fs/f2fs/segment.c
index eaa0b40e1ba0,f1b4a1775ebe..000000000000
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@@ -401,33 -400,6 +401,33 @@@ void f2fs_balance_fs_bg(struct f2fs_sb_
  	}
  }
  
 +static int __submit_flush_wait(struct block_device *bdev)
 +{
 +	struct bio *bio = f2fs_bio_alloc(0);
 +	int ret;
 +
- 	bio_set_op_attrs(bio, REQ_OP_WRITE, WRITE_FLUSH);
++	bio->bi_opf = REQ_OP_WRITE | REQ_PREFLUSH;
 +	bio->bi_bdev = bdev;
 +	ret = submit_bio_wait(bio);
 +	bio_put(bio);
 +	return ret;
 +}
 +
 +static int submit_flush_wait(struct f2fs_sb_info *sbi)
 +{
 +	int ret = __submit_flush_wait(sbi->sb->s_bdev);
 +	int i;
 +
 +	if (sbi->s_ndevs && !ret) {
 +		for (i = 1; i < sbi->s_ndevs; i++) {
 +			ret = __submit_flush_wait(FDEV(i).bdev);
 +			if (ret)
 +				break;
 +		}
 +	}
 +	return ret;
 +}
 +
  static int issue_flush_thread(void *data)
  {
  	struct f2fs_sb_info *sbi = data;
