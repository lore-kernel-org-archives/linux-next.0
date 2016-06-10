From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [mmots-2016-06-09-16-49] kernel BUG at mm/slub.c:1616
Date: Fri, 10 Jun 2016 08:34:19 +0200
Message-ID: <20160610063419.GB32285@dhcp22.suse.cz>
References: <20160610061139.GA374@swordfish>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:32920 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751833AbcFJGeW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 10 Jun 2016 02:34:22 -0400
Content-Disposition: inline
In-Reply-To: <20160610061139.GA374@swordfish>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

On Fri 10-06-16 15:11:39, Sergey Senozhatsky wrote:
> Hello,
> 
> [  429.191962] gfp: 2
> [  429.192634] ------------[ cut here ]------------
> [  429.193281] kernel BUG at mm/slub.c:1616!
[...]
> [  429.217369]  [<ffffffff811ca221>] bio_alloc_bioset+0xbd/0x1b1
> [  429.218013]  [<ffffffff81148078>] mpage_alloc+0x28/0x7b
> [  429.218650]  [<ffffffff8114856a>] do_mpage_readpage+0x43d/0x545
> [  429.219282]  [<ffffffff81148767>] mpage_readpages+0xf5/0x152

OK, so this is flags & GFP_SLAB_BUG_MASK BUG_ON because gfp is
___GFP_HIGHMEM. It is my [1] patch which has introduced it.
I think we need the following. Andrew could you fold it into
mm-memcg-use-consistent-gfp-flags-during-readahead.patch or maybe keep
it as a separate patch?

[1] http://lkml.kernel.org/r/1465301556-26431-1-git-send-email-mhocko@kernel.org

Thanks for the report Sergey!

---
>From 89cfc9bf27b9b5af47fece7eab36deb2fb04516d Mon Sep 17 00:00:00 2001
From: Michal Hocko <mhocko@suse.com>
Date: Fri, 10 Jun 2016 08:27:33 +0200
Subject: [PATCH] mm: restrict gfp mask in mpage_alloc

Sergey has reported that we might hit BUG_ON in new_slab() because
unrestricted gfp mask used for the readahead purposes contains
incompatible flags (__GFP_HIGHMEM in his case):
[  429.191962] gfp: 2
[  429.192634] ------------[ cut here ]------------
[  429.193281] kernel BUG at mm/slub.c:1616!
[...]
[  429.217369]  [<ffffffff811ca221>] bio_alloc_bioset+0xbd/0x1b1
[  429.218013]  [<ffffffff81148078>] mpage_alloc+0x28/0x7b
[  429.218650]  [<ffffffff8114856a>] do_mpage_readpage+0x43d/0x545
[  429.219282]  [<ffffffff81148767>] mpage_readpages+0xf5/0x152

Make sure that mpage_alloc always restricts the mask GFP_KERNEL subset.
This is what was done before "mm, memcg: use consistent gfp flags during
readahead" explicitly by mapping_gfp_constraint(mapping, GFP_KERNEL) in
mpage_readpages.

Reported-by: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Signed-off-by: Michal Hocko <mhocko@suse.com>
---
 fs/mpage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/mpage.c b/fs/mpage.c
index 9c11255b0797..5ce75b2e60d1 100644
--- a/fs/mpage.c
+++ b/fs/mpage.c
@@ -71,7 +71,7 @@ mpage_alloc(struct block_device *bdev,
 {
 	struct bio *bio;
 
-	bio = bio_alloc(gfp_flags, nr_vecs);
+	bio = bio_alloc(gfp_flags & GFP_KERNEL, nr_vecs);
 
 	if (bio == NULL && (current->flags & PF_MEMALLOC)) {
 		while (!bio && (nr_vecs /= 2))
-- 
2.8.1

-- 
Michal Hocko
SUSE Labs
