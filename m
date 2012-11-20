From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH linux-next] cpuidle: fix a suspicious RCU usage in menu
 governor
Date: Tue, 20 Nov 2012 07:34:32 -0800
Message-ID: <20121120153432.GQ2829@linux.vnet.ibm.com>
References: <1353404893.3694.42.camel@ThinkPad-T5421.cn.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e36.co.us.ibm.com ([32.97.110.154]:46649 "EHLO
	e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751430Ab2KTPfL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 20 Nov 2012 10:35:11 -0500
Received: from /spool/local
	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Tue, 20 Nov 2012 08:35:11 -0700
Received: from d03relay03.boulder.ibm.com (d03relay03.boulder.ibm.com [9.17.195.228])
	by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id D7570C40004
	for <linux-next@vger.kernel.org>; Tue, 20 Nov 2012 08:34:36 -0700 (MST)
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay03.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id qAKFYZec294718
	for <linux-next@vger.kernel.org>; Tue, 20 Nov 2012 08:34:36 -0700
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id qAKFYZXM006042
	for <linux-next@vger.kernel.org>; Tue, 20 Nov 2012 08:34:35 -0700
Content-Disposition: inline
In-Reply-To: <1353404893.3694.42.camel@ThinkPad-T5421.cn.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Li Zhong <zhong@linux.vnet.ibm.com>
Cc: linux-next list <linux-next@vger.kernel.org>, riel@redhat.com, youquan.song@intel.com, rafael.j.wysocki@intel.com

On Tue, Nov 20, 2012 at 05:48:13PM +0800, Li Zhong wrote:
> I saw this suspicious RCU usage on the next tree of 11/15
> 
> [   67.123404] ===============================
> [   67.123413] [ INFO: suspicious RCU usage. ]
> [   67.123423] 3.7.0-rc5-next-20121115-dirty #1 Not tainted
> [   67.123434] -------------------------------
> [   67.123444] include/trace/events/timer.h:186 suspicious rcu_dereference_check() usage!
> [   67.123458] 
> [   67.123458] other info that might help us debug this:
> [   67.123458] 
> [   67.123474] 
> [   67.123474] RCU used illegally from idle CPU!
> [   67.123474] rcu_scheduler_active = 1, debug_locks = 0
> [   67.123493] RCU used illegally from extended quiescent state!
> [   67.123507] 1 lock held by swapper/1/0:
> [   67.123516]  #0:  (&cpu_base->lock){-.-...}, at: [<c0000000000979b0>] .__hrtimer_start_range_ns+0x28c/0x524
> [   67.123555] 
> [   67.123555] stack backtrace:
> [   67.123566] Call Trace:
> [   67.123576] [c0000001e2ccb920] [c00000000001275c] .show_stack+0x78/0x184 (unreliable)
> [   67.123599] [c0000001e2ccb9d0] [c0000000000c15a0] .lockdep_rcu_suspicious+0x120/0x148
> [   67.123619] [c0000001e2ccba70] [c00000000009601c] .enqueue_hrtimer+0x1c0/0x1c8
> [   67.123639] [c0000001e2ccbb00] [c000000000097aa0] .__hrtimer_start_range_ns+0x37c/0x524
> [   67.123660] [c0000001e2ccbc20] [c0000000005c9698] .menu_select+0x508/0x5bc
> [   67.123678] [c0000001e2ccbd20] [c0000000005c740c] .cpuidle_idle_call+0xa8/0x6e4
> [   67.123699] [c0000001e2ccbdd0] [c0000000000459a0] .pSeries_idle+0x10/0x34
> [   67.123717] [c0000001e2ccbe40] [c000000000014dc8] .cpu_idle+0x130/0x280
> [   67.123738] [c0000001e2ccbee0] [c0000000006ffa8c] .start_secondary+0x378/0x384
> [   67.123758] [c0000001e2ccbf90] [c00000000000936c] .start_secondary_prolog+0x10/0x14
> 
> hrtimer_start was added in 198fd638 and ae515197. The patch below tries
> to use RCU_NONIDLE around it to avoid the above report. 
> 
> Signed-off-by: Li Zhong <zhong@linux.vnet.ibm.com>

Acked-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

> ---
>  drivers/cpuidle/governors/menu.c |   10 ++++++----
>  1 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpuidle/governors/menu.c b/drivers/cpuidle/governors/menu.c
> index 2efee27..bd40b94 100644
> --- a/drivers/cpuidle/governors/menu.c
> +++ b/drivers/cpuidle/governors/menu.c
> @@ -407,8 +407,9 @@ static int menu_select(struct cpuidle_driver *drv, struct cpuidle_device *dev)
>  		perfect_us = perfect_cstate_ms * 1000;
> 
>  		if (repeat && (4 * timer_us < data->expected_us)) {
> -			hrtimer_start(hrtmr, ns_to_ktime(1000 * timer_us),
> -				HRTIMER_MODE_REL_PINNED);
> +			RCU_NONIDLE(hrtimer_start(hrtmr,
> +				ns_to_ktime(1000 * timer_us),
> +				HRTIMER_MODE_REL_PINNED));
>  			/* In repeat case, menu hrtimer is started */
>  			per_cpu(hrtimer_status, cpu) = MENU_HRTIMER_REPEAT;
>  		} else if (perfect_us < data->expected_us) {
> @@ -418,8 +419,9 @@ static int menu_select(struct cpuidle_driver *drv, struct cpuidle_device *dev)
>  			 * In that case, it makes sense to re-enter
>  			 * into a deeper C-state after some time.
>  			 */
> -			hrtimer_start(hrtmr, ns_to_ktime(1000 * timer_us),
> -				HRTIMER_MODE_REL_PINNED);
> +			RCU_NONIDLE(hrtimer_start(hrtmr,
> +				ns_to_ktime(1000 * timer_us),
> +				HRTIMER_MODE_REL_PINNED));
>  			/* In general case, menu hrtimer is started */
>  			per_cpu(hrtimer_status, cpu) = MENU_HRTIMER_GENERAL;
>  		}
> -- 
> 1.7.1
> 
> 
