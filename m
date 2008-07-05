From: "Zhang, Xiantao" <xiantao.zhang@intel.com>
Subject: RE: [PATCH next-20080704] fix build error of arch/ia64/kvm/*
Date: Sat, 5 Jul 2008 17:43:09 +0800
Message-ID: <42DFA526FC41B1429CE7279EF83C6BDC015702DB@pdsmsx415.ccr.corp.intel.com>
References: <s5hskupltbz.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:35459 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751246AbYGEJnO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 5 Jul 2008 05:43:14 -0400
Content-class: urn:content-classes:message
In-Reply-To: <s5hskupltbz.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Acked-by Xiantao Zhang <xiantao.zhang@intel.com>

Takashi Iwai wrote:
> Fix calls of smp_call_function*() in arch/ia64/kvm for recent API
> changes.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> 
> ---
> diff --git a/arch/ia64/kvm/kvm-ia64.c b/arch/ia64/kvm/kvm-ia64.c
> index a4cf4a2..9408b30 100644
> --- a/arch/ia64/kvm/kvm-ia64.c
> +++ b/arch/ia64/kvm/kvm-ia64.c
> @@ -398,7 +398,7 @@ static int handle_global_purge(struct kvm_vcpu
>  		*vcpu, struct kvm_run *kvm_run) if (kvm->vcpus[i]->cpu
!= -1) {
>  			call_data.vcpu = kvm->vcpus[i];
>  			smp_call_function_single(kvm->vcpus[i]->cpu,
> -					vcpu_global_purge, &call_data,
0, 1);
> +					vcpu_global_purge, &call_data,
1);
>  		} else
>  			printk(KERN_WARNING"kvm: Uninit vcpu received
ipi!\n");
> 
> @@ -1688,7 +1688,7 @@ void kvm_vcpu_kick(struct kvm_vcpu *vcpu)
>  		wake_up_interruptible(&vcpu->wq);
> 
>  	if (vcpu->guest_mode)
> -		smp_call_function_single(ipi_pcpu, vcpu_kick_intr, vcpu,
0, 0);
> +		smp_call_function_single(ipi_pcpu, vcpu_kick_intr, vcpu,
0);
>  }
> 
>  int kvm_apic_set_irq(struct kvm_vcpu *vcpu, u8 vec, u8 trig)
> diff --git a/arch/ia64/kvm/kvm_fw.c b/arch/ia64/kvm/kvm_fw.c
> index 091f936..0c69d9e 100644
> --- a/arch/ia64/kvm/kvm_fw.c
> +++ b/arch/ia64/kvm/kvm_fw.c
> @@ -130,7 +130,7 @@ static struct ia64_pal_retval
>  	pal_cache_flush(struct kvm_vcpu *vcpu) args.cache_type = gr29;
>  	args.operation = gr30;
>  	smp_call_function(remote_pal_cache_flush,
> -				(void *)&args, 1, 1);
> +				(void *)&args, 1);
>  	if (args.status != 0)
>  		printk(KERN_ERR"pal_cache_flush error!,"
>  				"status:0x%lx\n", args.status);
