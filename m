From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the md tree with the block tree
Date: Mon, 17 Aug 2015 14:44:09 +1000
Message-ID: <20150817144409.0e40bf41@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Brown <neilb@suse.de>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Kent Overstreet <kent.overstreet@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Neil,

Today's linux-next merge of the md tree got a conflict in:

  drivers/md/raid5.c

between commit:

  4246a0b63bd8 ("block: add a bi_error field to struct bio")
  8ae126660fdd ("block: kill merge_bvec_fn() completely")

from the block tree and commit:

  1722781be955 ("md/raid5: switch to use conf->chunk_sectors in place of mddev->chunk_sectors where possible")
  4273c3f9d668 ("md/raid5: use bio_list for the list of bios to return.")

from the md tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/md/raid5.c
index b29e89cb815b,4195064460d0..000000000000
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@@ -233,8 -230,7 +230,7 @@@ static void return_io(struct bio_list *
  		bi->bi_iter.bi_size = 0;
  		trace_block_bio_complete(bdev_get_queue(bi->bi_bdev),
  					 bi, 0);
 -		bio_endio(bi, 0);
 +		bio_endio(bi);
- 		bi = return_bi;
  	}
  }
  
@@@ -3110,12 -3107,10 +3105,11 @@@ handle_failed_stripe(struct r5conf *con
  		while (bi && bi->bi_iter.bi_sector <
  			sh->dev[i].sector + STRIPE_SECTORS) {
  			struct bio *nextbi = r5_next_bio(bi, sh->dev[i].sector);
 -			clear_bit(BIO_UPTODATE, &bi->bi_flags);
 +
 +			bi->bi_error = -EIO;
  			if (!raid5_dec_bi_active_stripes(bi)) {
  				md_write_end(conf->mddev);
- 				bi->bi_next = *return_bi;
- 				*return_bi = bi;
+ 				bio_list_add(return_bi, bi);
  			}
  			bi = nextbi;
  		}
@@@ -3135,12 -3130,10 +3129,11 @@@
  		while (bi && bi->bi_iter.bi_sector <
  		       sh->dev[i].sector + STRIPE_SECTORS) {
  			struct bio *bi2 = r5_next_bio(bi, sh->dev[i].sector);
 -			clear_bit(BIO_UPTODATE, &bi->bi_flags);
 +
 +			bi->bi_error = -EIO;
  			if (!raid5_dec_bi_active_stripes(bi)) {
  				md_write_end(conf->mddev);
- 				bi->bi_next = *return_bi;
- 				*return_bi = bi;
+ 				bio_list_add(return_bi, bi);
  			}
  			bi = bi2;
  		}
@@@ -3161,12 -3154,9 +3154,10 @@@
  			       sh->dev[i].sector + STRIPE_SECTORS) {
  				struct bio *nextbi =
  					r5_next_bio(bi, sh->dev[i].sector);
 -				clear_bit(BIO_UPTODATE, &bi->bi_flags);
 +
 +				bi->bi_error = -EIO;
- 				if (!raid5_dec_bi_active_stripes(bi)) {
- 					bi->bi_next = *return_bi;
- 					*return_bi = bi;
- 				}
+ 				if (!raid5_dec_bi_active_stripes(bi))
+ 					bio_list_add(return_bi, bi);
  				bi = nextbi;
  			}
  		}
@@@ -4670,14 -4667,43 +4668,14 @@@ static int raid5_congested(struct mdde
  	return 0;
  }
  
 -/* We want read requests to align with chunks where possible,
 - * but write requests don't need to.
 - */
 -static int raid5_mergeable_bvec(struct mddev *mddev,
 -				struct bvec_merge_data *bvm,
 -				struct bio_vec *biovec)
 -{
 -	struct r5conf *conf = mddev->private;
 -	sector_t sector = bvm->bi_sector + get_start_sect(bvm->bi_bdev);
 -	int max;
 -	unsigned int chunk_sectors;
 -	unsigned int bio_sectors = bvm->bi_size >> 9;
 -
 -	/*
 -	 * always allow writes to be mergeable, read as well if array
 -	 * is degraded as we'll go through stripe cache anyway.
 -	 */
 -	if ((bvm->bi_rw & 1) == WRITE || mddev->degraded)
 -		return biovec->bv_len;
 -
 -	chunk_sectors = min(conf->chunk_sectors, conf->prev_chunk_sectors);
 -	max =  (chunk_sectors - ((sector & (chunk_sectors - 1)) + bio_sectors)) << 9;
 -	if (max < 0) max = 0;
 -	if (max <= biovec->bv_len && bio_sectors == 0)
 -		return biovec->bv_len;
 -	else
 -		return max;
 -}
 -
  static int in_chunk_boundary(struct mddev *mddev, struct bio *bio)
  {
+ 	struct r5conf *conf = mddev->private;
  	sector_t sector = bio->bi_iter.bi_sector + get_start_sect(bio->bi_bdev);
- 	unsigned int chunk_sectors = mddev->chunk_sectors;
+ 	unsigned int chunk_sectors;
  	unsigned int bio_sectors = bio_sectors(bio);
  
- 	if (mddev->new_chunk_sectors < mddev->chunk_sectors)
- 		chunk_sectors = mddev->new_chunk_sectors;
+ 	chunk_sectors = min(conf->chunk_sectors, conf->prev_chunk_sectors);
  	return  chunk_sectors >=
  		((sector & (chunk_sectors - 1)) + bio_sectors);
  }
