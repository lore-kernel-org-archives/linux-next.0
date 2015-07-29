From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Wed, 29 Jul 2015 10:47:33 -0700
Message-ID: <CALCETrX=hriW8sEjA1fV4et6HDFX9rMD94TdJd9pe07TkbRaqg@mail.gmail.com>
References: <20150728160015.142f588f@canb.auug.org.au> <20150729171256.GA10863@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-la0-f48.google.com ([209.85.215.48]:34776 "EHLO
	mail-la0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752008AbbG2Rry (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2015 13:47:54 -0400
Received: by lafd3 with SMTP id d3so10894674laf.1
        for <linux-next@vger.kernel.org>; Wed, 29 Jul 2015 10:47:53 -0700 (PDT)
In-Reply-To: <20150729171256.GA10863@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrea Arcangeli <aarcange@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Eric B Munson <emunson@akamai.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>

On Wed, Jul 29, 2015 at 10:12 AM, Andrea Arcangeli <aarcange@redhat.com> wrote:
> Hello Stephen,
>
> On Tue, Jul 28, 2015 at 04:00:15PM +1000, Stephen Rothwell wrote:
>>  -359 i386    userfaultfd             sys_userfaultfd
>> ++374 i386    userfaultfd             sys_userfaultfd
>
> Do I understand correctly the syscall number of userfaultfd for x86
> 32bit has just changed from 359 to 374? Appreciated that you CCed me
> on such a relevant change to be sure I didn't miss it.
>
> Then the below is needed as well.
>
> One related question: is it ok to ship kernels in production right now
> with the userfaultfd syscall number 374 for x86 32bit ABI (after the
> above change) and 323 for x86-64 64bit ABI, with these syscalls number
> registered in linux-next or it may keep changing like it has just
> happened? I refer only to userfaultfd syscalls of x86 32bit and x86-64
> 64bit, not all other syscalls in linux-next.
>
> Of course, I know full well that the standard answer is no, and in
> fact the above is an expected and fine change. In other words what I'm
> really asking is if I wonder if I could get an agreement here that
> from now on, the syscall number of userfaultfd for x86 32bit and
> x86-64 64bit won't change anymore in linux-next and it's already
> reserved just like if it was already upstream.
>
> Again: I'd only seek such guarantee for the x86-64 64bit and x86 32bit
> ABIs (not any other arch, and not any other syscall). If I could get
> such a guarantee from you within the next week or two, that would
> avoid me complications and some work, so I thought it was worth
> asking. If it's not possible never mind.

My (limited) understanding is that this is up to the arch maintainers.
I certainly didn't intend to preempt your syscall number, but my patch
beat your patch to -tip :-p

-tip people: want to assign Andrea a pair of syscall numbers?

--Andy
