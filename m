From: Paul Moore <paul@paul-moore.com>
Subject: Re: linux-next: manual merge of the audit tree with the security tree
Date: Fri, 24 Jun 2016 11:05:33 -0400
Message-ID: <CAHC9VhS+zV4eoeNm8BEyr+ANOrZhtdEab2G0A=OxK4MhG_gg4Q@mail.gmail.com>
References: <20160623141814.5512ffd1@canb.auug.org.au> <20160623060113.GA3866@osiris>
 <CAHC9VhRFyy8-z6y+sA2VSgrfJH0ZeuEt+-f-sJJaLpPTsxxzSg@mail.gmail.com> <20160624054131.GA3940@osiris>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:36206 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750999AbcFXPFf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Jun 2016 11:05:35 -0400
Received: by mail-oi0-f54.google.com with SMTP id f189so118892391oig.3
        for <linux-next@vger.kernel.org>; Fri, 24 Jun 2016 08:05:34 -0700 (PDT)
In-Reply-To: <20160624054131.GA3940@osiris>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>

On Fri, Jun 24, 2016 at 1:41 AM, Heiko Carstens
<heiko.carstens@de.ibm.com> wrote:
> On Thu, Jun 23, 2016 at 12:14:11PM -0400, Paul Moore wrote:
>> On Thu, Jun 23, 2016 at 2:01 AM, Heiko Carstens
>> <heiko.carstens@de.ibm.com> wrote:
>> > On Thu, Jun 23, 2016 at 02:18:14PM +1000, Stephen Rothwell wrote:
>> >> Hi Paul,
>> >>
>> >> Today's linux-next merge of the audit tree got a conflict in:
>> >>
>> >>   arch/s390/kernel/ptrace.c
>> >>
>> >> between commit:
>> >>
>> >>   0208b9445bc0 ("s390/ptrace: run seccomp after ptrace")
>> >>
>> >> from the security tree and commit:
>> >>
>> >>   bba696c2c083 ("s390: ensure that syscall arguments are properly masked on s390")
>> >>
>> >> from the audit tree.
>> >
>> > Hmm, I haven't seen that commit, therefore I'm just commenting on the
>> > result ;)
>>
>> It was sent to the linux-audit and linux-s390 mailing lists yesterday
>> with a follow up comment that I was going to add it to the audit#next
>> branch and if anyone had any objections to let me know.
>>
>> * https://www.redhat.com/archives/linux-audit/2016-June/msg00051.html
>
> Yes, I missed that, sorry!

No problem, my inbox eats a fair amount of mail too ;)

>> >> +     audit_syscall_entry(regs->gprs[2], regs->orig_gpr2 & mask,
>> >> +                         regs->gprs[3] & mask, regs->gprs[4] & mask,
>> >> +                         regs->gprs[5] & mask);
>> >
>> > With these masks it is more correct, however these are still not the values
>> > used by the system call itself. This would be still incorrect for
>> > e.g. compat pointers (31 bit on s390).
>> >
>> > So it seems like audit_syscall_entry should be called after all sign, zero
>> > and masking has been done?
>>
>> For someone not familiar with s390, compat or not, where would you
>> suggest we place the audit_syscall_entry() call?
>
> I was thinking of a more generic solution for all architectures: for
> example setting a new TIF flag within do_syscall_trace_enter which
> indicates that audit_syscall_entry needs be called and then add a
> conditional call to the SYSCALL_DEFINE and COMPAT_SYSCALL_DEFINE macros.
>
> That way audit_syscall_entry would always receive already properly sign and
> zero extended system call parameters. At the downside this would increase
> the kernel text size by probably ~370 conditional branches and add two more
> instructions on the system call hot path.
>
> But that's something that could be done independently from your patch,
> which already improves the current situation.

My immediate concern is making sure that we are at least recording the
arguments correctly in the audit record.  My simple tests look okay,
but as I said before, I'm far from a s390 expert and your initial
comment made it sound like there were still problems with how we were
recording the arguments.  Can you either confirm that we are logging
the arguments correctly, or provide a suggestion on how to get the
right values?  That would be most helpful at this point.

-- 
paul moore
www.paul-moore.com
