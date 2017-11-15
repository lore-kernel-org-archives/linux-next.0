From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: manual merge of the rseq tree with Linus' tree
Date: Wed, 15 Nov 2017 17:30:20 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1711151728450.1805@nanos>
References: <20171115153536.7fab87b7@canb.auug.org.au> <20171115080712.tehklwmcvol7iiic@gmail.com> <20171116014826.5228aa7c@canb.auug.org.au> <1489656964.15813.1510758032885.JavaMail.zimbra@efficios.com> <alpine.DEB.2.20.1711151613250.1805@nanos>
 <952535108.15867.1510760492893.JavaMail.zimbra@efficios.com> <alpine.DEB.2.20.1711151647010.1805@nanos> <1154718745.15893.1510762332422.JavaMail.zimbra@efficios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:42432 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757718AbdKOQad (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Nov 2017 11:30:33 -0500
In-Reply-To: <1154718745.15893.1510762332422.JavaMail.zimbra@efficios.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@suse.de>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>Andy Lutomirski <luto@kernel.org>

On Wed, 15 Nov 2017, Mathieu Desnoyers wrote:

> ----- On Nov 15, 2017, at 11:04 AM, Thomas Gleixner tglx@linutronix.de wrote:
> 
> > On Wed, 15 Nov 2017, Mathieu Desnoyers wrote:
> >> ----- On Nov 15, 2017, at 10:22 AM, Thomas Gleixner tglx@linutronix.de wrote:
> >> > Can we please handle this as any other feature which is not ready before
> >> > the merge window and postpone the rseq stuff for 4.16?
> >> 
> >> Linus showed interest in merging the rseq tree when we discussed at the
> >> Kernel Summit. The tree has not changed much since then. I only integrated
> >> membarrier patches that were implemented around the time of the 4.14 merge
> >> window, which I queued for the 4.15 (current) window.
> > 
> > Linus showed interest for a lot of things in the past. That does not mean
> > it makes things magically complete and ready.
> > 
> > As Michael pointed out there is no man page, not even a draft for it
> > available. See: Documentation/process/adding-syscalls.rst
> 
> The rseq commit has a manpage associated for seq. The cpu_opv does not have it
> yet, nor the new membarrier commands. I plan to write those quickly after the
> tree reaches master.

And that's a special rule for you, right?

Documentation/process/adding-syscalls.rst is for everybody else who
implements a new syscall.

Thanks,

	tglx
