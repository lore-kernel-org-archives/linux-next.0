From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Date: Mon, 4 Sep 2017 14:43:16 +1000
Message-ID: <20170904144316.245a7347@canb.auug.org.au>
References: <20170811140646.6d499a6e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170811140646.6d499a6e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
List-Id: linux-next.vger.kernel.org

Hi all,

On Fri, 11 Aug 2017 14:06:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   kernel/sched/fair.c
> 
> between commit:
> 
>   674e75411fc2 ("sched: cpufreq: Allow remote cpufreq callbacks")
> 
> from the pm tree and commit:
> 
>   a030d7381d8b ("sched/fair: Call cpufreq update util handlers less frequently on UP")
> 
> from the tip tree.
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
> diff --cc kernel/sched/fair.c
> index d378d02fdfcb,8d5868771cb3..000000000000
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@@ -2790,6 -2801,29 +2801,31 @@@ static inline void update_cfs_shares(st
>   }
>   #endif /* CONFIG_FAIR_GROUP_SCHED */
>   
> + static inline void cfs_rq_util_change(struct cfs_rq *cfs_rq)
> + {
>  -	if (&this_rq()->cfs == cfs_rq) {
> ++	struct rq *rq = rq_of(cfs_rq);
> ++
> ++	if (&rq->cfs == cfs_rq) {
> + 		/*
> + 		 * There are a few boundary cases this might miss but it should
> + 		 * get called often enough that that should (hopefully) not be
> + 		 * a real problem -- added to that it only calls on the local
> + 		 * CPU, so if we enqueue remotely we'll miss an update, but
> + 		 * the next tick/schedule should update.
> + 		 *
> + 		 * It will not get called when we go idle, because the idle
> + 		 * thread is a different class (!fair), nor will the utilization
> + 		 * number include things like RT tasks.
> + 		 *
> + 		 * As is, the util number is not freq-invariant (we'd have to
> + 		 * implement arch_scale_freq_capacity() for that).
> + 		 *
> + 		 * See cpu_util().
> + 		 */
>  -		cpufreq_update_util(rq_of(cfs_rq), 0);
> ++		cpufreq_update_util(rq, 0);
> + 	}
> + }
> + 
>   #ifdef CONFIG_SMP
>   /*
>    * Approximate:

Just a reminder that the above conflict still exists.

-- 
Cheers,
Stephen Rothwell
