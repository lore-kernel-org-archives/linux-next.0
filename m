From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the tip tree with the arm64 tree
Date: Tue, 14 Nov 2017 09:52:21 +1100
Message-ID: <20171114095221.0b443af1@canb.auug.org.au>
References: <20171101164718.66c27003@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171101164718.66c27003@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Will Deacon <will.deacon@arm.com>
List-Id: linux-next.vger.kernel.org

Hi all,

On Wed, 1 Nov 2017 16:47:18 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   arch/arm64/Kconfig
> 
> between commit:
> 
>   396a5d4a5c32 ("arm64: Unconditionally support {ARCH_}HAVE_NMI{_SAFE_CMPXCHG}")
> 
> from the arm64 tree and commit:
> 
>   087133ac9076 ("locking/qrwlock, arm64: Move rwlock implementation over to qrwlocks")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc arch/arm64/Kconfig
> index 38f8d26208af,6205f521b648..000000000000
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@@ -21,8 -21,25 +21,25 @@@ config ARM6
>   	select ARCH_HAS_STRICT_KERNEL_RWX
>   	select ARCH_HAS_STRICT_MODULE_RWX
>   	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>  -	select ARCH_HAVE_NMI_SAFE_CMPXCHG if ACPI_APEI_SEA
>  +	select ARCH_HAVE_NMI_SAFE_CMPXCHG
> + 	select ARCH_INLINE_READ_LOCK if !PREEMPT
> + 	select ARCH_INLINE_READ_LOCK_BH if !PREEMPT
> + 	select ARCH_INLINE_READ_LOCK_IRQ if !PREEMPT
> + 	select ARCH_INLINE_READ_LOCK_IRQSAVE if !PREEMPT
> + 	select ARCH_INLINE_READ_UNLOCK if !PREEMPT
> + 	select ARCH_INLINE_READ_UNLOCK_BH if !PREEMPT
> + 	select ARCH_INLINE_READ_UNLOCK_IRQ if !PREEMPT
> + 	select ARCH_INLINE_READ_UNLOCK_IRQRESTORE if !PREEMPT
> + 	select ARCH_INLINE_WRITE_LOCK if !PREEMPT
> + 	select ARCH_INLINE_WRITE_LOCK_BH if !PREEMPT
> + 	select ARCH_INLINE_WRITE_LOCK_IRQ if !PREEMPT
> + 	select ARCH_INLINE_WRITE_LOCK_IRQSAVE if !PREEMPT
> + 	select ARCH_INLINE_WRITE_UNLOCK if !PREEMPT
> + 	select ARCH_INLINE_WRITE_UNLOCK_BH if !PREEMPT
> + 	select ARCH_INLINE_WRITE_UNLOCK_IRQ if !PREEMPT
> + 	select ARCH_INLINE_WRITE_UNLOCK_IRQRESTORE if !PREEMPT
>   	select ARCH_USE_CMPXCHG_LOCKREF
> + 	select ARCH_USE_QUEUED_RWLOCKS
>   	select ARCH_SUPPORTS_MEMORY_FAILURE
>   	select ARCH_SUPPORTS_ATOMIC_RMW
>   	select ARCH_SUPPORTS_NUMA_BALANCING

Just a reminder that this conflict still exists (but is now between the
arm64 and Linus' trees - since part of the tip tree has been merged).

-- 
Cheers,
Stephen Rothwell
