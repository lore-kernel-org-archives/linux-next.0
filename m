From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Fri, 13 May 2016 10:36:59 +0200
Message-ID: <20160513083659.GD12132@kroah.com>
References: <20160513131538.7094341d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160513131538.7094341d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Leon Romanovsky <leon@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Eremin <dmitry.eremin@intel.com>, Li Dongyang <dongyang.li@anu.edu.au>, James Simmons <jsimmons@infradead.org>, Christoph Hellwig <hch@lst.de>, Bart Van Assche <bart.vanassche@sandisk.com>
List-Id: linux-next.vger.kernel.org

On Fri, May 13, 2016 at 01:15:38PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:1706:9: 
> error: too few arguments to function 'ib_map_mr_sg'
>      n = ib_map_mr_sg(mr, tx->tx_frags,
>          ^
> In file included from /home/sfr/next/next/include/rdma/ib_addr.h:47:0,
>                  from /home/sfr/next/next/include/rdma/rdma_cm.h:39,
>                  from /home/sfr/next/next/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h:63,
>                  from /home/sfr/next/next/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:43:
> /home/sfr/next/next/include/rdma/ib_verbs.h:3147:5: note: declared here
>  int ib_map_mr_sg(struct ib_mr *mr, struct scatterlist *sg, int sg_nents,
>      ^
> 
> Caused by commit
> 
>   80e05b34f882 ("staging: lustre: o2iblnd: Add Fast Reg memory registration support")
> 
> interacting with commits
> 
>   aa42d65b5e20 ("IB/core: allow passing mapping an offset into the SG in ib_map_mr_sg")
>   f0cf99be3251 ("IB/core: Enhance ib_map_mr_sg()")
> 
> from the rdma-leon-test tree.
> 
> I added the following merge fix patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 13 May 2016 13:10:47 +1000
> Subject: [PATCH] staging: lustre: o2iblnd: fix for ib_map_mr_sg() API changes
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
> index d99b4fac0c39..6c59f2ff2220 100644
> --- a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
> +++ b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
> @@ -1704,7 +1704,7 @@ int kiblnd_fmr_pool_map(kib_fmr_poolset_t *fps, kib_tx_t *tx,
>  				}
>  
>  				n = ib_map_mr_sg(mr, tx->tx_frags,
> -						 tx->tx_nfrags, PAGE_SIZE);
> +						 tx->tx_nfrags, NULL, PAGE_SIZE);
>  				if (unlikely(n != tx->tx_nfrags)) {
>  					CERROR("Failed to map mr %d/%d elements\n",
>  					       n, tx->tx_nfrags);

Looks good, thanks for the fix.

greg k-h
