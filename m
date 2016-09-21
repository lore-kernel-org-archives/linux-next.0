From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Wed, 21 Sep 2016 12:14:23 +0530
Message-ID: <20160921064423.GE6313@vireshk-i7>
References: <20160921132357.3ae9d8dd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:34318 "EHLO
        mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750785AbcIUGo1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Sep 2016 02:44:27 -0400
Received: by mail-pa0-f46.google.com with SMTP id wk8so15227282pab.1
        for <linux-next@vger.kernel.org>; Tue, 20 Sep 2016 23:44:27 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160921132357.3ae9d8dd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>

On 21-09-16, 13:23, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/cpufreq/cpufreq.c:1324:12: error: conflicting types for 'cpufreq_offline'
>  static int cpufreq_offline(unsigned int cpu)
>             ^
> drivers/cpufreq/cpufreq.c:1289:13: note: previous declaration of 'cpufreq_offline' was here
>  static void cpufreq_offline(unsigned int cpu);
>              ^
> 
> Caused by commit
> 
>   27622b061eb4 ("cpufreq: Convert to hotplug state machine")
> 
> interacting with commit
> 
>   26619804e733 ("cpufreq: create link to policy only for registered CPUs")
> 
> from the pm tree.
> 
> I have applied the foloowing build fix for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 21 Sep 2016 13:20:32 +1000
> Subject: [PATCH] cpufreq: merge fix for type of cpufreq_offline changing
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/cpufreq/cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 611395cb115e..6e6c1fb60fbc 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -1286,7 +1286,7 @@ out_free_policy:
>  	return ret;
>  }
>  
> -static void cpufreq_offline(unsigned int cpu);
> +static int cpufreq_offline(unsigned int cpu);

Thanks and sorry about it. Looks fine.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
