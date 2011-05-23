From: Cyrill Gorcunov <gorcunov@gmail.com>
Subject: Re: [PATCH -next] x86: apic_flat_64.c needs module.h
Date: Mon, 23 May 2011 21:51:39 +0400
Message-ID: <4DDA9EAB.40304@gmail.com>
References: <20110523154518.5e27cfb0.sfr@canb.auug.org.au> <20110523104300.dd532a99.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110523104300.dd532a99.randy.dunlap@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, x86@kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Suresh Siddha <suresh.b.siddha@intel.com>
List-Id: linux-next.vger.kernel.org

On 05/23/2011 09:43 PM, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> apic_flat_64.c needs to include module.h to fix these warnings:
> 
> arch/x86/kernel/apic/apic_flat_64.c:31: warning: data definition has no type or storage class
> arch/x86/kernel/apic/apic_flat_64.c:31: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL'
> arch/x86/kernel/apic/apic_flat_64.c:31: warning: parameter names (without types) in function declaration
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> ---
>  arch/x86/kernel/apic/apic_flat_64.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-next-20110523.orig/arch/x86/kernel/apic/apic_flat_64.c
> +++ linux-next-20110523/arch/x86/kernel/apic/apic_flat_64.c
> @@ -16,6 +16,7 @@
>  #include <linux/ctype.h>
>  #include <linux/init.h>
>  #include <linux/hardirq.h>
> +#include <linux/module.h>
>  #include <asm/smp.h>
>  #include <asm/apic.h>
>  #include <asm/ipi.h>

Thanks Randy! For some reason I didn't hit this problem while
were compiling the kernel and testing it (I usually do not use
modules though).

I've CC'ed Ingo and Suresh.

-- 
    Cyrill
