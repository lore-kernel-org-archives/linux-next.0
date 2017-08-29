From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the md tree with the block tree
Date: Tue, 29 Aug 2017 14:13:36 +1000
Message-ID: <20170829141336.136e7d3e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shaohua Li <shli@kernel.org>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Pawel Baldysiak <pawel.baldysiak@intel.com>, Artur Paszkiewicz <artur.paszkiewicz@intel.com>
List-Id: linux-next.vger.kernel.org

Hi Shaohua,

Today's linux-next merge of the md tree got a conflict in:

  drivers/md/raid5-ppl.c

between commit:

  74d46992e0d9 ("block: replace bi_bdev with a gendisk pointer and partitions index")

from the block tree and commit:

  ddc088238cd6 ("md: Runtime support for multiple ppls")

from the md tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell
diff --cc drivers/md/raid5-ppl.c
index 1e237c40d6fa,a98ef172f8e8..000000000000
--- a/drivers/md/raid5-ppl.c
+++ b/drivers/md/raid5-ppl.c
@@@ -451,12 -456,25 +456,25 @@@ static void ppl_submit_iounit(struct pp
  	pplhdr->entries_count = cpu_to_le32(io->entries_count);
  	pplhdr->checksum = cpu_to_le32(~crc32c_le(~0, pplhdr, PPL_HEADER_SIZE));
  
+ 	/* Rewind the buffer if current PPL is larger then remaining space */
+ 	if (log->use_multippl &&
+ 	    log->rdev->ppl.sector + log->rdev->ppl.size - log->next_io_sector <
+ 	    (PPL_HEADER_SIZE + io->pp_size) >> 9)
+ 		log->next_io_sector = log->rdev->ppl.sector;
+ 
+ 
  	bio->bi_end_io = ppl_log_endio;
  	bio->bi_opf = REQ_OP_WRITE | REQ_FUA;
 -	bio->bi_bdev = log->rdev->bdev;
 +	bio_set_dev(bio, log->rdev->bdev);
- 	bio->bi_iter.bi_sector = log->rdev->ppl.sector;
+ 	bio->bi_iter.bi_sector = log->next_io_sector;
  	bio_add_page(bio, io->header_page, PAGE_SIZE, 0);
  
+ 	pr_debug("%s: log->current_io_sector: %llu\n", __func__,
+ 	    (unsigned long long)log->next_io_sector);
+ 
+ 	if (log->use_multippl)
+ 		log->next_io_sector += (PPL_HEADER_SIZE + io->pp_size) >> 9;
+ 
  	list_for_each_entry(sh, &io->stripe_list, log_list) {
  		/* entries for full stripe writes have no partial parity */
  		if (test_bit(STRIPE_FULL_WRITE, &sh->state))
