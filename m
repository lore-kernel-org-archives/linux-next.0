From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: linux-next: build warnings after merge of the access_once tree
Date: Thu, 26 Mar 2015 11:11:55 +0100
Message-ID: <5513DB6B.7050303@de.ibm.com>
References: <20150326193112.2c87eb39@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp17.uk.ibm.com ([195.75.94.113]:46787 "EHLO
	e06smtp17.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752397AbbCZKMB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Mar 2015 06:12:01 -0400
Received: from /spool/local
	by e06smtp17.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <borntraeger@de.ibm.com>;
	Thu, 26 Mar 2015 10:11:59 -0000
In-Reply-To: <20150326193112.2c87eb39@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>

Am 26.03.2015 um 09:31 schrieb Stephen Rothwell:
> Hi Christian,
> 
> After merging the access_once tree, today's linux-next build (arm
> multi_v7_defconfig) produced lots of this warning:
> 
> In file included from include/linux/linkage.h:4:0,
>                  from include/linux/preempt.h:9,
>                  from include/linux/spinlock.h:50,
>                  from include/linux/lockref.h:17,
>                  from lib/lockref.c:2:
> In function '__read_once_size',
>     inlined from 'lockref_get' at lib/lockref.c:50:2:
> include/linux/compiler.h:216:3: warning: call to 'data_access_exceeds_word_size' declared with attribute warning: data access exceeds word size and won't be atomic
>    data_access_exceeds_word_size();
>    ^
> 
> Introduced by commit 6becd6bd5e89 ("compiler.h: Fix word size check for
> READ/WRITE_ONCE") presumably interacting with commit 4d3199e4ca8e
> ("locking: Remove ACCESS_ONCE() usage") from the tip tree.
> 

The point of my patch was to actually re-enable the formerly broken check.
And indeed on arm 32 bit 
we read a 64bit variable (lock_count). There is no possible way of doing that
in an atomic fashion with READ_ONCE, so the warning is probably correct

code in lib/lockref.c

#define CMPXCHG_LOOP(CODE, SUCCESS) do {                                        \
        struct lockref old;                                                     \
        BUILD_BUG_ON(sizeof(old) != 8);                                         \
        old.lock_count = READ_ONCE(lockref->lock_count);                        \
        while (likely(arch_spin_value_unlocked(old.lock.rlock.raw_lock))) {     \
                struct lockref new = old, prev = old;                           \
                CODE                                                            \
                old.lock_count = cmpxchg64_relaxed(&lockref->lock_count,        \
                                                   old.lock_count,              \
                                                   new.lock_count);             \
                if (likely(old.lock_count == prev.lock_count)) {                \
                        SUCCESS;                                                \
                }                                                               \
                cpu_relax_lowlatency();                                         \
        }                                                                       \
} while (0)
