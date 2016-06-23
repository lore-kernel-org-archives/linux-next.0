From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: linux-next: manual merge of the audit tree with the security tree
Date: Thu, 23 Jun 2016 08:01:13 +0200
Message-ID: <20160623060113.GA3866@osiris>
References: <20160623141814.5512ffd1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47116 "EHLO
	mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751080AbcFWGBW (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Jun 2016 02:01:22 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u5N5xEaF118801
	for <linux-next@vger.kernel.org>; Thu, 23 Jun 2016 02:01:22 -0400
Received: from e06smtp11.uk.ibm.com (e06smtp11.uk.ibm.com [195.75.94.107])
	by mx0a-001b2d01.pphosted.com with ESMTP id 23qcxf6ws7-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-next@vger.kernel.org>; Thu, 23 Jun 2016 02:01:21 -0400
Received: from localhost
	by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Thu, 23 Jun 2016 07:01:19 +0100
Content-Disposition: inline
In-Reply-To: <20160623141814.5512ffd1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>

On Thu, Jun 23, 2016 at 02:18:14PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next merge of the audit tree got a conflict in:
> 
>   arch/s390/kernel/ptrace.c
> 
> between commit:
> 
>   0208b9445bc0 ("s390/ptrace: run seccomp after ptrace")
> 
> from the security tree and commit:
> 
>   bba696c2c083 ("s390: ensure that syscall arguments are properly masked on s390")
> 
> from the audit tree.

Hmm, I haven't seen that commit, therefore I'm just commenting on the
result ;)

> diff --cc arch/s390/kernel/ptrace.c
> index cea17010448f,ac1dc74632b0..000000000000
> --- a/arch/s390/kernel/ptrace.c
> +++ b/arch/s390/kernel/ptrace.c
> @@@ -821,6 -821,16 +821,8 @@@ long compat_arch_ptrace(struct task_str
>   
>   asmlinkage long do_syscall_trace_enter(struct pt_regs *regs)
>   {
>  -	long ret = 0;
> + 	unsigned long mask = -1UL;
> + 
>  -	/* Do the secure computing check first. */
>  -	if (secure_computing()) {
>  -		/* seccomp failures shouldn't expose any additional code. */
>  -		ret = -1;
>  -		goto out;
>  -	}
>  -
>   	/*
>   	 * The sysc_tracesys code in entry.S stored the system
>   	 * call number to gprs[2].
> @@@ -846,11 -850,15 +848,14 @@@
>   	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
>   		trace_sys_enter(regs, regs->gprs[2]);
>   
> - 	audit_syscall_entry(regs->gprs[2], regs->orig_gpr2,
> - 			    regs->gprs[3], regs->gprs[4],
> - 			    regs->gprs[5]);
> - 
> + #ifdef CONFIG_COMPAT
> +         if (test_thread_flag(TIF_31BIT))
> +                 mask = 0xffffffff;
> + #endif

Better: use is_compat_task() and avoid yet another ifdef.

> + 	audit_syscall_entry(regs->gprs[2], regs->orig_gpr2 & mask,
> + 			    regs->gprs[3] & mask, regs->gprs[4] & mask,
> + 			    regs->gprs[5] & mask);

With these masks it is more correct, however these are still not the values
used by the system call itself. This would be still incorrect for
e.g. compat pointers (31 bit on s390).

So it seems like audit_syscall_entry should be called after all sign, zero
and masking has been done?
