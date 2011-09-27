From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: linux-next: manual merge of the rcu tree with Linus' tree
Date: Tue, 27 Sep 2011 14:20:44 +0200
Message-ID: <20110927122041.GL18553@somewhere>
References: <20110927160411.7bcec0906847959fb6e88a81@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:51212 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753536Ab1I0MUs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Sep 2011 08:20:48 -0400
Content-Disposition: inline
In-Reply-To: <20110927160411.7bcec0906847959fb6e88a81@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>

On Tue, Sep 27, 2011 at 04:04:11PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next merge of the rcu tree got a conflict in
> arch/x86/kernel/process_64.c between commit a0bfa1373859 ("cpuidle: stop
> depending on pm_idle") from Linus' tree and commit 18349ca4b42e ("x86:
> Enter rcu extended qs after idle notifier call") from the rcu tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc arch/x86/kernel/process_64.c
> index f693e44,dee2e6c..0000000
> --- a/arch/x86/kernel/process_64.c
> +++ b/arch/x86/kernel/process_64.c
> @@@ -137,8 -136,12 +137,14 @@@ void cpu_idle(void
>   			enter_idle();
>   			/* Don't trace irqs off for idle */
>   			stop_critical_timings();
> - 			if (cpuidle_idle_call())
> + 
>  -			/* enter_idle() needs rcu for notifiers */
>  -			rcu_enter_nohz();
>  -			pm_idle();
>  -			rcu_exit_nohz();
> ++			if (cpuidle_idle_call()) {
> ++				/* enter_idle() needs rcu for notifiers */
> ++				rcu_enter_nohz();
>  +				pm_idle();
> ++				rcu_exit_nohz();
> ++			}
> + 
>   			start_critical_timings();
>   
>   			/* In many cases the interrupt that ended idle

Looks good, thanks!
