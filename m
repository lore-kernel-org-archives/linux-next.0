From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Fri, 24 Mar 2017 16:25:52 +1100
Message-ID: <20170324162552.2350b0de@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46633 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932186AbdCXF0G (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 24 Mar 2017 01:26:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>

Hi all,

Today's linux-next merge of the akpm-current tree got conflicts in:

  arch/x86/include/asm/atomic.h
  arch/x86/include/asm/atomic64_64.h

between commits:

  a9ebf306f52c ("locking/atomic: Introduce atomic_try_cmpxchg()")
  e6790e4b5d5e ("locking/atomic/x86: Use atomic_try_cmpxchg()")

from the tip tree and commit:

  3f4ca3d25e1a ("asm-generic, x86: wrap atomic operations")

from the akpm-current tree.

I fixed it up (see below - though more work is probably needed) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

The below resolution is not quite right so I added this on top:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 24 Mar 2017 16:14:42 +1100
Subject: [PATCH] fix for bad merge fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/include/asm/atomic.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/atomic.h b/arch/x86/include/asm/atomic.h
index fc4412567a4a..f717b73182e7 100644
--- a/arch/x86/include/asm/atomic.h
+++ b/arch/x86/include/asm/atomic.h
@@ -217,7 +217,7 @@ static inline void arch_atomic_##op(int i, atomic_t *v)			\
 }
 
 #define ATOMIC_FETCH_OP(op, c_op)					\
-static inline int atomic_fetch_##op(int i, atomic_t *v)			\
+static inline int arch_atomic_fetch_##op(int i, atomic_t *v)		\
 {									\
 	int val = arch_atomic_read(v);					\
 	do {								\
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell

diff --cc arch/x86/include/asm/atomic.h
index caa5798c92f4,95dd167eb3af..000000000000
--- a/arch/x86/include/asm/atomic.h
+++ b/arch/x86/include/asm/atomic.h
@@@ -181,20 -191,14 +191,20 @@@ static __always_inline int arch_atomic_
  	return xadd(&v->counter, -i);
  }
  
- static __always_inline int atomic_cmpxchg(atomic_t *v, int old, int new)
+ static __always_inline int arch_atomic_cmpxchg(atomic_t *v, int old, int new)
  {
- 	return cmpxchg(&v->counter, old, new);
+ 	return arch_cmpxchg(&v->counter, old, new);
  }
  
 +#define atomic_try_cmpxchg atomic_try_cmpxchg
 +static __always_inline bool atomic_try_cmpxchg(atomic_t *v, int *old, int new)
 +{
 +	return try_cmpxchg(&v->counter, old, new);
 +}
 +
- static inline int atomic_xchg(atomic_t *v, int new)
+ static inline int arch_atomic_xchg(atomic_t *v, int new)
  {
- 	return xchg(&v->counter, new);
+ 	return arch_xchg(&v->counter, new);
  }
  
  #define ATOMIC_OP(op)							\
@@@ -207,12 -211,16 +217,12 @@@ static inline void arch_atomic_##op(in
  }
  
  #define ATOMIC_FETCH_OP(op, c_op)					\
 -static inline int arch_atomic_fetch_##op(int i, atomic_t *v)		\
 +static inline int atomic_fetch_##op(int i, atomic_t *v)			\
  {									\
- 	int val = atomic_read(v);					\
 -	int old, val = arch_atomic_read(v);				\
 -	for (;;) {							\
 -		old = arch_atomic_cmpxchg(v, val, val c_op i);		\
 -		if (old == val)						\
 -			break;						\
 -		val = old;						\
 -	}								\
 -	return old;							\
++	int val = arch_atomic_read(v);					\
 +	do {								\
 +	} while (!atomic_try_cmpxchg(v, &val, val c_op i));		\
 +	return val;							\
  }
  
  #define ATOMIC_OPS(op, c_op)						\
@@@ -236,13 -244,18 +246,13 @@@ ATOMIC_OPS(xor, ^
   * Atomically adds @a to @v, so long as @v was not already @u.
   * Returns the old value of @v.
   */
- static __always_inline int __atomic_add_unless(atomic_t *v, int a, int u)
+ static __always_inline int __arch_atomic_add_unless(atomic_t *v, int a, int u)
  {
- 	int c = atomic_read(v);
 -	int c, old;
 -	c = arch_atomic_read(v);
 -	for (;;) {
 -		if (unlikely(c == (u)))
 -			break;
 -		old = arch_atomic_cmpxchg((v), c, c + (a));
 -		if (likely(old == c))
++	int c = arch_atomic_read(v);
 +	do {
 +		if (unlikely(c == u))
  			break;
 -		c = old;
 -	}
 +	} while (!atomic_try_cmpxchg(v, &c, c + a));
  	return c;
  }
  
diff --cc arch/x86/include/asm/atomic64_64.h
index 6189a433c9a9,de9555d35cb0..000000000000
--- a/arch/x86/include/asm/atomic64_64.h
+++ b/arch/x86/include/asm/atomic64_64.h
@@@ -168,23 -168,17 +168,23 @@@ static inline long arch_atomic64_fetch_
  	return xadd(&v->counter, -i);
  }
  
- #define atomic64_inc_return(v)  (atomic64_add_return(1, (v)))
- #define atomic64_dec_return(v)  (atomic64_sub_return(1, (v)))
+ #define arch_atomic64_inc_return(v)  (arch_atomic64_add_return(1, (v)))
+ #define arch_atomic64_dec_return(v)  (arch_atomic64_sub_return(1, (v)))
  
- static inline long atomic64_cmpxchg(atomic64_t *v, long old, long new)
+ static inline long arch_atomic64_cmpxchg(atomic64_t *v, long old, long new)
  {
- 	return cmpxchg(&v->counter, old, new);
+ 	return arch_cmpxchg(&v->counter, old, new);
  }
  
 +#define atomic64_try_cmpxchg atomic64_try_cmpxchg
 +static __always_inline bool atomic64_try_cmpxchg(atomic64_t *v, long *old, long new)
 +{
 +	return try_cmpxchg(&v->counter, old, new);
 +}
 +
- static inline long atomic64_xchg(atomic64_t *v, long new)
+ static inline long arch_atomic64_xchg(atomic64_t *v, long new)
  {
- 	return xchg(&v->counter, new);
+ 	return arch_xchg(&v->counter, new);
  }
  
  /**
@@@ -196,29 -190,35 +196,29 @@@
   * Atomically adds @a to @v, so long as it was not @u.
   * Returns the old value of @v.
   */
- static inline bool atomic64_add_unless(atomic64_t *v, long a, long u)
+ static inline bool arch_atomic64_add_unless(atomic64_t *v, long a, long u)
  {
- 	long c = atomic64_read(v);
 -	long c, old;
 -	c = arch_atomic64_read(v);
 -	for (;;) {
 -		if (unlikely(c == (u)))
 -			break;
 -		old = arch_atomic64_cmpxchg((v), c, c + (a));
 -		if (likely(old == c))
 -			break;
 -		c = old;
 -	}
 -	return c != (u);
++	long c = arch_atomic64_read(v);
 +	do {
 +		if (unlikely(c == u))
 +			return false;
 +	} while (!atomic64_try_cmpxchg(v, &c, c + a));
 +	return true;
  }
  
- #define atomic64_inc_not_zero(v) atomic64_add_unless((v), 1, 0)
+ #define arch_atomic64_inc_not_zero(v) arch_atomic64_add_unless((v), 1, 0)
  
  /*
-  * atomic64_dec_if_positive - decrement by 1 if old value positive
+  * arch_atomic64_dec_if_positive - decrement by 1 if old value positive
   * @v: pointer of type atomic_t
   *
   * The function returns the old value of *v minus 1, even if
   * the atomic variable, v, was not decremented.
   */
- static inline long atomic64_dec_if_positive(atomic64_t *v)
+ static inline long arch_atomic64_dec_if_positive(atomic64_t *v)
  {
- 	long dec, c = atomic64_read(v);
 -	long c, old, dec;
 -	c = arch_atomic64_read(v);
 -	for (;;) {
++	long dec, c = arch_atomic64_read(v);
 +	do {
  		dec = c - 1;
  		if (unlikely(dec < 0))
  			break;
@@@ -236,12 -240,16 +236,12 @@@ static inline void arch_atomic64_##op(l
  }
  
  #define ATOMIC64_FETCH_OP(op, c_op)					\
- static inline long atomic64_fetch_##op(long i, atomic64_t *v)		\
+ static inline long arch_atomic64_fetch_##op(long i, atomic64_t *v)	\
  {									\
- 	long val = atomic64_read(v);					\
 -	long old, val = arch_atomic64_read(v);				\
 -	for (;;) {							\
 -		old = arch_atomic64_cmpxchg(v, val, val c_op i);	\
 -		if (old == val)						\
 -			break;						\
 -		val = old;						\
 -	}								\
 -	return old;							\
++	long val = arch_atomic64_read(v);				\
 +	do {								\
 +	} while (!atomic64_try_cmpxchg(v, &val, val c_op i));		\
 +	return val;							\
  }
  
  #define ATOMIC64_OPS(op, c_op)						\
