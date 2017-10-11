From: Will Deacon <will.deacon@arm.com>
Subject: Re: linux-next: manual merge of the tip tree with the FIXME tree
Date: Wed, 11 Oct 2017 18:23:29 +0100
Message-ID: <20171011172328.GB14971@arm.com>
References: <20171011161035.sudulg5gpvw4lp4o@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:36618 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751712AbdJKRX0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Oct 2017 13:23:26 -0400
Content-Disposition: inline
In-Reply-To: <20171011161035.sudulg5gpvw4lp4o@sirena.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Mark,

On Wed, Oct 11, 2017 at 05:10:35PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   arch/s390/include/asm/spinlock.h
> 
> between a series of commits adding wait queuing to s390 spinlocks
> from the s390 tree:
> 
> eb3b7b848fb3dd00f7a57d633 s390/rwlock: introduce rwlock wait queueing
> b96f7d881ad94203e997cd2aa s390/spinlock: introduce spinlock wait queueing
> 8153380379ecc8381f6d55f64 s390/spinlock: use the cpu number +1 as spinlock value
> 
> and Will's series of commits removing dummy implementations of spinlock
> related things from the tip tree:
> 
> a4c1887d4c1462b0ec5a8989f locking/arch: Remove dummy arch_{read,spin,write}_lock_flags() implementations
> 0160fb177d484367e041ac251 locking/arch: Remove dummy arch_{read,spin,write}_relax() implementations
> a8a217c22116eff6c120d753c locking/core: Remove {read,spin,write}_can_lock()
> 
> I'm don't feel confident I can resolve this conflict sensibly without
> taking too long so I've used the tip tree from yesterday.

It's a shame that the conflict is so messy -- most of it is just context
because that file has changed a lot in the s390 tree so the cleanup doesn't
apply. I resolved it below.

On the plus side, it's one less implementation of arch_{read,write}_relax!

Will

--->8

diff --cc arch/s390/include/asm/spinlock.h
index 09e783d83d5d,9fa855f91e55..e31f554a3aa8
--- a/arch/s390/include/asm/spinlock.h
+++ b/arch/s390/include/asm/spinlock.h
@@@ -35,7 -35,7 +35,8 @@@ bool arch_vcpu_is_preempted(int cpu)
   * (the type definitions are in asm/spinlock_types.h)
   */
  
 -void arch_lock_relax(int cpu);
 +void arch_spin_relax(arch_spinlock_t *lock);
++#define arch_spin_relax		arch_spin_relax
  
  void arch_spin_lock_wait(arch_spinlock_t *);
  int arch_spin_trylock_retry(arch_spinlock_t *);
@@@ -72,8 -79,9 +73,9 @@@ static inline void arch_spin_lock_flags
  					unsigned long flags)
  {
  	if (!arch_spin_trylock_once(lp))
 -		arch_spin_lock_wait_flags(lp, flags);
 +		arch_spin_lock_wait(lp);
  }
+ #define arch_spin_lock_flags	arch_spin_lock_flags
  
  static inline int arch_spin_trylock(arch_spinlock_t *lp)
  {
@@@ -105,25 -112,58 +107,8 @@@ static inline void arch_spin_unlock(arc
   * read-locks.
   */
  
- /**
-  * read_can_lock - would read_trylock() succeed?
-  * @lock: the rwlock in question.
-  */
- #define arch_read_can_lock(x) (((x)->cnts & 0xffff0000) == 0)
 -extern int _raw_read_trylock_retry(arch_rwlock_t *lp);
 -extern int _raw_write_trylock_retry(arch_rwlock_t *lp);
--
- /**
-  * write_can_lock - would write_trylock() succeed?
-  * @lock: the rwlock in question.
-  */
- #define arch_write_can_lock(x) ((x)->cnts == 0)
 -static inline int arch_read_trylock_once(arch_rwlock_t *rw)
 -{
 -	int old = ACCESS_ONCE(rw->lock);
 -	return likely(old >= 0 &&
 -		      __atomic_cmpxchg_bool(&rw->lock, old, old + 1));
 -}
--
- #define arch_read_lock_flags(lock, flags) arch_read_lock(lock)
- #define arch_write_lock_flags(lock, flags) arch_write_lock(lock)
- #define arch_read_relax(rw) barrier()
- #define arch_write_relax(rw) barrier()
 -static inline int arch_write_trylock_once(arch_rwlock_t *rw)
 -{
 -	int old = ACCESS_ONCE(rw->lock);
 -	return likely(old == 0 &&
 -		      __atomic_cmpxchg_bool(&rw->lock, 0, 0x80000000));
 -}
 -
 -#ifdef CONFIG_HAVE_MARCH_Z196_FEATURES
 -
 -#define __RAW_OP_OR	"lao"
 -#define __RAW_OP_AND	"lan"
 -#define __RAW_OP_ADD	"laa"
 -
 -#define __RAW_LOCK(ptr, op_val, op_string)		\
 -({							\
 -	int old_val;					\
 -							\
 -	typecheck(int *, ptr);				\
 -	asm volatile(					\
 -		op_string "	%0,%2,%1\n"		\
 -		"bcr	14,0\n"				\
 -		: "=d" (old_val), "+Q" (*ptr)		\
 -		: "d" (op_val)				\
 -		: "cc", "memory");			\
 -	old_val;					\
 -})
 -
 -#define __RAW_UNLOCK(ptr, op_val, op_string)		\
 -({							\
 -	int old_val;					\
 -							\
 -	typecheck(int *, ptr);				\
 -	asm volatile(					\
 -		op_string "	%0,%2,%1\n"		\
 -		: "=d" (old_val), "+Q" (*ptr)		\
 -		: "d" (op_val)				\
 -		: "cc", "memory");			\
 -	old_val;					\
 -})
--
 -extern void _raw_read_lock_wait(arch_rwlock_t *lp);
 -extern void _raw_write_lock_wait(arch_rwlock_t *lp, int prev);
 +void arch_read_lock_wait(arch_rwlock_t *lp);
 +void arch_write_lock_wait(arch_rwlock_t *lp);
  
  static inline void arch_read_lock(arch_rwlock_t *rw)
  {
