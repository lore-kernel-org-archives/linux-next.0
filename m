From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the rcu tree
Date: Mon, 26 Feb 2018 15:22:19 -0800
Message-ID: <20180226232219.GV2855@linux.vnet.ibm.com>
References: <20180227093816.29519e8e@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180227093816.29519e8e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Feb 27, 2018 at 09:38:16AM +1100, Stephen Rothwell wrote:
> Hi Paul,
> 
> Commit
> 
>   2a84d1aef423 ("rcu: Inline rcu_preempt_do_callback() into its sole caller")
> 
> is missing a Signed-off-by from its committer.

That would be because idiot here left the "-s" off of "git am"...

Apologies for the hassle, rebased to fix.

							Thanx, Paul
