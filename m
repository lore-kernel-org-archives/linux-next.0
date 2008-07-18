From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: x86 tree build failure
Date: Fri, 18 Jul 2008 22:10:40 +0200
Message-ID: <20080718201040.GC27176@elte.hu>
References: <20080717120754.66b6c14c.sfr@canb.auug.org.au> <19f34abd0807170223t7a81dbcfyb860b5e3fc32251c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:34313 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755452AbYGRUK5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2008 16:10:57 -0400
Content-Disposition: inline
In-Reply-To: <19f34abd0807170223t7a81dbcfyb860b5e3fc32251c@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


* Vegard Nossum <vegard.nossum@gmail.com> wrote:

> On Thu, Jul 17, 2008 at 4:07 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi all,
> >
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> >
> > arch/x86/kernel/syscall_64.c:27: error: array index in initializer exceeds array bounds
> > arch/x86/kernel/syscall_64.c:27: error: (near initialization for 'sys_call_table')
> > arch/x86/kernel/syscall_64.c:27: warning: excess elements in array initializer
> > arch/x86/kernel/syscall_64.c:27: warning: (near initialization for 'sys_call_table')
> >
> > Reverting commit aa27f95867447916d97c7aa6e5422ff6518630dd ("x86:
> > consolidate header guards") makes it build ok.  I found that hard to
> > believe, so I undid the revert and it fails again.
> 
> Oh, this is in next already?
> 
> The basic problem is that I completely overlooked the fact that some 
> headers use the guards of _other_ headers in #if-checks. I think we 
> should drop the consolidations completely until I have fixed the 
> script to replace the header guard names which are used in other files 
> as well. I'm sorry :-/

ok, dropped them from the -next integration rules. Stephen, can you use 
the previous version of the x86 branch, or should i reintegrate it now?

	Ingo
