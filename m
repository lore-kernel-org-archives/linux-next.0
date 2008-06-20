From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: Re: linux-next: s390 build failure
Date: Fri, 20 Jun 2008 13:51:47 +0200
Message-ID: <1213962707.32462.9.camel@localhost>
References: <20080620124235.24fbe33e.sfr@canb.auug.org.au>
Reply-To: schwidefsky@de.ibm.com
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate8.de.ibm.com ([195.212.29.157]:43011 "EHLO
	mtagate8.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752748AbYFTLwc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Jun 2008 07:52:32 -0400
Received: from d12nrmr1607.megacenter.de.ibm.com (d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate8.de.ibm.com (8.13.8/8.13.8) with ESMTP id m5KBpm18146496
	for <linux-next@vger.kernel.org>; Fri, 20 Jun 2008 11:51:48 GMT
Received: from d12av02.megacenter.de.ibm.com (d12av02.megacenter.de.ibm.com [9.149.165.228])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id m5KBpmxj3494124
	for <linux-next@vger.kernel.org>; Fri, 20 Jun 2008 13:51:48 +0200
Received: from d12av02.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av02.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m5KBpmGK019796
	for <linux-next@vger.kernel.org>; Fri, 20 Jun 2008 13:51:48 +0200
In-Reply-To: <20080620124235.24fbe33e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Jens Axboe <jens.axboe@oracle.com>

On Fri, 2008-06-20 at 12:42 +1000, Stephen Rothwell wrote:
> In file included from /scratch/michael/kisskb-build/src/include/linux/spinlock.h:87,
>                  from /scratch/michael/kisskb-build/src/include/linux/smp.h:11,
>                  from /scratch/michael/kisskb-build/src/include/linux/kernel_stat.h:4,
>                  from /scratch/michael/kisskb-build/src/mm/memory.c:41:
> include2/asm/spinlock.h: In function '__raw_spin_lock':
> include2/asm/spinlock.h:69: error: implicit declaration of function 'smp_processor_id'
> 
> There are others as well, but I was concentrating on this.  Bisecting
> leads to commit 2448ad3d8e64a9b58acca34a3d010cfa0be88cc1 which is the
> merge of the block tree.  The block tree contains a commit
> (37e81b98dba08cce1d8eedb2bdaa58022bf31ee0 "Add generic helpers for arch
> IPI function calls") that adds an include of linux/spinlock.h to
> linux/smp.h. (asm-s390/spinlock.h includes linux/smp.h ...)
> 
> But the block tree itself is OK.  So something in the s390 tree is
> interacting with the above commit to cause the failure.  It is not
> immediately obvious to me what that is. (Or I may have screwed up the
> bisect :-))

Hmm, the minimal test case for this is:

#include <linux/smp.h>

* linux/smp.h defines __LINUX_SMP_H then includes linux/spinlock.h
* linux/spinlock.h includes some more headers, then asm/spinlock.h
* asm/spinlock.h includes linux/smp.h with no effect because linux/smp.h
has already defined __LINUX_SMP_H, then uses smp_processor_id() which is
not defined yet
* on return from the linux/spinlock.h include linux/smp.h defines
smp_processor_id()

Relavant commits that cause this problem:

1)
commit 3888f22c9cc8b4eca034f11b13d7f7957627fcfb
Author: Jens Axboe <jens.axboe@oracle.com>
Date:   Fri Jun 6 10:58:32 2008 +0200
Add generic helpers for arch IPI function calls

This commit introduces the #include <linux/spinlock.h> to linux/smp.h

-- 
blue skies,
  Martin.

"Reality continues to ruin my life." - Calvin.


