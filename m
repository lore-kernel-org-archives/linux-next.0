From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the aio tree with the vfs tree
Date: Mon, 14 Mar 2016 15:36:47 +1100
Message-ID: <20160314153647.09236b8d@canb.auug.org.au>
References: <20160314153214.41d7c2fe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33728 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754637AbcCNEgz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Mar 2016 00:36:55 -0400
In-Reply-To: <20160314153214.41d7c2fe@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin LaHaise <bcrl@kvack.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Hi all,

On Mon, 14 Mar 2016 15:32:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> I also added the following merge fix patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 14 Mar 2016 15:28:05 +1100
> Subject: [PATCH] vfs: do_loop_readv_writev() API change merge fix
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/internal.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/internal.h b/fs/internal.h
> index 3bbe63d5eb5e..39f6e9831c5f 100644
> --- a/fs/internal.h
> +++ b/fs/internal.h
> @@ -139,7 +139,7 @@ extern long prune_dcache_sb(struct super_block *sb, struct shrink_control *sc);
>   */
>  extern int rw_verify_area(int, struct file *, const loff_t *, size_t);
>  extern ssize_t do_loop_readv_writev(struct file *filp, struct iov_iter *iter,
> -				    loff_t *ppos, io_fn_t fn);
> +				    loff_t *ppos, io_fn_t fn, int flags);
>  
>  
>  /*

And I forgot this bit :-(

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 14 Mar 2016 15:34:17 +1100
Subject: [PATCH] vfs: do_loop_readv_writev API merge fix up part 2

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/aio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/aio.c b/fs/aio.c
index b079cb65a90f..d2dd7d482ffe 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -1576,7 +1576,7 @@ static long aio_thread_op_read_iter(struct aio_kiocb *iocb)
 	} else if (filp->f_op->read)
 		ret = do_loop_readv_writev(filp, &iocb->ki_iter,
 					   &iocb->common.ki_pos,
-					   filp->f_op->read);
+					   filp->f_op->read, 0);
 	else
 		ret = -EINVAL;
 	unuse_mm(iocb->ki_ctx->mm);
-- 
2.7.0

-- 
Cheers,
Stephen Rothwell
