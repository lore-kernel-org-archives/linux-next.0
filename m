From: Andrea Arcangeli <aarcange@redhat.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 25 May 2015 16:03:15 +0200
Message-ID: <20150525140315.GA26958@redhat.com>
References: <20150525211801.679d9015@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:48399 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750908AbbEYODW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 May 2015 10:03:22 -0400
Content-Disposition: inline
In-Reply-To: <20150525211801.679d9015@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,

On Mon, May 25, 2015 at 09:18:01PM +1000, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> __NR_syscalls (364) is not one more than the last syscall (364)
> 
> Caused by commit d7766613717b ("userfaultfd: activate syscall").  (BTW,
> I notice that this patch was not cc'd to any ppc maintainers :-()
> 
> I have added this fix patch for today:

So another option is to just drop the arch/powerpc part of the patch
from -mm. It's up to you, there's no arch dependent code in the
syscall though and the config option is not specific to x86 either. I
enabled the syscall on powerpc in my tree to facilitate the testing so
the patchset included that change to arch/powerpc, but it would be ok
to enable the syscall only later upstream, after it has been tested.

Thanks,
Andrea

> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 25 May 2015 21:13:40 +1000
> Subject: [PATCH] userfaultfd: activate syscall fix
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/powerpc/include/asm/unistd.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/unistd.h b/arch/powerpc/include/asm/unistd.h
> index f4f8b667d75b..4a055b6c2a64 100644
> --- a/arch/powerpc/include/asm/unistd.h
> +++ b/arch/powerpc/include/asm/unistd.h
> @@ -12,7 +12,7 @@
>  #include <uapi/asm/unistd.h>
>  
>  
> -#define __NR_syscalls		364
> +#define __NR_syscalls		365
>  
>  #define __NR__exit __NR_exit
>  #define NR_syscalls	__NR_syscalls
> -- 
> 2.1.4
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
