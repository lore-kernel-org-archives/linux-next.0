From: Will Deacon <will.deacon@arm.com>
Subject: Re: linux-next: manual merge of the arm64 tree with Linus' tree
Date: Fri, 29 Apr 2016 09:49:29 +0100
Message-ID: <20160429084928.GB32074@arm.com>
References: <20160429095958.007976da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:49330 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751834AbcD2Ita (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Apr 2016 04:49:30 -0400
Content-Disposition: inline
In-Reply-To: <20160429095958.007976da@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>, Christoffer Dall <christoffer.dall@linaro.org>, AKASHI Takahiro <takahiro.akashi@linaro.org>, james.morse@arm.com

On Fri, Apr 29, 2016 at 09:59:58AM +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the arm64 tree got a conflict in:
> 
>   arch/arm/kvm/arm.c
> 
> between commit:
> 
>   06a71a24bae5 ("arm64: KVM: unregister notifiers in hyp mode teardown path")
> 
> from Linus' tree and commit:
> 
>   67f691976662 ("arm64: kvm: allows kvm cpu hotplug")
> 
> from the arm64 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc arch/arm/kvm/arm.c
> index dded1b763c16,1687e1450c3a..000000000000
> --- a/arch/arm/kvm/arm.c
> +++ b/arch/arm/kvm/arm.c
> @@@ -1198,8 -1226,6 +1233,7 @@@ static void teardown_hyp_mode(void
>   	free_hyp_pgds();
>   	for_each_possible_cpu(cpu)
>   		free_page(per_cpu(kvm_arm_hyp_stack_page, cpu));
> - 	unregister_cpu_notifier(&hyp_init_cpu_nb);
>  +	hyp_cpu_pm_exit();
>   }
>   
>   static int init_vhe_mode(void)

Thanks Stephen, this looks good to me.

Will
