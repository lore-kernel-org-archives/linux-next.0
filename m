From: Michal Hocko <mhocko@kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Mon, 20 Mar 2017 09:07:54 -0400
Message-ID: <20170320130753.GA30053@dhcp22.suse.cz>
References: <20170320163735.332e64b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170320163735.332e64b7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jaegeuk Kim <jaegeuk@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chao Yu <yuchao0@huawei.com>
List-Id: linux-next.vger.kernel.org

On Mon 20-03-17 16:37:35, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> fs/f2fs/node.c: In function 'init_free_nid_cache':
> fs/f2fs/node.c:2634:25: error: implicit declaration of function 'f2fs_kvzalloc' [-Werror=implicit-function-declaration]
>   nm_i->free_nid_count = f2fs_kvzalloc(nm_i->nat_blocks *
>                          ^
> fs/f2fs/node.c:2634:23: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
>   nm_i->free_nid_count = f2fs_kvzalloc(nm_i->nat_blocks *
>                        ^
> 
> Caused by commit
> 
>   69e5e80117a3 ("mm: introduce kv[mz]alloc helpers")
> 
> interacting with commit
> 
>   c48b15867a2f ("f2fs: skip scanning free nid bitmap of full NAT blocks")
> 
> from the f2fs tree.
> 
> I applied the following fix patch:

yes this is correct. Thanks!

> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 20 Mar 2017 16:28:21 +1100
> Subject: [PATCH] mm: introduce kv[mz]alloc helpers - f2fs fix up
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/f2fs/node.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index cdbb05745895..0ea1dca8a0e2 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -2631,7 +2631,7 @@ static int init_free_nid_cache(struct f2fs_sb_info *sbi)
>  	if (!nm_i->nat_block_bitmap)
>  		return -ENOMEM;
>  
> -	nm_i->free_nid_count = f2fs_kvzalloc(nm_i->nat_blocks *
> +	nm_i->free_nid_count = kvzalloc(nm_i->nat_blocks *
>  					sizeof(unsigned short), GFP_KERNEL);
>  	if (!nm_i->free_nid_count)
>  		return -ENOMEM;
> -- 
> 2.11.0
> 
> -- 
> Cheers,
> Stephen Rothwell

-- 
Michal Hocko
SUSE Labs
