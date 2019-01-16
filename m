From: Ming Lei <ming.lei@redhat.com>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Wed, 16 Jan 2019 10:48:33 +0800
Message-ID: <20190116024832.GA26146@ming.t460p>
References: <20190116133552.37436b9c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190116133552.37436b9c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, Anna Schumaker <Anna.Schumaker@Netapp.com>, Trond Myklebust <trondmy@gmail.com>, NFS Mailing List <linux-nfs@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Jan 16, 2019 at 01:35:52PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> net/sunrpc/xprtsock.c: In function 'xs_flush_bvec':
> net/sunrpc/xprtsock.c:390:2: error: implicit declaration of function 'for_each_bvec'; did you mean 'for_each_net'? [-Werror=implicit-function-declaration]
>   for_each_bvec(bv, bvec, bi, bi)
>   ^~~~~~~~~~~~~
>   for_each_net
> net/sunrpc/xprtsock.c:390:33: error: expected ';' before 'flush_dcache_page'
>   for_each_bvec(bv, bvec, bi, bi)
>                                  ^
>                                  ;
>    flush_dcache_page(bv.bv_page);
>    ~~~~~~~~~~~~~~~~~              
> 
> Caused by commit
> 
>   f3effe4c1240 ("block: rename bvec helpers")
> 
> interacting with commit
> 
>   6a829eb8619f ("SUNRPC: Fix TCP receive code on archs with flush_dcache_page()")
> 
> from the nfs-anna tree.
> 
> [I love API changes :-(]
> 
> I have applied the following merge fix patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 16 Jan 2019 13:32:59 +1100
> Subject: [PATCH] SUNRPC: merge fix for "block: rename bvec helpers"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  net/sunrpc/xprtsock.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
> index 7754aa3e434f..47f29cc23f27 100644
> --- a/net/sunrpc/xprtsock.c
> +++ b/net/sunrpc/xprtsock.c
> @@ -387,7 +387,7 @@ xs_flush_bvec(const struct bio_vec *bvec, size_t count, size_t seek)
>  	struct bio_vec bv;
>  
>  	bvec_iter_advance(bvec, &bi, seek & PAGE_MASK);
> -	for_each_bvec(bv, bvec, bi, bi)
> +	for_each_segment(bv, bvec, bi, bi)
>  		flush_dcache_page(bv.bv_page);
>  }
>  #else

This fix is correct, thanks!

Thanks,
Ming
