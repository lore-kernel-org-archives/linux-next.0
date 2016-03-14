From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the aio tree with the vfs tree
Date: Mon, 14 Mar 2016 15:41:40 +1100
Message-ID: <20160314154140.46e0706a@canb.auug.org.au>
References: <20160314153214.41d7c2fe@canb.auug.org.au>
	<20160314153647.09236b8d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40302 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750871AbcCNEln (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Mar 2016 00:41:43 -0400
In-Reply-To: <20160314153647.09236b8d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin LaHaise <bcrl@kvack.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Hi all,

On Mon, 14 Mar 2016 15:36:47 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> And I forgot this bit :-(

And just to show I should be on holidays, this as well :-(

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 14 Mar 2016 15:38:22 +1100
Subject: [PATCH] vfs: do_loop_readv_writev API merge fix part 3

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/aio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/aio.c b/fs/aio.c
index d2dd7d482ffe..5652953d73bc 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -1626,7 +1626,7 @@ static long aio_thread_op_write_iter(struct aio_kiocb *iocb)
 	} else if (filp->f_op->write)
 		ret = do_loop_readv_writev(filp, &iocb->ki_iter,
 					   &iocb->common.ki_pos,
-					   (io_fn_t)filp->f_op->write);
+					   (io_fn_t)filp->f_op->write, 0);
 	else
 		ret = -EINVAL;
 	current->signal->rlim[RLIMIT_FSIZE].rlim_cur = saved_rlim_fsize;
-- 
2.7.0

-- 
Cheers,
Stephen Rothwell
