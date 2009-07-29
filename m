From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: linux-next: drbd tree build failure
Date: Wed, 29 Jul 2009 15:29:38 +1000
Message-ID: <20090729152938.791a81c3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
Resent-To: drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
Resent-Message-ID: <200907290956.05293.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
List-Help: <mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=subscribe>
Sender: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
Errors-To: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
To: Philipp Reisner <philipp.reisner-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org>
Cc: Jens Axboe <jens.axboe-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Petersen <martin.petersen-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Martin-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org
List-Id: linux-next.vger.kernel.org

Hi Philipp,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/block/drbd/drbd_nl.c: In function 'drbd_setup_queue_param':
drivers/block/drbd/drbd_nl.c:707: error: implicit declaration of function 'blk_queue_stack_limits'

Caused by commit 6dc986e736ca1e76a45d025a920f3a66855fc2aa ("block:
Deprecate blk_queue_stack_limits") from the block tree.

I have applied the following patch for today.
-- 
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org

From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Date: Wed, 29 Jul 2009 15:25:23 +1000
Subject: [PATCH] drbd: fix for removal of blk_queue_stack_limits

Signed-off-by: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
---
 drivers/block/drbd/drbd_nl.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 1e87ad0..0ec86e8 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -704,7 +704,7 @@ void drbd_setup_queue_param(struct drbd_conf *mdev, unsigned int max_seg_s) __mu
 	blk_queue_max_segment_size(q, max_seg_s);
 	blk_queue_logical_block_size(q, 512);
 	blk_queue_segment_boundary(q, PAGE_SIZE-1);
-	blk_queue_stack_limits(q, b);
+	blk_stack_limits(&q->limits, &b->limits, 0);
 
 	if (b->merge_bvec_fn)
 		dev_warn(DEV, "Backing device's merge_bvec_fn() = %p\n",
-- 
1.6.3.3
