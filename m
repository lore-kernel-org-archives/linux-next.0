From: Marcelo Tosatti <mtosatti@redhat.com>
Subject: Re: linux-next: manual merge of the kvm tree with Linus' tree
Date: Wed, 27 Jan 2010 14:38:50 -0200
Message-ID: <20100127163850.GB3921@amt.cnet>
References: <20100127125730.6fb414ec.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:37001 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755279Ab0A0QjR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Jan 2010 11:39:17 -0500
Content-Disposition: inline
In-Reply-To: <20100127125730.6fb414ec.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Avi Kivity <avi@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Yongjun <yjwei@cn.fujitsu.com>

On Wed, Jan 27, 2010 at 12:57:30PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kvm tree got a conflict in
> arch/x86/kvm/x86.c between commit
> 36cb93fd6b6bf7e9163a69a8bf20207aed5fea44 ("KVM: x86: Fix probable memory
> leak of vcpu->arch.mce_banks") from Linus' tree and commit
> kvm_arch_vcpu_uninit ("KVM: switch vcpu context to use SRCU") from the
> kvm tree.
> 
> I fixed it up (I think ... see below) and can carry the fix for a while.

Stephen,

The merge below is correct. Its also present in commit

d3b54d01b94f6825717ef1d02afc7c295bcce89e

of kvm.git.

> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc arch/x86/kvm/x86.c
> index 1ddcad4,a311751..0000000
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@@ -5089,11 -5468,12 +5469,13 @@@ fail
>   
>   void kvm_arch_vcpu_uninit(struct kvm_vcpu *vcpu)
>   {
> + 	int idx;
> + 
>  +	kfree(vcpu->arch.mce_banks);
>   	kvm_free_lapic(vcpu);
> - 	down_read(&vcpu->kvm->slots_lock);
> + 	idx = srcu_read_lock(&vcpu->kvm->srcu);
>   	kvm_mmu_destroy(vcpu);
> - 	up_read(&vcpu->kvm->slots_lock);
> + 	srcu_read_unlock(&vcpu->kvm->srcu, idx);
>   	free_page((unsigned long)vcpu->arch.pio_data);
>   }
>   
