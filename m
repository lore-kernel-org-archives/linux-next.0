From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: linux-next: manual merge of the audit tree with the security tree
Date: Fri, 24 Jun 2016 07:41:31 +0200
Message-ID: <20160624054131.GA3940@osiris>
References: <20160623141814.5512ffd1@canb.auug.org.au>
 <20160623060113.GA3866@osiris>
 <CAHC9VhRFyy8-z6y+sA2VSgrfJH0ZeuEt+-f-sJJaLpPTsxxzSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48432 "EHLO
	mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751241AbcFXFlk (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 24 Jun 2016 01:41:40 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u5O5Ycrk027596
	for <linux-next@vger.kernel.org>; Fri, 24 Jun 2016 01:41:40 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
	by mx0b-001b2d01.pphosted.com with ESMTP id 23ruex5jcd-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-next@vger.kernel.org>; Fri, 24 Jun 2016 01:41:40 -0400
Received: from localhost
	by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Fri, 24 Jun 2016 06:41:38 +0100
Content-Disposition: inline
In-Reply-To: <CAHC9VhRFyy8-z6y+sA2VSgrfJH0ZeuEt+-f-sJJaLpPTsxxzSg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>

On Thu, Jun 23, 2016 at 12:14:11PM -0400, Paul Moore wrote:
> On Thu, Jun 23, 2016 at 2:01 AM, Heiko Carstens
> <heiko.carstens@de.ibm.com> wrote:
> > On Thu, Jun 23, 2016 at 02:18:14PM +1000, Stephen Rothwell wrote:
> >> Hi Paul,
> >>
> >> Today's linux-next merge of the audit tree got a conflict in:
> >>
> >>   arch/s390/kernel/ptrace.c
> >>
> >> between commit:
> >>
> >>   0208b9445bc0 ("s390/ptrace: run seccomp after ptrace")
> >>
> >> from the security tree and commit:
> >>
> >>   bba696c2c083 ("s390: ensure that syscall arguments are properly masked on s390")
> >>
> >> from the audit tree.
> >
> > Hmm, I haven't seen that commit, therefore I'm just commenting on the
> > result ;)
> 
> It was sent to the linux-audit and linux-s390 mailing lists yesterday
> with a follow up comment that I was going to add it to the audit#next
> branch and if anyone had any objections to let me know.
> 
> * https://www.redhat.com/archives/linux-audit/2016-June/msg00051.html

Yes, I missed that, sorry!

> >> +     audit_syscall_entry(regs->gprs[2], regs->orig_gpr2 & mask,
> >> +                         regs->gprs[3] & mask, regs->gprs[4] & mask,
> >> +                         regs->gprs[5] & mask);
> >
> > With these masks it is more correct, however these are still not the values
> > used by the system call itself. This would be still incorrect for
> > e.g. compat pointers (31 bit on s390).
> >
> > So it seems like audit_syscall_entry should be called after all sign, zero
> > and masking has been done?
> 
> For someone not familiar with s390, compat or not, where would you
> suggest we place the audit_syscall_entry() call?

I was thinking of a more generic solution for all architectures: for
example setting a new TIF flag within do_syscall_trace_enter which
indicates that audit_syscall_entry needs be called and then add a
conditional call to the SYSCALL_DEFINE and COMPAT_SYSCALL_DEFINE macros.

That way audit_syscall_entry would always receive already properly sign and
zero extended system call parameters. At the downside this would increase
the kernel text size by probably ~370 conditional branches and add two more
instructions on the system call hot path.

But that's something that could be done independently from your patch,
which already improves the current situation.
