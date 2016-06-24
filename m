From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: linux-next: manual merge of the audit tree with the security tree
Date: Fri, 24 Jun 2016 17:20:46 +0200
Message-ID: <20160624152046.GB3940@osiris>
References: <20160623141814.5512ffd1@canb.auug.org.au>
 <20160623060113.GA3866@osiris>
 <CAHC9VhRFyy8-z6y+sA2VSgrfJH0ZeuEt+-f-sJJaLpPTsxxzSg@mail.gmail.com>
 <20160624054131.GA3940@osiris>
 <CAHC9VhS+zV4eoeNm8BEyr+ANOrZhtdEab2G0A=OxK4MhG_gg4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60246 "EHLO
	mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751138AbcFXPUz (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 24 Jun 2016 11:20:55 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u5OFEaFp019375
	for <linux-next@vger.kernel.org>; Fri, 24 Jun 2016 11:20:55 -0400
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
	by mx0a-001b2d01.pphosted.com with ESMTP id 23s4jt754p-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-next@vger.kernel.org>; Fri, 24 Jun 2016 11:20:54 -0400
Received: from localhost
	by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Fri, 24 Jun 2016 16:20:52 +0100
Content-Disposition: inline
In-Reply-To: <CAHC9VhS+zV4eoeNm8BEyr+ANOrZhtdEab2G0A=OxK4MhG_gg4Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>

On Fri, Jun 24, 2016 at 11:05:33AM -0400, Paul Moore wrote:
> >> >> +     audit_syscall_entry(regs->gprs[2], regs->orig_gpr2 & mask,
> >> >> +                         regs->gprs[3] & mask, regs->gprs[4] & mask,
> >> >> +                         regs->gprs[5] & mask);
> >> >
> >> > With these masks it is more correct, however these are still not the values
> >> > used by the system call itself. This would be still incorrect for
> >> > e.g. compat pointers (31 bit on s390).
> >> >
> >> > So it seems like audit_syscall_entry should be called after all sign, zero
> >> > and masking has been done?
> >>
> >> For someone not familiar with s390, compat or not, where would you
> >> suggest we place the audit_syscall_entry() call?
> >
> > I was thinking of a more generic solution for all architectures: for
> > example setting a new TIF flag within do_syscall_trace_enter which
> > indicates that audit_syscall_entry needs be called and then add a
> > conditional call to the SYSCALL_DEFINE and COMPAT_SYSCALL_DEFINE macros.
> >
> > That way audit_syscall_entry would always receive already properly sign and
> > zero extended system call parameters. At the downside this would increase
> > the kernel text size by probably ~370 conditional branches and add two more
> > instructions on the system call hot path.
> >
> > But that's something that could be done independently from your patch,
> > which already improves the current situation.
> 
> My immediate concern is making sure that we are at least recording the
> arguments correctly in the audit record.  My simple tests look okay,
> but as I said before, I'm far from a s390 expert and your initial
> comment made it sound like there were still problems with how we were
> recording the arguments.  Can you either confirm that we are logging
> the arguments correctly, or provide a suggestion on how to get the
> right values?  That would be most helpful at this point.

The arguments are correct, except that they are missing sign and zero
extension to full 64 bit. However I would expect that the audit subsystem
will only work on the lower 32 bits anyway for compat tasks. So that
shouldn't be a problem.

I'm a bit concerned about user space pointers passed as argument for compat
tasks. These need to mask out 33 instead of 32 bits.  This is of course
system call specific and I don't know enough about audit to tell if it
could be a problem.
