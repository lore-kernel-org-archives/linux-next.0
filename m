From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Wed, 9 Dec 2015 07:30:31 +0530
Message-ID: <20151209020031.GN3692@ubuntu>
References: <20151209125441.630ef17e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151209125441.630ef17e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ashwin Chaugule <ashwin.chaugule@linaro.org>
List-Id: linux-next.vger.kernel.org

On 09-12-15, 12:54, Stephen Rothwell wrote:
> Hi Rafael,
> 
> After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> ERROR: "gov_cancel_work" [drivers/cpufreq/cpufreq_ondemand.ko] undefined!
> 
> Caused by commit
> 
>   68e115b19a01 ("cpufreq: governor: replace per-cpu delayed work with timers")
> 
> I have used the pm tree from next-20151208 for today.

Yeah, it missed this stupid change. Sorry about that.

diff --git a/drivers/cpufreq/cpufreq_governor.c b/drivers/cpufreq/cpufreq_governor.c
index 948771f169d2..4de12fd35b1f 100644
--- a/drivers/cpufreq/cpufreq_governor.c
+++ b/drivers/cpufreq/cpufreq_governor.c
@@ -205,6 +205,7 @@ void gov_cancel_work(struct cpu_common_dbs_info *shared)
        gov_cancel_timers(shared->policy);
        atomic_set(&shared->skip_work, 0);
 }
+EXPORT_SYMBOL_GPL(gov_cancel_work);
 
 /* Will return if we need to evaluate cpu load again or not */
 static bool need_load_eval(struct cpu_common_dbs_info *shared,


Rafael, I am resending the original patch with this change.

-- 
viresh
