From: Ming Lei <tom.leiming@gmail.com>
Subject: Re: linux-next: build warning after merge of the md tree
Date: Tue, 28 Mar 2017 16:17:55 +0800
Message-ID: <20170328081753.GA6743@ming.t460p>
References: <20170328154022.4aad73b6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170328154022.4aad73b6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Shaohua Li <shli@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi,

On Tue, Mar 28, 2017 at 03:40:22PM +1100, Stephen Rothwell wrote:
> Hi Shaohua,
> 
> After merging the md tree, today's linux-next build (powerpc
> pseries_le_defconfig) produced this warning:
> 
> drivers/md/raid1.c: In function 'raid1d':
> drivers/md/raid1.c:2172:9: warning: 'page_len$' may be used uninitialized in this function [-Wmaybe-uninitialized]
>      if (memcmp(page_address(ppages[j]),
>          ^
> drivers/md/raid1.c:2160:7: note: 'page_len$' was declared here
>    int page_len[RESYNC_PAGES];
>        ^
> 
> Introduced by commit
> 
>   60928a91b0b3 ("md: raid1: use bio helper in process_checks()")

It is a false positive, and looks we have to initialize it for killing
the warning since I don't find a annotation for addressing uninitialized
array.

So how about the following patch?

---

>From 73fd5ba571465d764fc0cf73fc4169d222dd676a Mon Sep 17 00:00:00 2001
From: Ming Lei <tom.leiming@gmail.com>
Date: Tue, 28 Mar 2017 16:09:13 +0800
Subject: [PATCH] md: raid1: kill warning on powerpc_pseries

This patch kills the warning reported on powerpc_pseries,
and actually we don't need the initialization.

	After merging the md tree, today's linux-next build (powerpc
	pseries_le_defconfig) produced this warning:

	drivers/md/raid1.c: In function 'raid1d':
	drivers/md/raid1.c:2172:9: warning: 'page_len$' may be used uninitialized in this function [-Wmaybe-uninitialized]
	     if (memcmp(page_address(ppages[j]),
	         ^
	drivers/md/raid1.c:2160:7: note: 'page_len$' was declared here
	   int page_len[RESYNC_PAGES];
       ^

Signed-off-by: Ming Lei <tom.leiming@gmail.com>
---
 drivers/md/raid1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index 3c13286190c1..7e6350334d8e 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -2172,7 +2172,7 @@ static void process_checks(struct r1bio *r1_bio)
 		struct page **ppages = get_resync_pages(pbio)->pages;
 		struct page **spages = get_resync_pages(sbio)->pages;
 		struct bio_vec *bi;
-		int page_len[RESYNC_PAGES];
+		int page_len[RESYNC_PAGES] = { 0 };
 
 		if (sbio->bi_end_io != end_sync_read)
 			continue;
-- 
2.9.3
