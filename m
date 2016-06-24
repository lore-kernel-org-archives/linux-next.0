From: Paul Moore <paul@paul-moore.com>
Subject: Re: linux-next: manual merge of the audit tree with the security tree
Date: Fri, 24 Jun 2016 12:20:52 -0400
Message-ID: <CAHC9VhSKEEyfP7Gc_bsWbwn-TmjBFi3ATLCcx8VjYDSuBTVj5g@mail.gmail.com>
References: <20160623141814.5512ffd1@canb.auug.org.au> <20160623060113.GA3866@osiris>
 <CAHC9VhRFyy8-z6y+sA2VSgrfJH0ZeuEt+-f-sJJaLpPTsxxzSg@mail.gmail.com>
 <20160624054131.GA3940@osiris> <CAHC9VhS+zV4eoeNm8BEyr+ANOrZhtdEab2G0A=OxK4MhG_gg4Q@mail.gmail.com>
 <20160624152046.GB3940@osiris>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:34375 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751185AbcFXQUy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Jun 2016 12:20:54 -0400
Received: by mail-oi0-f45.google.com with SMTP id s66so121747586oif.1
        for <linux-next@vger.kernel.org>; Fri, 24 Jun 2016 09:20:54 -0700 (PDT)
In-Reply-To: <20160624152046.GB3940@osiris>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>

On Fri, Jun 24, 2016 at 11:20 AM, Heiko Carstens
<heiko.carstens@de.ibm.com> wrote:
> On Fri, Jun 24, 2016 at 11:05:33AM -0400, Paul Moore wrote:
>> My immediate concern is making sure that we are at least recording the
>> arguments correctly in the audit record.  My simple tests look okay,
>> but as I said before, I'm far from a s390 expert and your initial
>> comment made it sound like there were still problems with how we were
>> recording the arguments.  Can you either confirm that we are logging
>> the arguments correctly, or provide a suggestion on how to get the
>> right values?  That would be most helpful at this point.
>
> The arguments are correct, except that they are missing sign and zero
> extension to full 64 bit. However I would expect that the audit subsystem
> will only work on the lower 32 bits anyway for compat tasks. So that
> shouldn't be a problem.

Yes, that should be fine.  We were seeing problems with s390 syscalls
on s390x showing garbage in the high 32-bits, that's the problem I'm
trying to solve.

For example, here is a snippet of an audit record generated from
calling the s390 socketcall() on a s390x system:

type=SYSCALL msg=audit(1458835510.860:652): arch=16 syscall=102
 success=yes exit=21
 a0=ffffffff0000000b
 a1=3ff7f82e3c0
 a2=3ff00000000
 a3=a72028

> I'm a bit concerned about user space pointers passed as argument for compat
> tasks. These need to mask out 33 instead of 32 bits.  This is of course
> system call specific and I don't know enough about audit to tell if it
> could be a problem.

>From a practical point of view I'm not sure how much of an impact that
will have as it is unlikely anyone will be doing anything useful with
those pointer values; for example, you aren't going to be inspecting a
process' memory space using just the audit log.  Also, at the very
least we aren't removing any information, just adding in an extra bit
of potential junk.  Anyone who does care about user space pointers in
the audit log, should have all the information the need to drop the
high bit.

Does that sound reasonable?

-- 
paul moore
www.paul-moore.com
