From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build warning after merge of the rcu tree
Date: Fri, 25 Mar 2011 12:23:19 -0700
Message-ID: <20110325192319.GU2322@linux.vnet.ibm.com>
References: <20110325160539.659fe452.sfr@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110325160539.659fe452.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Paul E. McKenney" <paul.mckenney@linaro.org>
List-Id: linux-next.vger.kernel.org

On Fri, Mar 25, 2011 at 04:05:39PM +1100, Stephen Rothwell wrote:
> Hi Paul,
> 
> After merging the rcu tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> kernel/softirq.c:62: warning: excess elements in array initializer
> kernel/softirq.c:62: warning: (near initialization for 'softirq_to_name')
> 
> Introduced by commit 0ac7e739ad17 ("rcu: move TREE_RCU from softirq to
> kthread").

I must confess that it didn't occur to me to check for more than one
array of softirq names, and I have no idea why I didn't see this warning
in my builds.  In any case, I have fixed this and updated -rcu.

I just now found the mention of RCU in the proc.txt documentation file,
and have a fix for that queued as well, and will export to -rcu on the
next round.

							Thanx, Paul
