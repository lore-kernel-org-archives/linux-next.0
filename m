From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Mon, 18 Jul 2016 10:27:13 -0400
Message-ID: <20160718142713.GB21225@windriver.com>
References: <20160718182922.7b41f923@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:33371 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751931AbcGRO2O (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 18 Jul 2016 10:28:14 -0400
Content-Disposition: inline
In-Reply-To: <20160718182922.7b41f923@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

[linux-next: build failure after merge of the tip tree] On 18/07/2016 (Mon 18:29) Stephen Rothwell wrote:

> Hi all,
> 
> After merging the tip tree, today's linux-next build (x86_64 allnoconfig)
> failed like this:
> 
> In file included from arch/x86/kernel/x8664_ksyms_64.c:10:0:
> arch/x86/include/asm/pgtable.h:38:8: error: unknown type name 'spinlock_t'
>  extern spinlock_t pgd_lock;

>         ^
> 
> Probably caused by commit
> 
>   186f43608a5c ("x86/kernel: Audit and remove any unnecessary uses of module.h")

Wondering why I didn't see this, when I _thought_ I did the same
coverage, I learned an interesting thing.  I'd been doing 

make ARCH=i386 allnoconfig
make allnoconfig

...figuring on x86_64 host that I'd need to explicitly choose i386 and
that w/o an ARCH specified, I'd get the native arch...  Not so.  I just
end up doing the i386 arch coverage twice.  :-(   I'll go out on a limb
here and guess I'm not the only person to fall into that trap.

I'll now be using:

make ARCH=i386 allnoconfig
make ARCH=x86_64 allnoconfig

Thanks Stephen for the fix and for helping find this gap in my tests.
If my build coverage moves to Power like yours, I'll still be good. :)

Paul.
--

> 
> I added this patch for today (maybe adding the include to
> arch/x86/include/asm/pgtable.h would be better?):
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 18 Jul 2016 18:23:24 +1000
> Subject: [PATCH] x86/kernel: include spinlock_types.h for missing spinlock_t
> 
> Fixes: 186f43608a5c ("x86/kernel: Audit and remove any unnecessary uses of module.h")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/x86/kernel/x8664_ksyms_64.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/kernel/x8664_ksyms_64.c b/arch/x86/kernel/x8664_ksyms_64.c
> index f6d30fedcc03..95e49f6e4fc3 100644
> --- a/arch/x86/kernel/x8664_ksyms_64.c
> +++ b/arch/x86/kernel/x8664_ksyms_64.c
> @@ -2,6 +2,7 @@
>     All C exports should go in the respective C files. */
>  
>  #include <linux/export.h>
> +#include <linux/spinlock_types.h>
>  #include <linux/smp.h>
>  
>  #include <net/checksum.h>
> -- 
> 2.8.1
> 
> -- 
> Cheers,
> Stephen Rothwell
