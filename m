From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the device-mapper tree with the block
 tree
Date: Mon, 18 Jul 2016 14:09:35 +1000
Message-ID: <20160718140935.75ac0fcc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40477 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750709AbcGREJh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jul 2016 00:09:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Toshi Kani <toshi.kani@hpe.com>, Christoph Hellwig <hch@lst.de>

Hi all,

Today's linux-next merge of the device-mapper tree got a conflict in:

  include/linux/blkdev.h

between commit:

  288dab8a35a0 ("block: add a separate operation type for secure erase")

from the block tree and commit:

  ff6bbdd8ef75 ("block: add QUEUE_FLAG_DAX for devices to advertise their DAX support")

from the device-mapper tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/linux/blkdev.h
index 9ae49ccaac95,1493ab3a537f..000000000000
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@@ -592,8 -593,9 +593,9 @@@ static inline void queue_flag_clear(uns
  #define blk_queue_stackable(q)	\
  	test_bit(QUEUE_FLAG_STACKABLE, &(q)->queue_flags)
  #define blk_queue_discard(q)	test_bit(QUEUE_FLAG_DISCARD, &(q)->queue_flags)
 -#define blk_queue_secdiscard(q)	(blk_queue_discard(q) && \
 -	test_bit(QUEUE_FLAG_SECDISCARD, &(q)->queue_flags))
 +#define blk_queue_secure_erase(q) \
 +	(test_bit(QUEUE_FLAG_SECERASE, &(q)->queue_flags))
+ #define blk_queue_dax(q)	test_bit(QUEUE_FLAG_DAX, &(q)->queue_flags)
  
  #define blk_noretry_request(rq) \
  	((rq)->cmd_flags & (REQ_FAILFAST_DEV|REQ_FAILFAST_TRANSPORT| \
