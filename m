From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [BUG -next] "futex: switch to USER_DS for futex test" breaks s390
Date: Fri, 3 Jan 2014 15:42:30 +0100
Message-ID: <CAMuHMdVqP7RpZMMOk7DJYzYcOvXM68zsFeYd0JTvYNLaSAf2DQ@mail.gmail.com>
References: <20140103141943.GA4219@osiris>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:54931 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751920AbaACOma (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 Jan 2014 09:42:30 -0500
Received: by mail-pa0-f45.google.com with SMTP id fb1so15909902pad.32
        for <linux-next@vger.kernel.org>; Fri, 03 Jan 2014 06:42:30 -0800 (PST)
In-Reply-To: <20140103141943.GA4219@osiris>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Tuxist <tuxist@tuxist.de>, Patrick McCarthy <patrickjmc@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, Finn Thain <fthain@telegraphics.com.au>, Rusty Russell <rusty@rustcorp.com.au>, Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@linux.intel.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Linux-Next <linux-next@vger.kernel.org>

Hi Heiko,

On Fri, Jan 3, 2014 at 3:19 PM, Heiko Carstens
<heiko.carstens@de.ibm.com> wrote:
> your patch "futex: switch to USER_DS for futex test" in linux-next now causes
> s390 to die on boot

Oops, sorry for that. So Andrew was right to let it cook a bit longer in -next,
for 3.14.

> Now, this seems to be wrong. It was intended to cause a fault while in kernel
> space. When accessing user space current->mm must not be NULL, but it is, since
> this is early code and we have no user space context to operate with.
>
> Hence at least s390's page tables aren't setup yet to handle this correctly.
> Actually our code dies when walking page tables and trying to acquire current's
> mm->page_table_lock, which points to nowhere.

m68k do_page_fault() has:

        /*
         * If we're in an interrupt or have no user
         * context, we must not take the fault..
         */
        if (in_atomic() || !mm)
                goto no_context;

so we abort if there's no mm (but in this specific case it was already
aborted due
to the in_atomic() test).

Actually s390 do_exception() has similar checks:

        /*
         * Verify that the fault happened in user space, that
         * we are not in an interrupt and that there is a
         * user context.
         */
        fault = VM_FAULT_BADCONTEXT;
        if (unlikely(!user_space_fault(trans_exc_code) || in_atomic() || !mm))
                goto out;

But as it fails for you, it crashes before you get to that point?

> I'm wondering why m68k's exception handling for put/get_user doesn't fixup
> the instruction pointers and these functions simply return -EFAULT?

The fixup only happens for pointers in userspace context.
In kernel context, we die.

> Also m68k's futex_atomic_cmpxchg_inatomic() implementation seems to miss a
> page_fault_disable()/page_fault_enable() pair.

I'm not a futex hero, but FWIW, cmpxchg_futex_value_locked() calls
page_fault_disable() before calling futex_atomic_cmpxchg_inatomic().
The inatomic suffix indicates we're already in an atomic context, right?

> Since this is already the second or third time this specific futex code causes
> problems on s390, it would be nice if we could get rid of it. E.g. with the
> following patch:

Yeah, recently Linus was optimizing the code so the compiler would eliminate
the test for him...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
