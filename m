From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Tue, 18 Apr 2017 21:06:20 -0700
Message-ID: <20170419040620.GI3956@linux.vnet.ibm.com>
References: <20170419135016.259c2d59@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170419135016.259c2d59@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Apr 19, 2017 at 01:50:16PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> kernel/rcu/rcutorture.c: In function 'rcu_torture_stats_print':
> kernel/rcu/rcutorture.c:1369:3: error: implicit declaration of function 'srcutorture_get_gp_data' [-Werror=implicit-function-declaration]
>    srcutorture_get_gp_data(cur_ops->ttype, srcu_ctlp,
>    ^
> 
> Caused by commit
> 
>   b4d55cac0a93 ("srcu: Make rcutorture writer stalls print SRCU GP state")
> 
> This config has CONFIG_CLASSIC_SRCU=y and CONFIG_RCU_TORTURE_TEST=m, so
> CONFIG_RCU_TORTURE_TEST is not defined - CONFIG_RCU_TORTURE_TEST_MODULE
> is defined.  You probably want to protect srcutorture_get_gp_data() with
> IS_ENABLED(CONFIG_RCU_TORTURE_TEST) instead.
> 
> I have used the rcu tree from next-20170418 for today.

Please accept my apologies!  I forgot about the state of -rcu while
chasing another bug, and only a few minutes ago made the transition
from "Why doesn't this code work?" to "Why didn't my brain work?".  :-/

Will be fixed for tomorrow's -next.  Or at least broken in a more subtle
and creative way.  ;-)

							Thanx, Paul
