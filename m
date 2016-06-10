From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: [mmots-2016-06-09-16-49] kernel BUG at mm/slub.c:1616
Date: Fri, 10 Jun 2016 16:24:59 +0900
Message-ID: <20160610072459.GA585@swordfish>
References: <20160610061139.GA374@swordfish>
 <20160610063419.GB32285@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:33163 "EHLO
	mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751598AbcFJHZC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 10 Jun 2016 03:25:02 -0400
Content-Disposition: inline
In-Reply-To: <20160610063419.GB32285@dhcp22.suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Hocko <mhocko@kernel.org>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

that was fast!

On (06/10/16 08:34), Michal Hocko wrote:
[..]
> OK, so this is flags & GFP_SLAB_BUG_MASK BUG_ON because gfp is
> ___GFP_HIGHMEM. It is my [1] patch which has introduced it.
> I think we need the following. Andrew could you fold it into
> mm-memcg-use-consistent-gfp-flags-during-readahead.patch or maybe keep
> it as a separate patch?
> 
> [1] http://lkml.kernel.org/r/1465301556-26431-1-git-send-email-mhocko@kernel.org
> 
> Thanks for the report Sergey!

after quick tests -- works for me. please see below.

> Sergey has reported that we might hit BUG_ON in new_slab() because
> unrestricted gfp mask used for the readahead purposes contains
> incompatible flags (__GFP_HIGHMEM in his case):
> [  429.191962] gfp: 2
> [  429.192634] ------------[ cut here ]------------
> [  429.193281] kernel BUG at mm/slub.c:1616!
> [...]
> [  429.217369]  [<ffffffff811ca221>] bio_alloc_bioset+0xbd/0x1b1
> [  429.218013]  [<ffffffff81148078>] mpage_alloc+0x28/0x7b
> [  429.218650]  [<ffffffff8114856a>] do_mpage_readpage+0x43d/0x545
> [  429.219282]  [<ffffffff81148767>] mpage_readpages+0xf5/0x152
> 
> Make sure that mpage_alloc always restricts the mask GFP_KERNEL subset.
> This is what was done before "mm, memcg: use consistent gfp flags during
> readahead" explicitly by mapping_gfp_constraint(mapping, GFP_KERNEL) in
> mpage_readpages.
> 
> Reported-by: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
> Signed-off-by: Michal Hocko <mhocko@suse.com>
> ---
>  fs/mpage.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/mpage.c b/fs/mpage.c
> index 9c11255b0797..5ce75b2e60d1 100644
> --- a/fs/mpage.c
> +++ b/fs/mpage.c
> @@ -71,7 +71,7 @@ mpage_alloc(struct block_device *bdev,
>  {
>  	struct bio *bio;
>  
> -	bio = bio_alloc(gfp_flags, nr_vecs);
> +	bio = bio_alloc(gfp_flags & GFP_KERNEL, nr_vecs);
>  
>  	if (bio == NULL && (current->flags & PF_MEMALLOC)) {
>  		while (!bio && (nr_vecs /= 2))

so the first bio_alloc() is ok now. what about the second bio_alloc()
in mpage_alloc()? it'll still see the ___GFP_HIGHMEM?

may be something like this (composed in mail client)

static struct bio *
mpage_alloc(struct block_device *bdev,
		sector_t first_sector, int nr_vecs,
		gfp_t gfp_flags)
{
	struct bio *bio;

+	gfp_flags &= GFP_KERNEL;

-	bio = bio_alloc(gfp_flags, nr_vecs);
+	bio = bio_alloc(gfp_flags & GFP_KERNEL, nr_vecs);

	if (bio == NULL && (current->flags & PF_MEMALLOC)) {
		while (!bio && (nr_vecs /= 2))
			bio = bio_alloc(gfp_flags, nr_vecs);
					^^^^^^^^^^^^^^^^^^^^ BUG?
	}

	if (bio) {
		bio->bi_bdev = bdev;
		bio->bi_iter.bi_sector = first_sector;
	}
	return bio;
}


=====

the second part of the original report (sleeping function called from
invalid context at include/linux/sched.h:2960) is unrelated, I'll fork
a new thread; seems that it's coming from a380a3c755, Christoph Lameter,
2015-11-20.

	-ss
