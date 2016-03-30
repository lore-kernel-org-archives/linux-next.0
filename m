From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the rcu tree with Linus' tree
Date: Wed, 30 Mar 2016 03:30:31 -0700
Message-ID: <20160330103031.GC4287@linux.vnet.ibm.com>
References: <20160330113214.4110cd63@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160330113214.4110cd63@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>
List-Id: linux-next.vger.kernel.org

On Wed, Mar 30, 2016 at 11:32:14AM +1100, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next merge of the rcu tree got a conflict in:
> 
>   kernel/rcu/tree.c
> 
> between commit:
> 
>   abedf8e2419f ("rcu: Use simple wait queues where possible in rcutree")
> 
> from Linus' tree and commit:
> 
>   08cace5914ea ("DIAGS: Crude exploratory hack")
> 
> from the rcu tree.
> 
> I fixed it up (I used the rcu tree version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
> 
> I really don't think that that rcu tree patch should be in linux-next,
> right?

Right you are!  I will rework to get the diagnostics out of your way.
-Might- have helped find one of the bugs, but don't look now...

							Thanx, Paul
