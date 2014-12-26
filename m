From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Fri, 26 Dec 2014 08:54:02 -0800
Message-ID: <20141226165401.GH11609@linux.vnet.ibm.com>
References: <20141226185120.402d392f@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e35.co.us.ibm.com ([32.97.110.153]:40174 "EHLO
	e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751429AbaL0P5Q (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 27 Dec 2014 10:57:16 -0500
Received: from /spool/local
	by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Sat, 27 Dec 2014 08:57:15 -0700
Content-Disposition: inline
In-Reply-To: <20141226185120.402d392f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pranith Kumar <bobby.prani@gmail.com>

On Fri, Dec 26, 2014 at 06:51:20PM +1100, Stephen Rothwell wrote:
> Hi Paul,
> 
> After merging the rcu tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> In file included from arch/powerpc/include/asm/kvm_ppc.h:30:0,
>                  from arch/powerpc/kernel/setup_64.c:68:
> include/linux/kvm_host.h:366:21: error: field 'srcu' has incomplete type
>   struct srcu_struct srcu;
>                      ^
> include/linux/kvm_host.h:367:21: error: field 'irq_srcu' has incomplete type
>   struct srcu_struct irq_srcu;
>                      ^
> 
> Caused by commit f01a973369dd ("srcu: Isolate srcu sections using
> CONFIG_SRCU").  Please stop readding that commit after until it is
> fixed :-(
> 
> I have reverted that commit for today (again :-().

Hello, Stephen,

Please accept my apologies for the hassle!  I had removed that commit
for the duration of the merge window, and forgotten about it when I
re-added all my non-3.19 commits.  :-/

Could you please send your .config?  Or let me know whether it has
CONFIG_KVM=n?

Pranith, if Stephen has CONFIG_KVM=n, it might be best to move the
"select SRCU" to "config PPC" in arch/powerpc/Kconfig.  Are you able
to cross-build powerpc?

							Thanx, Paul
