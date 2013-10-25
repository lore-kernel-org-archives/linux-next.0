From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: linux-next: manual merge of the kvm-arm tree
Date: Fri, 25 Oct 2013 14:07:41 +0100
Message-ID: <526A6D1D.8080504@arm.com>
References: <1382632289-18523-1-git-send-email-treding@nvidia.com> <1382706224-8859-1-git-send-email-treding@nvidia.com> <1382706224-8859-5-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1382706224-8859-5-git-send-email-treding@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Austin <Jonathan.Austin@arm.com>, Christoffer Dall <cdall@cs.columbia.edu>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 25/10/13 14:03, Thierry Reding wrote:
> Today's linux-next merge of the kvm-arm tree got a conflict in
> 
> 	arch/arm/kvm/reset.c
> 
> caused by commits e8c2d99 (KVM: ARM: Add support for Cortex-A7) and 7999b4d
> (ARM: KVM: drop limitation to 4 CPU VMs).
> 
> I fixed it up (see below). Please verify that the resolution looks good.

Looks good. Thanks Thierry.

	M.

> Thanks,
> Thierry
> ---
> diff --cc arch/arm/kvm/reset.c
> index d153e64,2c5add0..f558c07
> --- a/arch/arm/kvm/reset.c
> +++ b/arch/arm/kvm/reset.c
> @@@ -64,9 -62,7 +62,7 @@@ int kvm_reset_vcpu(struct kvm_vcpu *vcp
>   	switch (vcpu->arch.target) {
>   	case KVM_ARM_TARGET_CORTEX_A7:
>   	case KVM_ARM_TARGET_CORTEX_A15:
> - 		if (vcpu->vcpu_id > cortexa_max_cpu_idx)
> - 			return -EINVAL;
>  -		cpu_reset = &cortexa_regs_reset;
>  +		reset_regs = &cortexa_regs_reset;
>   		vcpu->arch.midr = read_cpuid_id();
>   		cpu_vtimer_irq = &cortexa_vtimer_irq;
>   		break;
> 


-- 
Jazz is not dead. It just smells funny...
