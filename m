From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the md tree with the device-mapper tree
Date: Tue, 28 Mar 2017 12:43:45 +1100
Message-ID: <20170328124345.0f20d2d3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shaohua Li <shli@kernel.org>, Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Heinz Mauelshagen <heinzm@redhat.com>, Artur Paszkiewicz <artur.paszkiewicz@intel.com>
List-Id: linux-next.vger.kernel.org

Hi Shaohua,

Today's linux-next merge of the md tree got a conflict in:

  drivers/md/raid5.h

between commit:

  78e470c26f52 ("md: add raid4/5/6 journal mode switching API")

from the device-mapper tree and commit:

  ff875738edd4 ("raid5: separate header for log functions")

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

diff --cc drivers/md/raid5.h
index ec8ca15774d7,cdc7f92e1806..000000000000
--- a/drivers/md/raid5.h
+++ b/drivers/md/raid5.h
@@@ -775,35 -740,4 +750,5 @@@ extern struct stripe_head 
  raid5_get_active_stripe(struct r5conf *conf, sector_t sector,
  			int previous, int noblock, int noquiesce);
  extern int raid5_calc_degraded(struct r5conf *conf);
- extern int r5l_init_log(struct r5conf *conf, struct md_rdev *rdev);
- extern void r5l_exit_log(struct r5l_log *log);
- extern int r5l_write_stripe(struct r5l_log *log, struct stripe_head *head_sh);
- extern void r5l_write_stripe_run(struct r5l_log *log);
- extern void r5l_flush_stripe_to_raid(struct r5l_log *log);
- extern void r5l_stripe_write_finished(struct stripe_head *sh);
- extern int r5l_handle_flush_request(struct r5l_log *log, struct bio *bio);
- extern void r5l_quiesce(struct r5l_log *log, int state);
- extern bool r5l_log_disk_error(struct r5conf *conf);
- extern bool r5c_is_writeback(struct r5l_log *log);
- extern int
- r5c_try_caching_write(struct r5conf *conf, struct stripe_head *sh,
- 		      struct stripe_head_state *s, int disks);
- extern void
- r5c_finish_stripe_write_out(struct r5conf *conf, struct stripe_head *sh,
- 			    struct stripe_head_state *s);
- extern void r5c_release_extra_page(struct stripe_head *sh);
- extern void r5c_use_extra_page(struct stripe_head *sh);
- extern void r5l_wake_reclaim(struct r5l_log *log, sector_t space);
- extern void r5c_handle_cached_data_endio(struct r5conf *conf,
- 	struct stripe_head *sh, int disks, struct bio_list *return_bi);
- extern int r5c_cache_data(struct r5l_log *log, struct stripe_head *sh,
- 			  struct stripe_head_state *s);
- extern void r5c_make_stripe_write_out(struct stripe_head *sh);
- extern void r5c_flush_cache(struct r5conf *conf, int num);
- extern void r5c_check_stripe_cache_usage(struct r5conf *conf);
- extern void r5c_check_cached_full_stripe(struct r5conf *conf);
- extern struct md_sysfs_entry r5c_journal_mode;
- extern void r5c_update_on_rdev_error(struct mddev *mddev);
- extern bool r5c_big_stripe_cached(struct r5conf *conf, sector_t sect);
 +extern int r5c_journal_mode_set(struct mddev *mddev, int journal_mode);
  #endif
