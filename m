From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the arm64 tree
Date: Tue, 13 Oct 2015 13:10:48 +1100
Message-ID: <20151013131048.51f00118@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52334 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752524AbbJMCKw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 Oct 2015 22:10:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/arm64/include/asm/atomic.h

between commit:

  305d454aaa29 ("arm64: atomics: implement native {relaxed, acquire, release} atomics")

from the arm64 tree and commit:

  62e8a3258bda ("atomic, arch: Audit atomic_{read,set}()")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm64/include/asm/atomic.h
index 5e13ad76a249,1e247ac2601a..000000000000
--- a/arch/arm64/include/asm/atomic.h
+++ b/arch/arm64/include/asm/atomic.h
@@@ -54,39 -54,8 +54,39 @@@
  #define ATOMIC_INIT(i)	{ (i) }
  
  #define atomic_read(v)			READ_ONCE((v)->counter)
- #define atomic_set(v, i)		(((v)->counter) = (i))
+ #define atomic_set(v, i)		WRITE_ONCE(((v)->counter), (i))
 +
 +#define atomic_add_return_relaxed	atomic_add_return_relaxed
 +#define atomic_add_return_acquire	atomic_add_return_acquire
 +#define atomic_add_return_release	atomic_add_return_release
 +#define atomic_add_return		atomic_add_return
 +
 +#define atomic_inc_return_relaxed(v)	atomic_add_return_relaxed(1, (v))
 +#define atomic_inc_return_acquire(v)	atomic_add_return_acquire(1, (v))
 +#define atomic_inc_return_release(v)	atomic_add_return_release(1, (v))
 +#define atomic_inc_return(v)		atomic_add_return(1, (v))
 +
 +#define atomic_sub_return_relaxed	atomic_sub_return_relaxed
 +#define atomic_sub_return_acquire	atomic_sub_return_acquire
 +#define atomic_sub_return_release	atomic_sub_return_release
 +#define atomic_sub_return		atomic_sub_return
 +
 +#define atomic_dec_return_relaxed(v)	atomic_sub_return_relaxed(1, (v))
 +#define atomic_dec_return_acquire(v)	atomic_sub_return_acquire(1, (v))
 +#define atomic_dec_return_release(v)	atomic_sub_return_release(1, (v))
 +#define atomic_dec_return(v)		atomic_sub_return(1, (v))
 +
 +#define atomic_xchg_relaxed(v, new)	xchg_relaxed(&((v)->counter), (new))
 +#define atomic_xchg_acquire(v, new)	xchg_acquire(&((v)->counter), (new))
 +#define atomic_xchg_release(v, new)	xchg_release(&((v)->counter), (new))
  #define atomic_xchg(v, new)		xchg(&((v)->counter), (new))
 +
 +#define atomic_cmpxchg_relaxed(v, old, new)				\
 +	cmpxchg_relaxed(&((v)->counter), (old), (new))
 +#define atomic_cmpxchg_acquire(v, old, new)				\
 +	cmpxchg_acquire(&((v)->counter), (old), (new))
 +#define atomic_cmpxchg_release(v, old, new)				\
 +	cmpxchg_release(&((v)->counter), (old), (new))
  #define atomic_cmpxchg(v, old, new)	cmpxchg(&((v)->counter), (old), (new))
  
  #define atomic_inc(v)			atomic_add(1, (v))
