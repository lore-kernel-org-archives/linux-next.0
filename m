From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Date: Mon, 24 Apr 2017 11:25:12 +1000
Message-ID: <20170424112512.582d04da@canb.auug.org.au>
References: <20170421121014.3ee14a83@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44251 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1163904AbdDXBZP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 23 Apr 2017 21:25:15 -0400
In-Reply-To: <20170421121014.3ee14a83@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, Dave Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Logan Gunthorpe <logang@deltatee.com>, Sumit Semwal <sumit.semwal@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>

Hi all,

On Fri, 21 Apr 2017 12:10:14 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/tee/tee_shm.c:87:2: error: unknown field 'kmap_atomic' specified in initializer
>   .kmap_atomic = tee_shm_op_kmap_atomic,
>   ^
> drivers/tee/tee_shm.c:87:17: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>   .kmap_atomic = tee_shm_op_kmap_atomic,
>                  ^
> drivers/tee/tee_shm.c:87:17: note: (near initialization for 'tee_shm_dma_buf_ops.begin_cpu_access')
> drivers/tee/tee_shm.c:88:2: error: unknown field 'kmap' specified in initializer
>   .kmap = tee_shm_op_kmap,
>   ^
> drivers/tee/tee_shm.c:88:10: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>   .kmap = tee_shm_op_kmap,
>           ^
> drivers/tee/tee_shm.c:88:10: note: (near initialization for 'tee_shm_dma_buf_ops.end_cpu_access')
> 
> Caused by commit
> 
>   f9b67f0014cb ("dma-buf: Rename dma-ops to prevent conflict with kunmap_atomic macro")
> 
> interacting with commit
> 
>   967c9cca2cc5 ("tee: generic TEE subsystem")
> 
> from the arm-soc tree.
> 
> I applied the following merge fix patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 21 Apr 2017 12:06:32 +1000
> Subject: [PATCH] tee: merge fix for dma-ops field name changes
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/tee/tee_shm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index 0be1e3e93bee..4e14c9c9cb1c 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -84,8 +84,8 @@ static struct dma_buf_ops tee_shm_dma_buf_ops = {
>  	.map_dma_buf = tee_shm_op_map_dma_buf,
>  	.unmap_dma_buf = tee_shm_op_unmap_dma_buf,
>  	.release = tee_shm_op_release,
> -	.kmap_atomic = tee_shm_op_kmap_atomic,
> -	.kmap = tee_shm_op_kmap,
> +	.map_atomic = tee_shm_op_kmap_atomic,
> +	.map = tee_shm_op_kmap,
>  	.mmap = tee_shm_op_mmap,
>  };
>  
> -- 
> 2.11.0

This merge fix is now needed when I merge the drm tree (as Dave merged
the drm-misc tree).
-- 
Cheers,
Stephen Rothwell
