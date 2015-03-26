From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: build warnings after merge of the access_once tree
Date: Thu, 26 Mar 2015 17:36:47 +0100
Message-ID: <20150326163647.GC21418@twins.programming.kicks-ass.net>
References: <20150326193112.2c87eb39@canb.auug.org.au>
 <20150326103442.GV21418@twins.programming.kicks-ass.net>
 <20150326132750.GA2805@arm.com>
 <20150326142220.GY21418@twins.programming.kicks-ass.net>
 <CA+55aFyLTc72-xTkjugVSMb3EQq=+__UcFe28agu086xf9d6ZA@mail.gmail.com>
 <CA+55aFyKR3uem_dgSin5wtYdKCBnyM5X9gbRUPfdF1ofeON_1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:53403 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751533AbbCZQgz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Mar 2015 12:36:55 -0400
Content-Disposition: inline
In-Reply-To: <CA+55aFyKR3uem_dgSin5wtYdKCBnyM5X9gbRUPfdF1ofeON_1g@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will.deacon@arm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Christian Borntraeger <borntraeger@de.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Paul McKenney <paulmck@linux.vnet.ibm.com>

On Thu, Mar 26, 2015 at 09:21:50AM -0700, Linus Torvalds wrote:
> So the proper patch looks something like this:
> 
>     diff --git a/include/linux/compiler.h b/include/linux/compiler.h
>     index 1b45e4a0519b..f36e1abf56ea 100644
>     --- a/include/linux/compiler.h
>     +++ b/include/linux/compiler.h
>     @@ -198,10 +198,6 @@ __compiletime_warning("data access exceeds
> word size and won't be atomic")
>      #endif
>      ;

You also want to get rid of that ^^^ declaration which includes the
compiletime warning.

>     -static __always_inline void data_access_exceeds_word_size(void)
>     -{
>     -}
>     -
>      static __always_inline void __read_once_size(const volatile void
> *p, void *res, int size)
>      {
>              switch (size) {
>     @@ -214,7 +210,6 @@ static __always_inline void
> __read_once_size(const volatile void *p, void *res,
>              default:
>                      barrier();
>                      __builtin_memcpy((void *)res, (const void *)p, size);
>     -                data_access_exceeds_word_size();
>                      barrier();
>              }
>      }
>     @@ -231,7 +226,6 @@ static __always_inline void
> __write_once_size(volatile void *p, void *res, int s
>              default:
>                      barrier();
>                      __builtin_memcpy((void *)p, (const void *)res, size);
>     -                data_access_exceeds_word_size();
>                      barrier();
>              }
>      }

So this still has the potential to generate significantly worse code
than the previous ACCESS_ONCE() because of the dual barrier() and god
only knows how memcpy gets implemented.

As it turns out, the ARM version of __builtin_memcpy() does result in a
single double word load because its all smart and such, but a 'trivial'
implementation might just end up doing 8 byte copies.

Can't we make an argument that these barrier calls are not required? The
memcpy() call already guarantees we emit the loads and its opaque so the
compiler cannot 'cache' the value. So I see not immediate reason for the
dual memory clobber.
