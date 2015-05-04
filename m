From: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH] cpuidle: Fix a watchdog crash in some configurations
Date: Mon, 4 May 2015 16:13:07 -0700
Message-ID: <alpine.LNX.2.03.1505041610210.22418@nvidia.com>
References: <1430554208-23588-1-git-send-email-jhubbard@nvidia.com> <5547EB7F.4060006@ezchip.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="279739828-1904533452-1430781188=:22418"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:15847 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751606AbbEDXNJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 May 2015 19:13:09 -0400
In-Reply-To: <5547EB7F.4060006@ezchip.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Metcalf <cmetcalf@ezchip.com>
Cc: john.hubbard@gmail.com, Frederic Weisbecker <fweisbec@gmail.com>, Don Zickus <dzickus@redhat.com>, Ingo Molnar <mingo@kernel.org>, Ulrich Obergfell <uobergfe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

--279739828-1904533452-1430781188=:22418
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8BIT

Re-sending from a proper text-only email client. Sorry for the extra 
email.

On Mon, 4 May 2015, Chris Metcalf wrote:

> On 5/2/2015 4:10 AM, john.hubbard@gmail.com wrote:
> 
> From: John Hubbard <jhubbard@nvidia.com>
> 
> Commit 8fcf2cc768acd845c1fed837bf9cfe2d7106336d in linux-next
> introduced a regression in some configurations. Specifically,
> with CONFIG_NO_HZ_FULL set, and CONFIG_NO_HZ_FULL_ALL *not* set,
> the kernel will crash in lockup_detector_init(), due to a
> NULL tick_nohz_full_init pointer.
> 
> This is because the above commit uses tick_nohz_full_init
> (in lockup_detector_init), if CONFIG_NO_HZ_FULL is set, but
> tick_nohz_full_init only gets allocated if either:
> 
>     a) CONFIG_NO_HZ_FULL_ALL is set, or
> 
>     b) Someone passes in nohz_full=<any_value> on the boot
>       args line.
> 
> To correct this, change the allocation site (case a, above):
> allocate tick_nohz_full_init whenever CONFIG_NO_HZ_FULL is set.
> Also, change the enclosing function name to more accurately
> reflect its current role.
> 
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> 
> 
> (Note that you say "tick_nohz_full_init" in your text a couple of times
> where you mean "tick_nohz_full_mask".)

Yes, you're correct. I'll fix that.

> 
> This looks plausible to me, but I know that Frederic was thinking of
> doing something deeper by making tick_nohz_full_mask a mask
> that was available in all configurations, like cpu_possible_mask etc:
> 
>   https://lkml.org/lkml/2015/4/14/347
> 
> Another way to fix this would be to fix lockup_detector_init() to
> test dynamically like this:
> 
>         if (tick_nohz_full_enabled()) {
>                 if (!cpumask_empty(tick_nohz_full_mask))
>                         pr_info("Disabling watchdog on nohz_full cores by default\n");
>                 cpumask_andnot(&watchdog_cpumask, cpu_possible_mask,
>                                tick_nohz_full_mask);
>         } else {
>                 cpumask_copy(&watchdog_cpumask, cpu_possible_mask);
>         }
> 
> This would avoid looking at the NULL cpumask pointer and is more
> consistent with how other nohz_full code works, for better or worse.
> 


OK, right, I see now that the NO_HZ code usually does this check:

#ifdef CONFIG_NO_HZ_FULL
    if (tick_nohz_full_enabled())

...and the new code in lockup_detector_init() simply lacked the second 
line, so your fix is probably the better way to go. I just retested and 
all is well with that approach. I'll send an updated fix separately (so 
that whitespace is preserved) in a moment.


> I didn't see this since by default I don't have CPUMASK_OFFLINE.
> -- 
> Chris Metcalf, EZChip Semiconductor
> http://www.ezchip.com
> 
> 

thanks,
John H.

--279739828-1904533452-1430781188=:22418--
