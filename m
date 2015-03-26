From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: build warnings after merge of the access_once tree
Date: Thu, 26 Mar 2015 18:07:48 +0100
Message-ID: <20150326170748.GD21418@twins.programming.kicks-ass.net>
References: <20150326193112.2c87eb39@canb.auug.org.au>
 <20150326103442.GV21418@twins.programming.kicks-ass.net>
 <20150326132750.GA2805@arm.com>
 <20150326142220.GY21418@twins.programming.kicks-ass.net>
 <CA+55aFyLTc72-xTkjugVSMb3EQq=+__UcFe28agu086xf9d6ZA@mail.gmail.com>
 <CA+55aFyKR3uem_dgSin5wtYdKCBnyM5X9gbRUPfdF1ofeON_1g@mail.gmail.com>
 <20150326163647.GC21418@twins.programming.kicks-ass.net>
 <CA+55aFw1WHJqSj+z-mJGY-kxrg_OsGp9jK9VBi+wB4zPgCkv_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:52529 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751498AbbCZRIJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Mar 2015 13:08:09 -0400
Content-Disposition: inline
In-Reply-To: <CA+55aFw1WHJqSj+z-mJGY-kxrg_OsGp9jK9VBi+wB4zPgCkv_w@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@elte.hu>, Davidlohr Bueso <dave@stgolabs.net>, Paul McKenney <paulmck@linux.vnet.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will.deacon@arm.com>

On Thu, Mar 26, 2015 at 09:45:07AM -0700, Linus Torvalds wrote:

> Stop this idiocy.

Yeah, clearly I can type faster than I can think straight :/


In any case, I've the below patch; do you want to take it now or do you
want me to route it through tip/locking/urgent or something like that?

---
Subject: kernel: Remove atomicy checks from {READ,WRITE}_ONCE
From: Peter Zijlstra <peterz@infradead.org>
Date: Thu, 26 Mar 2015 17:45:37 +0100

The fact that volatile allows for atomic load/stores is a special case
not a requirement for {READ,WRITE}_ONCE(). Their primary purpose is to
force the compiler to emit load/stores _once_.

So remove the warning as it is correct behaviour. This also implies that
the u64 case is not 64bit only, so remove the #ifdef so we can generate
better code in that case.

Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@elte.hu>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>
Cc: Paul McKenney <paulmck@linux.vnet.ibm.com>
Cc: Will Deacon <will.deacon@arm.com>
Acked-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/compiler.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 1b45e4a0519b..0e41ca0e5927 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -192,29 +192,16 @@ void ftrace_likely_update(struct ftrace_branch_data *f, int val, int expect);
 
 #include <uapi/linux/types.h>
 
-static __always_inline void data_access_exceeds_word_size(void)
-#ifdef __compiletime_warning
-__compiletime_warning("data access exceeds word size and won't be atomic")
-#endif
-;
-
-static __always_inline void data_access_exceeds_word_size(void)
-{
-}
-
 static __always_inline void __read_once_size(const volatile void *p, void *res, int size)
 {
 	switch (size) {
 	case 1: *(__u8 *)res = *(volatile __u8 *)p; break;
 	case 2: *(__u16 *)res = *(volatile __u16 *)p; break;
 	case 4: *(__u32 *)res = *(volatile __u32 *)p; break;
-#ifdef CONFIG_64BIT
 	case 8: *(__u64 *)res = *(volatile __u64 *)p; break;
-#endif
 	default:
 		barrier();
 		__builtin_memcpy((void *)res, (const void *)p, size);
-		data_access_exceeds_word_size();
 		barrier();
 	}
 }
@@ -225,13 +212,10 @@ static __always_inline void __write_once_size(volatile void *p, void *res, int s
 	case 1: *(volatile __u8 *)p = *(__u8 *)res; break;
 	case 2: *(volatile __u16 *)p = *(__u16 *)res; break;
 	case 4: *(volatile __u32 *)p = *(__u32 *)res; break;
-#ifdef CONFIG_64BIT
 	case 8: *(volatile __u64 *)p = *(__u64 *)res; break;
-#endif
 	default:
 		barrier();
 		__builtin_memcpy((void *)p, (const void *)res, size);
-		data_access_exceeds_word_size();
 		barrier();
 	}
 }
