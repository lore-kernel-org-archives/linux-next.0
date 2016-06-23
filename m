From: Paul Moore <paul@paul-moore.com>
Subject: Re: linux-next: manual merge of the audit tree with the security tree
Date: Thu, 23 Jun 2016 12:14:11 -0400
Message-ID: <CAHC9VhRFyy8-z6y+sA2VSgrfJH0ZeuEt+-f-sJJaLpPTsxxzSg@mail.gmail.com>
References: <20160623141814.5512ffd1@canb.auug.org.au> <20160623060113.GA3866@osiris>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:33010 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751969AbcFWQOO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Jun 2016 12:14:14 -0400
Received: by mail-oi0-f52.google.com with SMTP id u201so77411332oie.0
        for <linux-next@vger.kernel.org>; Thu, 23 Jun 2016 09:14:13 -0700 (PDT)
In-Reply-To: <20160623060113.GA3866@osiris>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>

On Thu, Jun 23, 2016 at 2:01 AM, Heiko Carstens
<heiko.carstens@de.ibm.com> wrote:
> On Thu, Jun 23, 2016 at 02:18:14PM +1000, Stephen Rothwell wrote:
>> Hi Paul,
>>
>> Today's linux-next merge of the audit tree got a conflict in:
>>
>>   arch/s390/kernel/ptrace.c
>>
>> between commit:
>>
>>   0208b9445bc0 ("s390/ptrace: run seccomp after ptrace")
>>
>> from the security tree and commit:
>>
>>   bba696c2c083 ("s390: ensure that syscall arguments are properly masked on s390")
>>
>> from the audit tree.
>
> Hmm, I haven't seen that commit, therefore I'm just commenting on the
> result ;)

It was sent to the linux-audit and linux-s390 mailing lists yesterday
with a follow up comment that I was going to add it to the audit#next
branch and if anyone had any objections to let me know.

* https://www.redhat.com/archives/linux-audit/2016-June/msg00051.html

>> diff --cc arch/s390/kernel/ptrace.c
>> index cea17010448f,ac1dc74632b0..000000000000
>> --- a/arch/s390/kernel/ptrace.c
>> +++ b/arch/s390/kernel/ptrace.c
>> @@@ -821,6 -821,16 +821,8 @@@ long compat_arch_ptrace(struct task_str
>>
>>   asmlinkage long do_syscall_trace_enter(struct pt_regs *regs)
>>   {
>>  -    long ret = 0;
>> +     unsigned long mask = -1UL;
>> +
>>  -    /* Do the secure computing check first. */
>>  -    if (secure_computing()) {
>>  -            /* seccomp failures shouldn't expose any additional code. */
>>  -            ret = -1;
>>  -            goto out;
>>  -    }
>>  -
>>       /*
>>        * The sysc_tracesys code in entry.S stored the system
>>        * call number to gprs[2].
>> @@@ -846,11 -850,15 +848,14 @@@
>>       if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
>>               trace_sys_enter(regs, regs->gprs[2]);
>>
>> -     audit_syscall_entry(regs->gprs[2], regs->orig_gpr2,
>> -                         regs->gprs[3], regs->gprs[4],
>> -                         regs->gprs[5]);
>> -
>> + #ifdef CONFIG_COMPAT
>> +         if (test_thread_flag(TIF_31BIT))
>> +                 mask = 0xffffffff;
>> + #endif
>
> Better: use is_compat_task() and avoid yet another ifdef.

Sounds reasonable.

>> +     audit_syscall_entry(regs->gprs[2], regs->orig_gpr2 & mask,
>> +                         regs->gprs[3] & mask, regs->gprs[4] & mask,
>> +                         regs->gprs[5] & mask);
>
> With these masks it is more correct, however these are still not the values
> used by the system call itself. This would be still incorrect for
> e.g. compat pointers (31 bit on s390).
>
> So it seems like audit_syscall_entry should be called after all sign, zero
> and masking has been done?

For someone not familiar with s390, compat or not, where would you
suggest we place the audit_syscall_entry() call?

-- 
paul moore
www.paul-moore.com
