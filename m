From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the device-mapper tree
Date: Wed, 30 Jun 2010 12:57:47 +1000
Message-ID: <20100630125747.860b2027.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38583 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753204Ab0F3C5u (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Jun 2010 22:57:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alasdair G Kergon <agk@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Mike Snitzer <snitzer@redhat.com>, Jens Axboe <axboe@kernel.dk>

Hi Alasdair,

After merging the device-mapper tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/md/dm.c: In function '__clone_and_map':
/data/sfr/next/drivers/md/dm.c:1245: error: implicit declaration of function 'bio_rw_flagged'
/data/sfr/next/drivers/md/dm.c:1245: error: 'BIO_RW_DISCARD' undeclared (first use in this function)

Caused by commit d134095c1564b101987d8f2920d0928cae669be2
("dm-linear-support-discard") interacting with commit
74450be123b6f3cb480c358a056be398cce6aa6e ("block: unify flags for struct
bio and struct request") from the block tree.

I hate API changes :-)

I applied the following merge fix up patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 30 Jun 2010 12:54:22 +1000
Subject: [PATCH] device-mapper: fix for bio API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/md/dm.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 518bfe0..20b4248 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1242,7 +1242,7 @@ static int __clone_and_map(struct clone_info *ci)
 	if (unlikely(bio_empty_barrier(bio)))
 		return __clone_and_map_empty_barrier(ci);
 
-	if (unlikely(bio_rw_flagged(bio, BIO_RW_DISCARD)))
+	if (unlikely(bio->bi_rw & REQ_DISCARD))
 		return __clone_and_map_discard(ci);
 
 	ti = dm_table_find_target(ci->map, ci->sector);
-- 
1.7.1


-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
