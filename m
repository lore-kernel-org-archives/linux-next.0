From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [patch] x86, kvm: fix build failure with CONFIG_SMP disabled
Date: Wed, 17 Apr 2013 17:02:07 -0700
Message-ID: <516F37FF.8040703@infradead.org>
References: <20130417170450.5dd6e5f450de4d5bf197d997@canb.auug.org.au> <516EE5AB.4080201@infradead.org> <alpine.DEB.2.02.1304171555030.10112@chino.kir.corp.google.com> <alpine.DEB.2.02.1304171609580.5541@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1304171609580.5541@chino.kir.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Rientjes <rientjes@google.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, x86@kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, KVM <kvm@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 04/17/13 16:12, David Rientjes wrote:
> The build fails when CONFIG_SMP is disabled:
> 
> 	arch/x86/kvm/vmx.c: In function 'vmx_deliver_posted_interrupt':
> 	arch/x86/kvm/vmx.c:3950:3: error: 'apic' undeclared (first use in this function)
> 
> Fix it by including the necessary header.

Sorry, i386 build still fails with the same error message plus this one:

ERROR: "apic" [arch/x86/kvm/kvm-intel.ko] undefined!


> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: David Rientjes <rientjes@google.com>
> ---
>  arch/x86/kvm/vmx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/kvm/vmx.c b/arch/x86/kvm/vmx.c
> --- a/arch/x86/kvm/vmx.c
> +++ b/arch/x86/kvm/vmx.c
> @@ -34,6 +34,7 @@
>  #include "kvm_cache_regs.h"
>  #include "x86.h"
>  
> +#include <asm/apic.h>
>  #include <asm/io.h>
>  #include <asm/desc.h>
>  #include <asm/vmx.h>
> --


-- 
~Randy
