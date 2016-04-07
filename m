From: Hugh Dickins <hughd@google.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 6 Apr 2016 22:24:34 -0700 (PDT)
Message-ID: <alpine.LSU.2.11.1604062217430.3717@eggly.anvils>
References: <20160407151201.0afc790f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f177.google.com ([209.85.192.177]:36105 "EHLO
	mail-pf0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751559AbcDGFYp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Apr 2016 01:24:45 -0400
Received: by mail-pf0-f177.google.com with SMTP id e128so48442316pfe.3
        for <linux-next@vger.kernel.org>; Wed, 06 Apr 2016 22:24:44 -0700 (PDT)
In-Reply-To: <20160407151201.0afc790f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hugh Dickins <hughd@google.com>

On Thu, 7 Apr 2016, Stephen Rothwell wrote:

> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> In file included from include/linux/linkage.h:4:0,
>                  from include/linux/fs.h:4,
>                  from mm/shmem.c:24:
> In function 'shmem_disband_hugeteam',
>     inlined from 'shmem_getpage_gfp' at mm/shmem.c:3075:3:
> include/linux/compiler.h:510:38: error: call to '__compiletime_assert_1747' declared with attribute error: BUILD_BUG failed
>   _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
>                                       ^
> include/linux/compiler.h:493:4: note: in definition of macro '__compiletime_assert'
>     prefix ## suffix();    \
>     ^
> include/linux/compiler.h:510:2: note: in expansion of macro '_compiletime_assert'
>   _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
>   ^
> include/linux/bug.h:51:37: note: in expansion of macro 'compiletime_assert'
>  #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                      ^
> include/linux/bug.h:85:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>  #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
>                      ^
> mm/shmem.c:1747:2: note: in expansion of macro 'BUILD_BUG'
>   BUILD_BUG();
>   ^
> 
> Caused by commit
> 
>   ab61a0a665d8 ("huge tmpfs: try to allocate huge pages, split into a team")
> 
> I added the following (hacky, but builds for my compiler at least)
> patch for today:

Sorry about that, thanks a lot Stephen, your patch will do fine (though
what I'll do is simply delete that BUILD_BUG(), which isn't really
serving any useful purpose).  It certainly has been compiled before
on arm and without CONFIG_TRANSPARENT_HUGEPAGE, but I guess different
compiler versions make different optimizations, so I never noticed I
was unwittingly relying on too sophisticated an optimization there.

Hugh

> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 7 Apr 2016 14:57:45 +1000
> Subject: [PATCH] huge tmpfs: fix build problem on arm
> 
> allocated_huge will never be non-NULL if CONFIG_TRANSPARENT_HUGEPAGE is not.
> 
> Fixes: ab61a0a665d8 ("huge tmpfs: try to allocate huge pages, split into a team")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  mm/shmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 5b9fecc9ce72..f2307d9630aa 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -3071,7 +3071,7 @@ unlock:
>  		unlock_page(page);
>  		put_page(page);
>  	}
> -	if (alloced_huge) {
> +	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && alloced_huge) {
>  		shmem_disband_hugeteam(alloced_huge);
>  		alloced_huge = NULL;
>  	}
> -- 
