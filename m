From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Date: Tue, 26 Jun 2018 12:33:25 -0700
Message-ID: <20180626193325.GL3593@linux.vnet.ibm.com>
References: <20180622122717.5f475829@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180622122717.5f475829@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Jun 22, 2018 at 12:27:17PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rcu tree got a conflict in:
> 
>   kernel/rcu/tree_plugin.h
> 
> between commit:
> 
>   b3dae109fa89 ("sched/swait: Rename to exclusive")
> 
> from the tip tree and commit:
> 
>   57ada0a7f942 ("rcu: Convert grace-period requests to ->gp_seq")
> 
> from the rcu tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks good to me, and thank you!

							Thanx, Paul

> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc kernel/rcu/tree_plugin.h
> index ad53d133f709,2cc9bf0d363a..000000000000
> --- a/kernel/rcu/tree_plugin.h
> +++ b/kernel/rcu/tree_plugin.h
> @@@ -2082,9 -2159,9 +2159,9 @@@ static void rcu_nocb_wait_gp(struct rcu
>   	 */
>   	trace_rcu_this_gp(rnp, rdp, c, TPS("StartWait"));
>   	for (;;) {
>  -		swait_event_interruptible(
>  +		swait_event_interruptible_exclusive(
> - 			rnp->nocb_gp_wq[c & 0x1],
> - 			(d = ULONG_CMP_GE(READ_ONCE(rnp->completed), c)));
> + 			rnp->nocb_gp_wq[rcu_seq_ctr(c) & 0x1],
> + 			(d = rcu_seq_done(&rnp->gp_seq, c)));
>   		if (likely(d))
>   			break;
>   		WARN_ON(signal_pending(current));
