From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2] watchdog: Fix a watchdog crash in some
 configurations
Date: Tue, 5 May 2015 15:12:10 -0700
Message-ID: <20150505151210.feb7379f2e2a1e68e732a571@linux-foundation.org>
References: <20150505140623.GL98296@redhat.com>
	<1430854691-9628-1-git-send-email-jhubbard@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:34056 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752217AbbEEWMM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 May 2015 18:12:12 -0400
In-Reply-To: <1430854691-9628-1-git-send-email-jhubbard@nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: john.hubbard@gmail.com
Cc: Don Zickus <dzickus@redhat.com>, Chris Metcalf <cmetcalf@ezchip.com>, Ingo Molnar <mingo@kernel.org>, Ulrich Obergfell <uobergfe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>

On Tue,  5 May 2015 12:38:11 -0700 john.hubbard@gmail.com wrote:

> From: John Hubbard <jhubbard@nvidia.com>
> 
> Commit 8fcf2cc768acd845c1fed837bf9cfe2d7106336d in linux-next
> introduced a regression in some configurations. Specifically,
> with CONFIG_NO_HZ_FULL set, and CONFIG_NO_HZ_FULL_ALL *not* set,
> the kernel will crash in lockup_detector_init(), due to a
> NULL tick_nohz_full_mask pointer.
> 
> This is because the above commit uses tick_nohz_full_mask
> (in lockup_detector_init), if CONFIG_NO_HZ_FULL is set, but
> tick_nohz_full_mask only gets allocated if either:
> 
>     a) CONFIG_NO_HZ_FULL_ALL is set, or
> 
>     b) Someone passes in nohz_full=<any_value> on the boot
>       args line.
> 
> To correct this, change lockup_detector_init so that it does
> a runtime check instead of the ifdef check. This fix is
> simpler than my original proposed fix, thanks to Chris Metcalf
> for that.
> 
> ...
>
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -920,14 +920,14 @@ void __init lockup_detector_init(void)
>  {
>  	set_sample_period();
>  
> -#ifdef CONFIG_NO_HZ_FULL
> -	if (!cpumask_empty(tick_nohz_full_mask))
> -		pr_info("Disabling watchdog on nohz_full cores by default\n");
> -	cpumask_andnot(&watchdog_cpumask, cpu_possible_mask,
> -		       tick_nohz_full_mask);
> -#else
> -	cpumask_copy(&watchdog_cpumask, cpu_possible_mask);
> -#endif
> +	if (tick_nohz_full_enabled()) {
> +		if (!cpumask_empty(tick_nohz_full_mask))
> +			pr_info("Disabling watchdog on nohz_full cores by default\n");
> +		cpumask_andnot(&watchdog_cpumask, cpu_possible_mask,
> +			       tick_nohz_full_mask);
> +	}
> +	else
> +		cpumask_copy(&watchdog_cpumask, cpu_possible_mask);

Breaks x86_64 allmodconfig:

kernel/watchdog.c: In function 'lockup_detector_init':
kernel/watchdog.c:924: error: 'tick_nohz_full_mask' undeclared (first use in this function)
