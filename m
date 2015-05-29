From: Will Deacon <will.deacon@arm.com>
Subject: Re: linux-next: manual merge of the arm-perf tree with Linus' and
 teh arm-current trees
Date: Fri, 29 May 2015 11:21:54 +0100
Message-ID: <20150529102154.GC6528@arm.com>
References: <20150529111432.397105d2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:57250 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755547AbbE2KV5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 May 2015 06:21:57 -0400
Content-Disposition: inline
In-Reply-To: <20150529111432.397105d2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <Mark.Rutland@arm.com>

On Fri, May 29, 2015 at 02:14:32AM +0100, Stephen Rothwell wrote:
> Today's linux-next merge of the arm-perf tree got a conflict in
> arch/arm/kernel/perf_event_cpu.c between commit 338d9dd3e2ae ("ARM:
> 8351/1: perf: don't warn about missing interrupt-affinity property for
> PPIs") from Linus' tree and 8d2812849acb ("ARM: 8357/1: perf: fix
> memory leak when probing PMU PPIs") from the arm-current tree and
> commit 64d0d3943e14 ("arm: perf: make of_pmu_irq_cfg take arm_pmu")
> from the arm-perf tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks Stephen, looks good to me. I've got some more patches queued which
will actually mean we just remove this file altogether, but this is fine
for now.

Will

> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc arch/arm/kernel/perf_event_cpu.c
> index 3b8c2833c537,50f245bf4e05..000000000000
> --- a/arch/arm/kernel/perf_event_cpu.c
> +++ b/arch/arm/kernel/perf_event_cpu.c
> @@@ -301,17 -306,12 +306,18 @@@ static int probe_current_pmu(struct arm
>   	return ret;
>   }
>   
> - static int of_pmu_irq_cfg(struct platform_device *pdev)
> + static int of_pmu_irq_cfg(struct arm_pmu *pmu)
>   {
>  -	int i;
>  +	int i, irq;
> + 	struct platform_device *pdev = pmu->plat_device;
>  -	int *irqs = kcalloc(pdev->num_resources, sizeof(*irqs), GFP_KERNEL);
>  +	int *irqs;
>   
>  +	/* Don't bother with PPIs; they're already affine */
>  +	irq = platform_get_irq(pdev, 0);
>  +	if (irq >= 0 && irq_is_percpu(irq))
>  +		return 0;
>  +
>  +	irqs = kcalloc(pdev->num_resources, sizeof(*irqs), GFP_KERNEL);
>   	if (!irqs)
>   		return -ENOMEM;
>   
