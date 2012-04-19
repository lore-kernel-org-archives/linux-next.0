From: Steven Whitehouse <swhiteho@redhat.com>
Subject: Re: linux-next: commit "GFS2: Clean up log write code path"
 breakage
Date: Thu, 19 Apr 2012 11:12:34 +0100
Message-ID: <1334830354.2718.5.camel@menhir>
References: <CAP=VYLoD6yLQkLO0Q=wGQ5yag9e9qw-5iwHLGgcck60Efy5-Vg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:8398 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752620Ab2DSKMl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Apr 2012 06:12:41 -0400
In-Reply-To: <CAP=VYLoD6yLQkLO0Q=wGQ5yag9e9qw-5iwHLGgcck60Efy5-Vg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, cluster-devel@redhat.com

Hi,

On Wed, 2012-04-18 at 21:26 -0400, Paul Gortmaker wrote:
> Hi Steven,
> 
> When you have a chance can you look at this? Git bisect says that
> this commit:
> 
> ----------
> commit e80623efc450fb615d1496774c8d5c063a50fb3a
> Author: Steven Whitehouse <swhiteho@redhat.com>
> Date:   Mon Apr 16 09:28:31 2012 +0100
> 
>     GFS2: Clean up log write code path
> ----------
> 
This should do the trick... I've rolled in a couple of other small fixes
that I had pending too. I guess probably page_address() was a macro on
the problematic arches which is why they hit it, but x86_64 did not.
I've pushed the patch to my -nmw git tree, so that it should appear in
the next -next. Thanks for the bug report,

Steve.


>From 3c1d908182c084972276b1196fb0ef6f1c419c68 Mon Sep 17 00:00:00 2001
From: Steven Whitehouse <swhiteho@redhat.com>
Date: Thu, 19 Apr 2012 10:38:50 +0100
Subject: [PATCH] GFS2: Log code fixes

This patch removes a log lock from around atomic operation where
it is not needed, removes an unused variable, and also changes
a void pointer used incorrectly to a struct page pointer.

Signed-off-by: Steven Whitehouse <swhiteho@redhat.com>

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 2307218..db9cb18 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -643,10 +643,8 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl)
 	if (sdp->sd_log_head != sdp->sd_log_flush_head) {
 		log_write_header(sdp, 0);
 	} else if (sdp->sd_log_tail != current_tail(sdp) && !sdp->sd_log_idle){
-		gfs2_log_lock(sdp);
 		atomic_dec(&sdp->sd_log_blks_free); /* Adjust for unreserved buffer */
 		trace_gfs2_log_blocks(sdp, -1);
-		gfs2_log_unlock(sdp);
 		log_write_header(sdp, 0);
 	}
 	lops_after_commit(sdp, ai);
@@ -797,11 +795,9 @@ int gfs2_logd(void *data)
 	struct gfs2_sbd *sdp = data;
 	unsigned long t = 1;
 	DEFINE_WAIT(wait);
-	unsigned preflush;
 
 	while (!kthread_should_stop()) {
 
-		preflush = atomic_read(&sdp->sd_log_pinned);
 		if (gfs2_jrnl_flush_reqd(sdp) || t == 0) {
 			gfs2_ail1_empty(sdp);
 			gfs2_log_flush(sdp, NULL);
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index e9709da..11fedb5 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -375,7 +375,7 @@ void gfs2_log_write_page(struct gfs2_sbd *sdp, struct page *page)
 static struct page *gfs2_get_log_desc(struct gfs2_sbd *sdp, u32 ld_type,
 				      u32 ld_length, u32 ld_data1)
 {
-	void *page = mempool_alloc(gfs2_page_pool, GFP_NOIO);
+	struct page *page = mempool_alloc(gfs2_page_pool, GFP_NOIO);
 	struct gfs2_log_descriptor *ld = page_address(page);
 	clear_page(ld);
 	ld->ld_header.mh_magic = cpu_to_be32(GFS2_MAGIC);
-- 
1.7.4
