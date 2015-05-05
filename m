From: Don Zickus <dzickus@redhat.com>
Subject: Re: [PATCH] watchdog: Fix a watchdog crash in some configurations
Date: Tue, 5 May 2015 10:06:23 -0400
Message-ID: <20150505140623.GL98296@redhat.com>
References: <1430781427-31318-1-git-send-email-jhubbard@nvidia.com>
 <20150505133526.GH98296@redhat.com>
 <2DAD8E56-C5BD-4B63-93A5-42CC3D8E45E4@ezchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:43950 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S2992900AbbEEOHG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 May 2015 10:07:06 -0400
Content-Disposition: inline
In-Reply-To: <2DAD8E56-C5BD-4B63-93A5-42CC3D8E45E4@ezchip.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Metcalf <cmetcalf@ezchip.com>
Cc: "john.hubbard@gmail.com" <john.hubbard@gmail.com>, Ingo Molnar <mingo@kernel.org>, Ulrich Obergfell <uobergfe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>

On Tue, May 05, 2015 at 01:44:57PM +0000, Chris Metcalf wrote:
> 
> > On May 5, 2015, at 9:35 AM, Don Zickus <dzickus@redhat.com> wrote:
> > 
> >> On Mon, May 04, 2015 at 04:17:07PM -0700, john.hubbard@gmail.com wrote:
> >> From: John Hubbard <jhubbard@nvidia.com>
> >> 
> >> Commit 8fcf2cc768acd845c1fed837bf9cfe2d7106336d in linux-next
> >> introduced a regression in some configurations. Specifically,
> >> with CONFIG_NO_HZ_FULL set, and CONFIG_NO_HZ_FULL_ALL *not* set,
> >> the kernel will crash in lockup_detector_init(), due to a
> >> NULL tick_nohz_full_mask pointer.
> >> 
> >> This is because the above commit uses tick_nohz_full_mask
> >> (in lockup_detector_init), if CONFIG_NO_HZ_FULL is set, but
> >> tick_nohz_full_mask only gets allocated if either:
> >> 
> >>    a) CONFIG_NO_HZ_FULL_ALL is set, or
> >> 
> >>    b) Someone passes in nohz_full=<any_value> on the boot
> >>      args line.
> >> 
> >> To correct this, change lockup_detector_init so that it does
> >> a runtime check (in addition to the ifdef check). This now
> >> matches the way most of the other CONFIG_NO_HZ_FULL code does
> >> it's checking. This fix is a little simpler than my original
> >> proposed fix, thanks to Chris Metcalf for that.
> > 
> > Hi Chris,
> > 
> > If you are ok with this, I can forward it along.
> > 
> > Cheers,
> > Don
> 
> With the new dynamic test, we don't actually need the ifdef anymore. I asked John if he could respin it without that. 

Ok, I will wait for the respin. Thanks!

Cheers,
Don

> 
> > 
> >> 
> >> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> >> ---
> >> kernel/watchdog.c | 12 ++++++++----
> >> 1 file changed, 8 insertions(+), 4 deletions(-)
> >> 
> >> diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> >> index 40fda2f..910d73f 100644
> >> --- a/kernel/watchdog.c
> >> +++ b/kernel/watchdog.c
> >> @@ -921,10 +921,14 @@ void __init lockup_detector_init(void)
> >>    set_sample_period();
> >> 
> >> #ifdef CONFIG_NO_HZ_FULL
> >> -    if (!cpumask_empty(tick_nohz_full_mask))
> >> -        pr_info("Disabling watchdog on nohz_full cores by default\n");
> >> -    cpumask_andnot(&watchdog_cpumask, cpu_possible_mask,
> >> -               tick_nohz_full_mask);
> >> +    if (tick_nohz_full_enabled()) {
> >> +        if (!cpumask_empty(tick_nohz_full_mask))
> >> +            pr_info("Disabling watchdog on nohz_full cores by default\n");
> >> +        cpumask_andnot(&watchdog_cpumask, cpu_possible_mask,
> >> +                   tick_nohz_full_mask);
> >> +    }
> >> +    else
> >> +        cpumask_copy(&watchdog_cpumask, cpu_possible_mask);
> >> #else
> >>    cpumask_copy(&watchdog_cpumask, cpu_possible_mask);
> >> #endif
> >> -- 
> >> 2.3.7
> >> 
