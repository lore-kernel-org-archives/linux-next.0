From: Alexander van Heukelum <heukelum@mailshack.com>
Subject: Re: linux-next: manual merge of the perfmon3 tree
Date: Tue, 25 Nov 2008 11:39:51 +0100
Message-ID: <20081125103951.GA18992@mailshack.com>
References: <20081125210319.35b2d189.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from theia.rz.uni-saarland.de ([134.96.7.31]:13217 "EHLO
	theia.rz.uni-saarland.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753230AbYKYLpI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Nov 2008 06:45:08 -0500
Content-Disposition: inline
In-Reply-To: <20081125210319.35b2d189.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: stephane eranian <eranian@googlemail.com>, linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>

On Tue, Nov 25, 2008 at 09:03:19PM +1100, Stephen Rothwell wrote:
> Hi Stephane,
> 
> Today's linux-next merge of the perfmon3 tree got a conflict in
> arch/x86/kernel/entry_64.S between commit
> 322648d1ba75280d62f114d47048beb0b35f5047 ("x86: include ENTRY/END in
> entry handlers in entry_64.S") from the x86 tree and commit
> 3511a04973eaac18ee386f0db8c109e589019511 ("perfmon: x86-64 hooks") from
> the perfmon3 tree.
> 
> A new way of doing things.  I fixed it up (see below) and can carry the
> fixup as necessary.  I am not sure about this fix, confirmation would be
> nice.

Yes, this is a good fixup.

Thanks,
	Alexander

> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 
> diff --cc arch/x86/kernel/entry_64.S
> index fc0ad87,b6f061e..0000000
> --- a/arch/x86/kernel/entry_64.S
> +++ b/arch/x86/kernel/entry_64.S
[...removed uninteresting part...]
>  +apicinterrupt ERROR_APIC_VECTOR \
>  +	error_interrupt smp_error_interrupt
>  +apicinterrupt SPURIOUS_APIC_VECTOR \
>  +	spurious_interrupt smp_spurious_interrupt
>   
> + #ifdef CONFIG_PERFMON
>  -ENTRY(pmu_interrupt)
>  -	apicinterrupt LOCAL_PERFMON_VECTOR,smp_pmu_interrupt
>  -END(pmu_interrupt)
> ++apicinterrupt LOCAL_PERFMON_VECTOR \
> ++	pmu_interrupt smp_pmu_interrupt
> + #endif
> + 
>   /*
>    * Exception entry points.
>  - */ 		
>  -	.macro zeroentry sym
>  + */
>  +.macro zeroentry sym do_sym
>  +ENTRY(\sym)
> [...]
