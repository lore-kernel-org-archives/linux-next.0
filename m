From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Thu, 30 Jul 2015 01:07:46 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1507300106590.3825@nanos>
References: <20150728160015.142f588f@canb.auug.org.au> <20150729171256.GA10863@redhat.com> <20150730090610.0922a2c6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:43144 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753434AbbG2XIV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2015 19:08:21 -0400
In-Reply-To: <20150730090610.0922a2c6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrea Arcangeli <aarcange@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, Eric B Munson <emunson@akamai.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>

On Thu, 30 Jul 2015, Stephen Rothwell wrote:
> Hi Andrea,
> 
> On Wed, 29 Jul 2015 19:12:56 +0200 Andrea Arcangeli <aarcange@redhat.com> wrote:
> >
> > On Tue, Jul 28, 2015 at 04:00:15PM +1000, Stephen Rothwell wrote:
> > >  -359	i386	userfaultfd		sys_userfaultfd
> > > ++374	i386	userfaultfd		sys_userfaultfd
> > 
> > Do I understand correctly the syscall number of userfaultfd for x86
> > 32bit has just changed from 359 to 374? Appreciated that you CCed me
> > on such a relevant change to be sure I didn't miss it.
> > 
> > Then the below is needed as well.
> 
> I have added the below patch to linux-next from today.
> 
> > One related question: is it ok to ship kernels in production right now
> > with the userfaultfd syscall number 374 for x86 32bit ABI (after the
> > above change) and 323 for x86-64 64bit ABI, with these syscalls number
> > registered in linux-next or it may keep changing like it has just
> > happened? I refer only to userfaultfd syscalls of x86 32bit and x86-64
> > 64bit, not all other syscalls in linux-next.
> 
> These numbers are certainly not in any way official, they are just the
> result of my merge conflict fixup.  So, yes, they could change again if
> someone adds another new syscall to any tree but Andrew's.
> 
> > Of course, I know full well that the standard answer is no, and in
> > fact the above is an expected and fine change. In other words what I'm
> > really asking is if I wonder if I could get an agreement here that
> > from now on, the syscall number of userfaultfd for x86 32bit and
> > x86-64 64bit won't change anymore in linux-next and it's already
> > reserved just like if it was already upstream.
> 
> Like Thomas said, send a patch to the x86 maintainers.  I suspect (if
> the rest of the implementation needs to stay in Andrew's tree) that it
> could be a simple as a patch to the syscall tables using ni_syscall and
> a comment.  Thomas?

Yes, that's all it takes to reserve a syscall number.

Thanks,

	tglx
