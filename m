From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: [BUG -next] "futex: switch to USER_DS for futex test" breaks s390
Date: Fri, 3 Jan 2014 16:36:51 +0100
Message-ID: <20140103153651.GB4219@osiris>
References: <20140103141943.GA4219@osiris>
 <CAMuHMdVqP7RpZMMOk7DJYzYcOvXM68zsFeYd0JTvYNLaSAf2DQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp17.uk.ibm.com ([195.75.94.113]:59610 "EHLO
	e06smtp17.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751966AbaACPg5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 Jan 2014 10:36:57 -0500
Received: from /spool/local
	by e06smtp17.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Fri, 3 Jan 2014 15:36:55 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id BE04F1B0805F
	for <linux-next@vger.kernel.org>; Fri,  3 Jan 2014 15:36:09 +0000 (GMT)
Received: from d06av09.portsmouth.uk.ibm.com (d06av09.portsmouth.uk.ibm.com [9.149.37.250])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id s03FafoZ56164554
	for <linux-next@vger.kernel.org>; Fri, 3 Jan 2014 15:36:41 GMT
Received: from d06av09.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id s03Fapqs010362
	for <linux-next@vger.kernel.org>; Fri, 3 Jan 2014 08:36:52 -0700
Content-Disposition: inline
In-Reply-To: <CAMuHMdVqP7RpZMMOk7DJYzYcOvXM68zsFeYd0JTvYNLaSAf2DQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Tuxist <tuxist@tuxist.de>, Patrick McCarthy <patrickjmc@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, Finn Thain <fthain@telegraphics.com.au>, Rusty Russell <rusty@rustcorp.com.au>, Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@linux.intel.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Linux-Next <linux-next@vger.kernel.org>

On Fri, Jan 03, 2014 at 03:42:30PM +0100, Geert Uytterhoeven wrote:
> Hi Heiko,

[...]

> m68k do_page_fault() has:
> 
>         /*
>          * If we're in an interrupt or have no user
>          * context, we must not take the fault..
>          */
>         if (in_atomic() || !mm)
>                 goto no_context;
> 
> so we abort if there's no mm (but in this specific case it was already
> aborted due
> to the in_atomic() test).
> 
> Actually s390 do_exception() has similar checks:
> 
>         /*
>          * Verify that the fault happened in user space, that
>          * we are not in an interrupt and that there is a
>          * user context.
>          */
>         fault = VM_FAULT_BADCONTEXT;
>         if (unlikely(!user_space_fault(trans_exc_code) || in_atomic() || !mm))
>                 goto out;
> 
> But as it fails for you, it crashes before you get to that point?

Yes, for futex cmpxchg operations we walk the page tables 'by hand' and do not
let the hardware do that. This is usually not a problem since current->mm is
(must be) valid.

> > I'm wondering why m68k's exception handling for put/get_user doesn't fixup
> > the instruction pointers and these functions simply return -EFAULT?
> 
> The fixup only happens for pointers in userspace context.
> In kernel context, we die.

But... you *should* fix that also up in kernel space. That's the only reason
why the futex check works at all on any architecture so far.

There is also other code that relies on this: e.g. copy_mount_options() my be
called with KERNEL_DS. If DEBUG_PAGEALLOC is turned on, it would crash badly
in kernel space if it crosses page boundaries and touches an invalid page,
even though it should survive...

> > Also m68k's futex_atomic_cmpxchg_inatomic() implementation seems to miss a
> > page_fault_disable()/page_fault_enable() pair.
> 
> I'm not a futex hero, but FWIW, cmpxchg_futex_value_locked() calls
> page_fault_disable() before calling futex_atomic_cmpxchg_inatomic().
> The inatomic suffix indicates we're already in an atomic context, right?

Yes, you're right, I was wrong :)
