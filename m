From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the tip tree with the sh tree
Date: Tue, 26 Jul 2016 08:30:01 +1000
Message-ID: <20160726083001.4f7bf2a8@canb.auug.org.au>
References: <20160724151342.32b35c80@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160724151342.32b35c80@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Rich Felker <dalias@libc.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

Hi all,

On Sun, 24 Jul 2016 15:13:42 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   arch/sh/include/asm/spinlock.h
> 
> between commit:
> 
>   2da83dfce7df ("sh: add J2 atomics using the cas.l instruction")
> 
> from the sh tree and commit:
> 
>   726328d92a42 ("locking/spinlock, arch: Update and fix spin_unlock_wait() implementations")
> 
> from the tip tree.
> 
> I fixed it up (I used this file from the sh tree and then added the merge
> fix patch below) and can carry the fix as necessary. This is now fixed
> as far as linux-next is concerned, but any non trivial conflicts should
> be mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Sun, 24 Jul 2016 15:09:57 +1000
> Subject: [PATCH] locking/spinlock, arch: merge fix for "sh: add J2 atomics
>  using the cas.l instruction"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/sh/include/asm/spinlock-cas.h  | 10 ++++++++--
>  arch/sh/include/asm/spinlock-llsc.h | 10 ++++++++--
>  2 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/sh/include/asm/spinlock-cas.h b/arch/sh/include/asm/spinlock-cas.h
> index a2a7c10b30d9..c46e8cc7b515 100644
> --- a/arch/sh/include/asm/spinlock-cas.h
> +++ b/arch/sh/include/asm/spinlock-cas.h
> @@ -10,6 +10,9 @@
>  #ifndef __ASM_SH_SPINLOCK_CAS_H
>  #define __ASM_SH_SPINLOCK_CAS_H
>  
> +#include <asm/barrier.h>
> +#include <asm/processor.h>
> +
>  static inline unsigned __sl_cas(volatile unsigned *p, unsigned old, unsigned new)
>  {
>  	__asm__ __volatile__("cas.l %1,%0,@r0"
> @@ -25,8 +28,11 @@ static inline unsigned __sl_cas(volatile unsigned *p, unsigned old, unsigned new
>  
>  #define arch_spin_is_locked(x)		((x)->lock <= 0)
>  #define arch_spin_lock_flags(lock, flags) arch_spin_lock(lock)
> -#define arch_spin_unlock_wait(x) \
> -	do { while (arch_spin_is_locked(x)) cpu_relax(); } while (0)
> +
> +static inline void arch_spin_unlock_wait(arch_spinlock_t *lock)
> +{
> +	smp_cond_load_acquire(&lock->lock, VAL > 0);
> +}
>  
>  static inline void arch_spin_lock(arch_spinlock_t *lock)
>  {
> diff --git a/arch/sh/include/asm/spinlock-llsc.h b/arch/sh/include/asm/spinlock-llsc.h
> index 238ef6f54dcc..cec78143fa83 100644
> --- a/arch/sh/include/asm/spinlock-llsc.h
> +++ b/arch/sh/include/asm/spinlock-llsc.h
> @@ -11,14 +11,20 @@
>  #ifndef __ASM_SH_SPINLOCK_LLSC_H
>  #define __ASM_SH_SPINLOCK_LLSC_H
>  
> +#include <asm/barrier.h>
> +#include <asm/processor.h>
> +
>  /*
>   * Your basic SMP spinlocks, allowing only a single CPU anywhere
>   */
>  
>  #define arch_spin_is_locked(x)		((x)->lock <= 0)
>  #define arch_spin_lock_flags(lock, flags) arch_spin_lock(lock)
> -#define arch_spin_unlock_wait(x) \
> -	do { while (arch_spin_is_locked(x)) cpu_relax(); } while (0)
> +
> +static inline void arch_spin_unlock_wait(arch_spinlock_t *lock)
> +{
> +	smp_cond_load_acquire(&lock->lock, VAL > 0);
> +}
>  
>  /*
>   * Simple spin lock operations.  There are two variants, one clears IRQ's
> -- 
> 2.8.1

Since Linus has merged part of the tip tree, this conflict resolution
is now needed when the sh tree is merged with Linus' tree.

-- 
Cheers,
Stephen Rothwell
