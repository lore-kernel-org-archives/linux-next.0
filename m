From: Will Deacon <will.deacon@arm.com>
Subject: Re: linux-next: build warnings after merge of the access_once tree
Date: Thu, 26 Mar 2015 17:17:23 +0000
Message-ID: <20150326171723.GA22620@arm.com>
References: <20150326193112.2c87eb39@canb.auug.org.au>
 <20150326103442.GV21418@twins.programming.kicks-ass.net>
 <20150326132750.GA2805@arm.com>
 <20150326142220.GY21418@twins.programming.kicks-ass.net>
 <CA+55aFyLTc72-xTkjugVSMb3EQq=+__UcFe28agu086xf9d6ZA@mail.gmail.com>
 <CA+55aFyKR3uem_dgSin5wtYdKCBnyM5X9gbRUPfdF1ofeON_1g@mail.gmail.com>
 <20150326163647.GC21418@twins.programming.kicks-ass.net>
 <CA+55aFw1WHJqSj+z-mJGY-kxrg_OsGp9jK9VBi+wB4zPgCkv_w@mail.gmail.com>
 <20150326170748.GD21418@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150326170748.GD21418@twins.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Christian Borntraeger <borntraeger@de.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@elte.hu>, Davidlohr Bueso <dave@stgolabs.net>, Paul McKenney <paulmck@linux.vnet.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>
List-Id: linux-next.vger.kernel.org

On Thu, Mar 26, 2015 at 05:07:48PM +0000, Peter Zijlstra wrote:
> On Thu, Mar 26, 2015 at 09:45:07AM -0700, Linus Torvalds wrote:
> 
> > Stop this idiocy.
> 
> Yeah, clearly I can type faster than I can think straight :/
> 
> 
> In any case, I've the below patch; do you want to take it now or do you
> want me to route it through tip/locking/urgent or something like that?

This patch also works fine for me. I managed to get the compiler to split a
64-bit load into 2x32-bit loads using memcpy, so I do like keeping the
8-byte case available for 32-bit architectures than can make use of it.

	Acked-by: Will Deacon <will.deacon@arm.com>

Will

> Subject: kernel: Remove atomicy checks from {READ,WRITE}_ONCE
> From: Peter Zijlstra <peterz@infradead.org>
> Date: Thu, 26 Mar 2015 17:45:37 +0100
> 
> The fact that volatile allows for atomic load/stores is a special case
> not a requirement for {READ,WRITE}_ONCE(). Their primary purpose is to
> force the compiler to emit load/stores _once_.
> 
> So remove the warning as it is correct behaviour. This also implies that
> the u64 case is not 64bit only, so remove the #ifdef so we can generate
> better code in that case.
> 
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@elte.hu>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Davidlohr Bueso <dave@stgolabs.net>
> Cc: Paul McKenney <paulmck@linux.vnet.ibm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Acked-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  include/linux/compiler.h | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> index 1b45e4a0519b..0e41ca0e5927 100644
> --- a/include/linux/compiler.h
> +++ b/include/linux/compiler.h
> @@ -192,29 +192,16 @@ void ftrace_likely_update(struct ftrace_branch_data *f, int val, int expect);
>  
>  #include <uapi/linux/types.h>
>  
> -static __always_inline void data_access_exceeds_word_size(void)
> -#ifdef __compiletime_warning
> -__compiletime_warning("data access exceeds word size and won't be atomic")
> -#endif
> -;
> -
> -static __always_inline void data_access_exceeds_word_size(void)
> -{
> -}
> -
>  static __always_inline void __read_once_size(const volatile void *p, void *res, int size)
>  {
>  	switch (size) {
>  	case 1: *(__u8 *)res = *(volatile __u8 *)p; break;
>  	case 2: *(__u16 *)res = *(volatile __u16 *)p; break;
>  	case 4: *(__u32 *)res = *(volatile __u32 *)p; break;
> -#ifdef CONFIG_64BIT
>  	case 8: *(__u64 *)res = *(volatile __u64 *)p; break;
> -#endif
>  	default:
>  		barrier();
>  		__builtin_memcpy((void *)res, (const void *)p, size);
> -		data_access_exceeds_word_size();
>  		barrier();
>  	}
>  }
> @@ -225,13 +212,10 @@ static __always_inline void __write_once_size(volatile void *p, void *res, int s
>  	case 1: *(volatile __u8 *)p = *(__u8 *)res; break;
>  	case 2: *(volatile __u16 *)p = *(__u16 *)res; break;
>  	case 4: *(volatile __u32 *)p = *(__u32 *)res; break;
> -#ifdef CONFIG_64BIT
>  	case 8: *(volatile __u64 *)p = *(__u64 *)res; break;
> -#endif
>  	default:
>  		barrier();
>  		__builtin_memcpy((void *)p, (const void *)res, size);
> -		data_access_exceeds_word_size();
>  		barrier();
>  	}
>  }
> 
