From: "Drokin, Oleg" <oleg.drokin@intel.com>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Thu, 30 Jul 2015 14:38:24 +0000
Message-ID: <2253D7EC-7419-44B3-9C6F-B39552AC7DDA@intel.com>
References: <20150730141713.001bf7d6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:35845 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752644AbbG3Oi1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Jul 2015 10:38:27 -0400
In-Reply-To: <20150730141713.001bf7d6@canb.auug.org.au>
Content-Language: en-US
Content-ID: <2AD5E4CA4C8F4A488B5DB6CCD9F687C8@intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, "<linux-next@vger.kernel.org>" <linux-next@vger.kernel.org>, "<linux-kernel@vger.kernel.org>" <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Greg KH <greg@kroah.com>, "Dilger, Andreas" <andreas.dilger@intel.com>


On Jul 30, 2015, at 12:17 AM, Stephen Rothwell wrote:

> Hi Jens,
> 
> After merging the block tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/staging/lustre/lustre/llite/../include/obd_support.h:42:0,
>                 from drivers/staging/lustre/lustre/llite/../include/lustre_cfg.h:225,
>                 from drivers/staging/lustre/lustre/llite/../include/lustre_lib.h:55,
>                 from drivers/staging/lustre/lustre/llite/lloop.c:105:
> drivers/staging/lustre/lustre/llite/lloop.c: In function 'loop_handle_bio':
> drivers/staging/lustre/lustre/llite/../include/linux/lustre_compat25.h:89:35: error: too many arguments to function 'bio_endio'
> #define cfs_bio_endio(a, b, c)    bio_endio((a), (c))
>                                   ^
> drivers/staging/lustre/lustre/llite/lloop.c:379:3: note: in expansion of macro 'cfs_bio_endio'
>   cfs_bio_endio(bio, bio->bi_iter.bi_size, ret);
>   ^
> In file included from include/linux/blkdev.h:18:0,
>                 from drivers/staging/lustre/lustre/llite/lloop.c:91:
> include/linux/bio.h:442:13: note: declared here
> extern void bio_endio(struct bio *);
>             ^
> 
> Caused by commit
> 
>  4246a0b63bd8 ("block: add a bi_error field to struct bio")
> 
> I added the following fix patch, but more is probably required:

It looks like this in itself is enough, but we probably should be good to
kill those cfs_bio_* compat macros while we are at it.
I'll submit a patch, but not sure where to base it on.
If basing on current block tree's linux-next, then I get a bunch of errors about how
kstrto* are undefined, so I cannot really test this yet.

Thanks.

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 30 Jul 2015 14:10:57 +1000
> Subject: [PATCH] block: lustre: temporary fix for bio_endio API change
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
> drivers/staging/lustre/lustre/include/linux/lustre_compat25.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/lustre/lustre/include/linux/lustre_compat25.h b/drivers/staging/lustre/lustre/include/linux/lustre_compat25.h
> index 513c81f43d6e..1aac5a77c500 100644
> --- a/drivers/staging/lustre/lustre/include/linux/lustre_compat25.h
> +++ b/drivers/staging/lustre/lustre/include/linux/lustre_compat25.h
> @@ -86,7 +86,7 @@
> 		vfs_rename(old, old_dir, new, new_dir, NULL, 0)
> 
> #define cfs_bio_io_error(a, b)   bio_io_error((a))
> -#define cfs_bio_endio(a, b, c)    bio_endio((a), (c))
> +#define cfs_bio_endio(a, b, c)    bio_endio((a))
> 
> #define cfs_path_put(nd)     path_put(&(nd)->path)
> 
> -- 
> 2.4.6
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
