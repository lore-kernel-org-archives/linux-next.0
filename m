From: Gleb Natapov <gleb@redhat.com>
Subject: Re: linux-next: manual merge of the kvm tree with the tip tree
Date: Wed, 16 May 2012 10:53:19 +0300
Message-ID: <20120516075319.GO32036@redhat.com>
References: <20120516171435.3b0a9c8a531081ff290763aa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:31336 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965132Ab2EPHxr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 May 2012 03:53:47 -0400
Content-Disposition: inline
In-Reply-To: <20120516171435.3b0a9c8a531081ff290763aa@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Avi Kivity <avi@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>

On Wed, May 16, 2012 at 05:14:35PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kvm tree got a conflict in
> arch/x86/include/asm/kvm_para.h between commit c3709e6734da ("x86, kvm:
> KVM paravirt kernels don't check for CPUID being unavailable") from the
> tip tree and commit 9b72d3b07dd9 ("KVM guest: make kvm_para_available()
> check hypervisor bit reading cpuid leaf") from the kvm tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.
Fix looks good to me.

> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc arch/x86/include/asm/kvm_para.h
> index 183922e,a7a7a94..0000000
> --- a/arch/x86/include/asm/kvm_para.h
> +++ b/arch/x86/include/asm/kvm_para.h
> @@@ -170,17 -178,16 +178,19 @@@ static inline int kvm_para_available(vo
>   	unsigned int eax, ebx, ecx, edx;
>   	char signature[13];
>   
>  +	if (boot_cpu_data.cpuid_level < 0)
>  +		return 0;	/* So we don't blow up on old processors */
>  +
> - 	cpuid(KVM_CPUID_SIGNATURE, &eax, &ebx, &ecx, &edx);
> - 	memcpy(signature + 0, &ebx, 4);
> - 	memcpy(signature + 4, &ecx, 4);
> - 	memcpy(signature + 8, &edx, 4);
> - 	signature[12] = 0;
> + 	if (cpu_has_hypervisor) {
> + 		cpuid(KVM_CPUID_SIGNATURE, &eax, &ebx, &ecx, &edx);
> + 		memcpy(signature + 0, &ebx, 4);
> + 		memcpy(signature + 4, &ecx, 4);
> + 		memcpy(signature + 8, &edx, 4);
> + 		signature[12] = 0;
>   
> - 	if (strcmp(signature, "KVMKVMKVM") == 0)
> - 		return 1;
> + 		if (strcmp(signature, "KVMKVMKVM") == 0)
> + 			return 1;
> + 	}
>   
>   	return 0;
>   }



--
			Gleb.
