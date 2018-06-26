From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the rcu tree
Date: Tue, 26 Jun 2018 16:43:52 -0700
Message-ID: <20180626234352.GR3593@linux.vnet.ibm.com>
References: <20180627090409.60641869@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180627090409.60641869@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Jun 27, 2018 at 09:04:09AM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> Commit
> 
>   aa838e0b70e1 ("MAINTAINERS: Add Daniel Lustig as an LKMM reviewer")
> 
> is missing a Signed-off-by from its committer.

Will fix, apologies!  I must have lost the '-s' argument to "git am".

> Please sort out the "Not-Yet-Signed-off-by: tags on commit
> 
>   0cd34e83b2a5 ("rcu: Make expedited GPs handle CPU 0 being offline")
> 
> Please remember that the linux-next tree is not a development tree,
> it is an integration testing tree.

This should be fixed in the most recent push of rcu/next, admittedly less
than two hours ago.

								Thanx, Paul
