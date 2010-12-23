From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 3/3 V13] RO/NX protection for loadable kernel
Date: Thu, 23 Dec 2010 09:49:08 +0100
Message-ID: <20101223084908.GA21946@elte.hu>
References: <4CE2F914.9070106@free.fr>
 <24422.1290656467@localhost>
 <20101126182355.62615dff@mat-laptop>
 <20101208221951.GO5750@outflux.net>
 <20101211001857.4c5e0794@mat-laptop>
 <20101222124019.GG10809@elte.hu>
 <34428.1293053719@localhost>
 <20101222215725.GB5585@elte.hu>
 <1293055346.22802.0.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1293055346.22802.0.camel@gandalf.stny.rr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Valdis.Kletnieks@vt.edu, mat <castet.matthieu@free.fr>, Kees Cook <kees.cook@canonical.com>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>, Siarhei Liakh <sliakh.lkml@gmail.com>
List-Id: linux-next.vger.kernel.org


* Steven Rostedt <rostedt@goodmis.org> wrote:

> On Wed, 2010-12-22 at 22:57 +0100, Ingo Molnar wrote:
> 
> > It would be nice to see that fix submitted so that it gets into the tree that 
> > introduced the bug.
> > 
> > Steve, Andrew?
> 
> Hi Ingo,
> 
> Which tree/branch should I base this on?

Please use tip:x86/security, it contains the RO/NX patches:

 691513f70d39: x86: Resume trampoline must be executable
 84e1c6bb38eb: x86: Add RO/NX protection for loadable kernel modules
 5bd5a452662b: x86: Add NX protection for kernel data
 64edc8ed5ffa: x86: Fix improper large page preservation

> [...] I could do write up formal patch and push it out.

Thanks!

	Ingo
