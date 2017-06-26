From: Michal Hocko <mhocko@kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Mon, 26 Jun 2017 09:13:46 +0200
Message-ID: <20170626071346.GA11534@dhcp22.suse.cz>
References: <20170626165343.46285c95@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:37998 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751252AbdFZHNu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Jun 2017 03:13:50 -0400
Content-Disposition: inline
In-Reply-To: <20170626165343.46285c95@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Miller <davem@davemloft.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jag Raman <jag.raman@oracle.com>

On Mon 26-06-17 16:53:43, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm tree, today's linux-next build (sparc64 defconfig)
> failed like this:
> 
> arch/sparc/kernel/mdesc.c: In function 'mdesc_kmalloc':
> arch/sparc/kernel/mdesc.c:208:48: error: '__GFP_REPEAT' undeclared (first use in this function)
>   base = kmalloc(handle_size + 15, GFP_KERNEL | __GFP_REPEAT);
>                                                 ^
> 
> Caused by commit
> 
>   726ad49b664b ("mm, tree wide: replace __GFP_REPEAT by __GFP_RETRY_MAYFAIL with more useful semantic")
> 
> interacting with commit
> 
>   0ab2fcd69dbf ("sparc64: mdesc: use __GFP_REPEAT action modifier for VM allocation")
> 
> from the sparc-next tree.
> 
> For now I have applied the following (I expect it to be replaced with
> something better):

You simply want s@__GFP_REPEAT@__GFP_RETRY_MAYFAIL@

> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 26 Jun 2017 16:47:46 +1000
> Subject: [PATCH] paper over the removal of __GFP_REPEAT for now
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/sparc/kernel/mdesc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/sparc/kernel/mdesc.c b/arch/sparc/kernel/mdesc.c
> index e4b4e790bf89..c9ecd5abf5bf 100644
> --- a/arch/sparc/kernel/mdesc.c
> +++ b/arch/sparc/kernel/mdesc.c
> @@ -205,7 +205,7 @@ static struct mdesc_handle *mdesc_kmalloc(unsigned int mdesc_size)
>  	handle_size = (sizeof(struct mdesc_handle) -
>  		       sizeof(struct mdesc_hdr) +
>  		       mdesc_size);
> -	base = kmalloc(handle_size + 15, GFP_KERNEL | __GFP_REPEAT);
> +	base = kmalloc(handle_size + 15, GFP_KERNEL /* | __GFP_REPEAT */);
>  	if (!base)
>  		return NULL;
>  
> -- 
> 2.11.0
> 
> -- 
> Cheers,
> Stephen Rothwell

-- 
Michal Hocko
SUSE Labs
