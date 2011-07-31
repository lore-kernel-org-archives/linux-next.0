From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: build failure after merge of the moduleh tree
Date: Sun, 31 Jul 2011 00:45:41 -0400
Message-ID: <20110731044541.GA31842@windriver.com>
References: <20110729151035.f8b69d6fa6aadffb7999abfa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110729151035.f8b69d6fa6aadffb7999abfa@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Xiao Guangrong <xiaoguangrong@cn.fujitsu.com>
List-Id: linux-next.vger.kernel.org

[linux-next: build failure after merge of the moduleh tree] On 29/07/2011 (Fri 15:10) Stephen Rothwell wrote:

[...]

> I have added this commit for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 29 Jul 2011 15:03:54 +1000
> Subject: [PATCH] Partial revert of commit d03b684f1773

I've just fixed the original rather than introduce a revert,
since I'm moving ahead to the latest in order to at least
catch some of these new drivers that showed up in linux-next.

Thanks,
Paul.

> 
> "kernel: Map most files to use export.h instead of module.h"
> 
> This file need module.h
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  kernel/jump_label.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/kernel/jump_label.c b/kernel/jump_label.c
> index d636f85..a8ce450 100644
> --- a/kernel/jump_label.c
> +++ b/kernel/jump_label.c
> @@ -7,7 +7,7 @@
>   */
>  #include <linux/memory.h>
>  #include <linux/uaccess.h>
> -#include <linux/export.h>
> +#include <linux/module.h>
>  #include <linux/list.h>
>  #include <linux/slab.h>
>  #include <linux/sort.h>
> -- 
> 1.7.5.4
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
