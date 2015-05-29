From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: build failure after merge of the kvm tree
Date: Fri, 29 May 2015 09:54:08 +0200
Message-ID: <20150529075408.GA26168@gmail.com>
References: <20150529173648.61bf6592@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:37678 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751933AbbE2HyQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 May 2015 03:54:16 -0400
Content-Disposition: inline
In-Reply-To: <20150529173648.61bf6592@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the kvm tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> arch/x86/kvm/cpuid.c: In function 'kvm_update_cpuid':
> arch/x86/kvm/cpuid.c:98:2: error: implicit declaration of function 'use_eager_fpu' [-Werror=implicit-function-declaration]
>   vcpu->arch.eager_fpu = use_eager_fpu() || guest_cpuid_has_mpx(vcpu);
>   ^
> 
> Caused by a bad automatic merge resolution which didn't add the
> includes of one of its parents.
> 
> I added the following merge fix patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 29 May 2015 17:24:42 +1000
> Subject: [PATCH] kvm: bad merge fix patch for arch/x86/kvm/cpuid.c
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/x86/kvm/cpuid.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
> index e243f2ed54c0..8285bc73a5a2 100644
> --- a/arch/x86/kvm/cpuid.c
> +++ b/arch/x86/kvm/cpuid.c
> @@ -16,6 +16,8 @@
>  #include <linux/module.h>
>  #include <linux/vmalloc.h>
>  #include <linux/uaccess.h>
> +#include <asm/fpu/api.h> /* For use_eager_fpu.  Ugh! */
> +#include <asm/fpu/internal.h> /* For use_eager_fpu.  Ugh! */

The comments are incorrect, otherwise the resolution is OK.

Thanks,

	Ingo
