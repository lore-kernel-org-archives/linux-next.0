From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: build warnings after merge of the access_once tree
Date: Thu, 26 Mar 2015 09:21:50 -0700
Message-ID: <CA+55aFyKR3uem_dgSin5wtYdKCBnyM5X9gbRUPfdF1ofeON_1g@mail.gmail.com>
References: <20150326193112.2c87eb39@canb.auug.org.au>
	<20150326103442.GV21418@twins.programming.kicks-ass.net>
	<20150326132750.GA2805@arm.com>
	<20150326142220.GY21418@twins.programming.kicks-ass.net>
	<CA+55aFyLTc72-xTkjugVSMb3EQq=+__UcFe28agu086xf9d6ZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:36461 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752094AbbCZQVv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Mar 2015 12:21:51 -0400
In-Reply-To: <CA+55aFyLTc72-xTkjugVSMb3EQq=+__UcFe28agu086xf9d6ZA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will.deacon@arm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Christian Borntraeger <borntraeger@de.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Paul McKenney <paulmck@linux.vnet.ibm.com>

On Thu, Mar 26, 2015 at 9:15 AM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Really. Just get rid of the checks - they were wrong. They were
> clearly very close to *introducing* a bug, rather than fixing anything
> at all.

Side note: we will continue to expect the compiler to do single-word
accesses as a single acccess, rather than splitting things up. And
that's fine. READ_ONCE() uses "volatile", and it means on a language
level that the actual access is "visible", so it's a reasonable
expectation to have.

So the proper patch looks something like this:

    diff --git a/include/linux/compiler.h b/include/linux/compiler.h
    index 1b45e4a0519b..f36e1abf56ea 100644
    --- a/include/linux/compiler.h
    +++ b/include/linux/compiler.h
    @@ -198,10 +198,6 @@ __compiletime_warning("data access exceeds
word size and won't be atomic")
     #endif
     ;

    -static __always_inline void data_access_exceeds_word_size(void)
    -{
    -}
    -
     static __always_inline void __read_once_size(const volatile void
*p, void *res, int size)
     {
             switch (size) {
    @@ -214,7 +210,6 @@ static __always_inline void
__read_once_size(const volatile void *p, void *res,
             default:
                     barrier();
                     __builtin_memcpy((void *)res, (const void *)p, size);
    -                data_access_exceeds_word_size();
                     barrier();
             }
     }
    @@ -231,7 +226,6 @@ static __always_inline void
__write_once_size(volatile void *p, void *res, int s
             default:
                     barrier();
                     __builtin_memcpy((void *)p, (const void *)res, size);
    -                data_access_exceeds_word_size();
                     barrier();
             }
     }

and let's just leave it at that.

Note again how the default case just guarantees that it is never
reloaded by the compiler. That's the primary issue this is all about.
The whole "we expect the compiler to not be shit" is secondary and
_may_ be an issue in some places, but is not what the main goal is.

                             Linus
