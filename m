From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Mon, 4 Sep 2017 09:39:09 -0700
Message-ID: <20170904163909.GG15437@linux.vnet.ibm.com>
References: <20170904145045.090c048b@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170904145045.090c048b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Sep 04, 2017 at 02:50:45PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> ERROR: "rcu_cpu_stall_suppress" [kernel/rcu/rcutorture.ko] undefined!
> ERROR: "rcu_cpu_stall_suppress" [kernel/rcu/rcuperf.ko] undefined!
> 
> Caused by commit
> 
>   909bd6e3d9e7 ("rcu: Suppress RCU CPU stall warnings while dumping trace")
> 
> I have reverted that commit for today.

Apologies, fixed.  Also belatedly reset rcu/next to cover only commits
destined for the merge window, which eliminates that commit and several
others.

							Thanx, Paul
