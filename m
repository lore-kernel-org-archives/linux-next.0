From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the md tree
Date: Wed, 15 Oct 2008 19:34:13 +1100
Message-ID: <20081015193413.90ec9792.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58952 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751390AbYJOJOk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 05:14:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Neil Brown <neilb@suse.de>
Cc: linux-next@vger.kernel.org, Denis ChengRq <crquan@gmail.com>, Jens Axboe <jens.axboe@oracle.com>, Tejun Heo <tj@kernel.org>, Andre Noll <maan@systemlinux.org>

Hi Neil,

Today's linux-next merge of the md tree got a conflict in
drivers/md/linear.c between commits
c9959059161ddd7bf4670cf47367033d6b2f79c4 ("block: fix diskstats access")
and 6feef531f55cf4a20fd9eb39f5352e5745203603 ("block: mark bio_split_pool
static") from Linus' tree and commit
2bc5b53551d8246e18562fa8e0cf5fe64b5f8184 ("md: linear: Represent
dev_info->size and dev_info->offset in sectors") from the md tree.

Just overlapping changes.  I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/md/linear.c
index b9cbee68,9b0c5b0..0000000
--- a/drivers/md/linear.c
+++ b/drivers/md/linear.c
@@@ -317,33 -307,29 +307,33 @@@ static int linear_make_request (struct 
  	const int rw = bio_data_dir(bio);
  	mddev_t *mddev = q->queuedata;
  	dev_info_t *tmp_dev;
- 	sector_t block;
 +	int cpu;
  
  	if (unlikely(bio_barrier(bio))) {
  		bio_endio(bio, -EOPNOTSUPP);
  		return 0;
  	}
  
 -	disk_stat_inc(mddev->gendisk, ios[rw]);
 -	disk_stat_add(mddev->gendisk, sectors[rw], bio_sectors(bio));
 +	cpu = part_stat_lock();
 +	part_stat_inc(cpu, &mddev->gendisk->part0, ios[rw]);
 +	part_stat_add(cpu, &mddev->gendisk->part0, sectors[rw],
 +		      bio_sectors(bio));
 +	part_stat_unlock();
  
  	tmp_dev = which_dev(mddev, bio->bi_sector);
- 	block = bio->bi_sector >> 1;
      
- 	if (unlikely(block >= (tmp_dev->size + tmp_dev->offset)
- 		     || block < tmp_dev->offset)) {
+ 	if (unlikely(bio->bi_sector >= (tmp_dev->num_sectors +
+ 					tmp_dev->start_sector)
+ 		     || (bio->bi_sector <
+ 			 tmp_dev->start_sector))) {
  		char b[BDEVNAME_SIZE];
  
- 		printk("linear_make_request: Block %llu out of bounds on "
- 			"dev %s size %llu offset %llu\n",
- 			(unsigned long long)block,
+ 		printk("linear_make_request: Sector %llu out of bounds on "
+ 			"dev %s: %llu sectors, offset %llu\n",
+ 			(unsigned long long)bio->bi_sector,
  			bdevname(tmp_dev->rdev->bdev, b),
- 			(unsigned long long)tmp_dev->size,
- 		        (unsigned long long)tmp_dev->offset);
+ 			(unsigned long long)tmp_dev->num_sectors,
+ 			(unsigned long long)tmp_dev->start_sector);
  		bio_io_error(bio);
  		return 0;
  	}
@@@ -353,8 -339,9 +343,9 @@@
  		 * split it.
  		 */
  		struct bio_pair *bp;
 -		bp = bio_split(bio, bio_split_pool,
 +		bp = bio_split(bio,
- 			       ((tmp_dev->offset + tmp_dev->size)<<1) - bio->bi_sector);
+ 			       tmp_dev->start_sector + tmp_dev->num_sectors
+ 			       - bio->bi_sector);
  		if (linear_make_request(q, &bp->bio1))
  			generic_make_request(&bp->bio1);
  		if (linear_make_request(q, &bp->bio2))
