From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Date: Thu, 9 Jun 2016 08:59:07 -0700
Message-ID: <20160609155907.GB3758@linux.vnet.ibm.com>
References: <20160609151441.7b4ff455@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160609151441.7b4ff455@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, Jun 09, 2016 at 03:14:41PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next merge of the rcu tree got a conflict in:
> 
>   kernel/rcu/tree.c
> 
> between commit:
> 
>   6428671bae97 ("locking/mutex: Optimize mutex_trylock() fast-path")
> 
> from the tip tree and commit:
> 
>   3991b105efd5 ("rcu: Move expedited code from tree.c to tree_exp.h")
> 
> from the rcu tree.
> 
> I fixed it up (I used tree.c from the rcu tree and then applied the
> following fic up patch) and can carry the fix as necessary. This is now
> fixed as far as linux-next is concerned, but any non trivial conflicts
> should be mentioned to your upstream maintainer when your tree is
> submitted for merging.  You may also want to consider cooperating with
> the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 9 Jun 2016 15:01:10 +1000
> Subject: [PATCH] rcu: merge fix for kernel/rcu/tree_exp.h
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Looks correct to me, thank you!

							Thanx, Paul

> ---
>  kernel/rcu/tree_exp.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/kernel/rcu/tree_exp.h b/kernel/rcu/tree_exp.h
> index d400434af6b2..6d86ab6ec2c9 100644
> --- a/kernel/rcu/tree_exp.h
> +++ b/kernel/rcu/tree_exp.h
> @@ -253,7 +253,6 @@ static bool exp_funnel_lock(struct rcu_state *rsp, unsigned long s)
>  	if (ULONG_CMP_LT(READ_ONCE(rnp->exp_seq_rq), s) &&
>  	    (rnp == rnp_root ||
>  	     ULONG_CMP_LT(READ_ONCE(rnp_root->exp_seq_rq), s)) &&
> -	    !mutex_is_locked(&rsp->exp_mutex) &&
>  	    mutex_trylock(&rsp->exp_mutex))
>  		goto fastpath;
> 
> -- 
> 2.8.1
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
