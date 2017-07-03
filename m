From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the md tree
Date: Mon, 3 Jul 2017 11:52:48 +1000
Message-ID: <20170703115248.5907f426@canb.auug.org.au>
References: <20170622114456.329ec8ca@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45071 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752124AbdGCBwu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 2 Jul 2017 21:52:50 -0400
In-Reply-To: <20170622114456.329ec8ca@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shaohua Li <shli@kernel.org>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, NeilBrown <neilb@suse.com>

Hi all,

With the merge window opening, just a reminder that this merge fixup is
still required.

On Thu, 22 Jun 2017 11:44:56 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the md tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/md/md.c: In function 'md_run':
> drivers/md/md.c:5449:21: error: too few arguments to function 'bioset_create'
>    mddev->sync_set = bioset_create(BIO_POOL_SIZE, 0);
>                      ^
> In file included from include/linux/blkdev.h:20:0,
>                  from drivers/md/md.c:49:
> include/linux/bio.h:375:24: note: declared here
>  extern struct bio_set *bioset_create(unsigned int, unsigned int, int flags);
>                         ^
> 
> Caused by commit
> 
>   5a85071c2cbc ("md: use a separate bio_set for synchronous IO.")
> 
> interacting with commit
> 
>   011067b05668 ("blk: replace bioset_create_nobvec() with a flags arg to bioset_create()")
> 
> from the block tree.
> 
> I applied the following merge fix patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 22 Jun 2017 11:42:02 +1000
> Subject: [PATCH] md: fix up for "blk: replace bioset_create_nobvec() with a
>  flags arg to bioset_create()"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/md/md.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index c5d9cac4760c..ffccee45af8c 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -5446,7 +5446,7 @@ int md_run(struct mddev *mddev)
>  			return -ENOMEM;
>  	}
>  	if (mddev->sync_set == NULL) {
> -		mddev->sync_set = bioset_create(BIO_POOL_SIZE, 0);
> +		mddev->sync_set = bioset_create(BIO_POOL_SIZE, 0, BIOSET_NEED_BVECS);
>  		if (!mddev->sync_set)
>  			return -ENOMEM;
>  	}
> -- 
> 2.11.0

-- 
Cheers,
Stephen Rothwell
