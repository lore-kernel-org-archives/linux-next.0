From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the btrfs tree
Date: Fri, 21 Aug 2015 10:42:10 +1000
Message-ID: <20150821104210.19795868@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36882 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751942AbbHUAmO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 20 Aug 2015 20:42:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi all,

After merging the btrfs tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/btrfs/extent_io.c: In function 'btrfs_bio_clone':
fs/btrfs/extent_io.c:2734:10: error: 'struct bio' has no member named 'bi_css'
   if (bio->bi_css)
          ^
fs/btrfs/extent_io.c:2735:32: error: 'struct bio' has no member named 'bi_css'
    bio_associate_blkcg(new, bio->bi_css);
                                ^
fs/btrfs/volumes.c: In function 'breakup_stripe_bio':
fs/btrfs/volumes.c:5958:15: error: 'struct bio' has no member named 'bi_ioc'
  if (first_bio->bi_ioc) {
               ^
fs/btrfs/volumes.c:5959:34: error: 'struct bio' has no member named 'bi_ioc'
   get_io_context_active(first_bio->bi_ioc);
                                  ^
fs/btrfs/volumes.c:5960:6: error: 'struct bio' has no member named 'bi_ioc'
   bio->bi_ioc = first_bio->bi_ioc;
      ^
fs/btrfs/volumes.c:5960:26: error: 'struct bio' has no member named 'bi_ioc'
   bio->bi_ioc = first_bio->bi_ioc;
                          ^
fs/btrfs/volumes.c:5962:15: error: 'struct bio' has no member named 'bi_css'
  if (first_bio->bi_css) {
               ^
fs/btrfs/volumes.c:5963:20: error: 'struct bio' has no member named 'bi_css'
   css_get(first_bio->bi_css);
                    ^
fs/btrfs/volumes.c:5964:6: error: 'struct bio' has no member named 'bi_css'
   bio->bi_css = first_bio->bi_css;
      ^
fs/btrfs/volumes.c:5964:26: error: 'struct bio' has no member named 'bi_css'
   bio->bi_css = first_bio->bi_css;
                          ^

Caused by commit

  da2f0f74cf7d ("Btrfs: add support for blkio controllers")

This build does ont have CONFIG_BLK_CGROUP set.

I have used the btrfs tree from next-20150820 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
