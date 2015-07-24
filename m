From: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 24 Jul 2015 13:16:05 -0700
Message-ID: <1437768965.3298.52.camel@stgolabs.net>
References: <20150724153334.543cfc7b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:42579 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753030AbbGXUQS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 24 Jul 2015 16:16:18 -0400
In-Reply-To: <20150724153334.543cfc7b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2015-07-24 at 15:33 +1000, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (powerpc
> allnoconfig) failed like this:
> 
> mm/built-in.o: In function `shrink_slab.part.73.constprop.83':
> vmscan.c:(.text+0xf760): undefined reference to `__srcu_read_lock'
> vmscan.c:(.text+0xf924): undefined reference to `__srcu_read_unlock'
> mm/built-in.o: In function `unregister_shrinker':
> (.text+0xfa60): undefined reference to `synchronize_srcu'
> mm/built-in.o:(.data+0x1e8): undefined reference to `process_srcu'
> 
> Caused by commit
> 
>   dab937da82f9 ("mm: srcu-ify shrinkers")
> 
> I have reverted that commit for today.

Adding paulmck.

I'm not entirely sure what is the fix here. Paul G also reported it
failing for arm. I was able to reproduce with powerpc, and the following
fixes the issue, but I doubt it is the correct way to address this. The
idea was based on how we do it for x86.

Also, having SRCU in mm is, lets say, more than convenient, beyond
MMU_NOTIFIERS which explicitly selects SRCU.

Paul?

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 5ef2711..774207e 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -124,6 +124,7 @@ config PPC
        select GENERIC_IRQ_SHOW
        select GENERIC_IRQ_SHOW_LEVEL
        select IRQ_FORCED_THREADING
+       select SRCU
        select HAVE_RCU_TABLE_FREE if SMP
        select HAVE_SYSCALL_TRACEPOINTS
        select HAVE_BPF_JIT

Thanks,
Davidlohr
