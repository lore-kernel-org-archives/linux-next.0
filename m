From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: linux-next: build warnings after merge of the access_once tree
Date: Thu, 26 Mar 2015 18:24:21 +0100
Message-ID: <551440C5.8040104@de.ibm.com>
References: <20150326193112.2c87eb39@canb.auug.org.au> <20150326103442.GV21418@twins.programming.kicks-ass.net> <20150326132750.GA2805@arm.com> <20150326142220.GY21418@twins.programming.kicks-ass.net> <CA+55aFyLTc72-xTkjugVSMb3EQq=+__UcFe28agu086xf9d6ZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+55aFyLTc72-xTkjugVSMb3EQq=+__UcFe28agu086xf9d6ZA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will.deacon@arm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Paul McKenney <paulmck@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

Am 26.03.2015 um 17:15 schrieb Linus Torvalds:
> On Thu, Mar 26, 2015 at 7:22 AM, Peter Zijlstra <peterz@infradead.org> wrote:
>>
>> So we can either just remove the READ_ONCE(), or replace it with a
>> leading barrier() call just to be on the paranoid side of things.
> 
> NOOO!
> 
>> Any preferences?
> 
> Not a preference: a _requirement_.
> 
> Get rid of the f*cking size checks etc on READ_ONCE() and friends.

Oh I just added that check back then because some guy named
Linus suggested something like that ;-)

--- snip ---
(Btw, it's not just aggregate types, even non-aggregate types like
"long long" are not necessarily safe, to give the same 64-bit on
x86-32 example. So adding an assert that it's smaller or equal in size
to a "long" might also not be unreasonable)
--- snip ---

https://www.marc.info/?l=linux-kernel&m=141565366209769&w=1

I am fine with Peters patch :-)

Christian

> 
> They are about - wait for it - "reading a value once".
> 
> Note how it doesn't say ANYTHING about "atomic" or anything like that.
> It's about reading *ONCE*.


> 
>> Something like so, but with a sensible comment I suppose.
> 
> Hell f*cking no. The "something like so" is huge and utter crap,
> because the barrier is on the wrong side.
> 
>> -       old.lock_count = READ_ONCE(lockref->lock_count);                        \
>> +       barrier();                                                              \
>> +       old.lock_count = lockref->lock_count;                                   \
>>         while (likely(arch_spin_value_unlocked(old.lock.rlock.raw_lock))) {     \
>>                 struct lockref new = old, prev = old;                           \
> 
> The WHOLE point of the READ_ONCE (formerly ACCESS_ONCE) is that it
> tells the compiler that it cannot reload the value.
> 
> Notice how it is *not* about atomicitiy. The compiler can read the
> value in fifteen pieces, randomly mixing one bit or five. Nobody
> cares.
> 
> But the important thing is that ONCE IT IS READ, it is never read
> again. That's the "once" part.
> 
> Why is that important? It's important because we have to absolutely
> guartantee that the value we *test* is the same value we use later.
> That's a common concern with mutable variables, and is the only reason
> for READ_ONCE() in the first place.
> 
> The whole atomicity etc crap was just that - crap. It was never about
> atomicitiy. It was about the compiler not reloading values.
> 
> So no. No barriers. No "removal of READ_ONCE". Just get rid of the
> broken "sanity" checks in the READ_ONCE implementation that are just
> pure garbage.
> 
> The checks in ACCESS_ONCE() were because apparently gcc got things
> wrong - dropping the volatile - for aggregate types. They were never
> supposed to be about atomicity, even if there clearly was some
> confusion about that.
> 
> Really. Just get rid of the checks - they were wrong. They were
> clearly very close to *introducing* a bug, rather than fixing anything
> at all.
> 
>                              Linus
> 
