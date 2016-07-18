From: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [PATCH/RFC] Re: linux-next: build failure after merge of the
 luto-misc tree
Date: Mon, 18 Jul 2016 17:36:34 -0300
Message-ID: <20160718203634.GF2207@kernel.org>
References: <20160715170654.0b09a8bc@canb.auug.org.au>
 <20160715072243.GP30154@twins.programming.kicks-ass.net>
 <20160715073119.GR30927@twins.programming.kicks-ass.net>
 <20160715150903.GA2523@redhat.com>
 <20160715152436.GB2523@redhat.com>
 <20160715154326.GC2523@redhat.com>
 <20160718151845.4de6e274@canb.auug.org.au>
 <CALCETrWqdi=7hsXTx=WKf-=He-9GP-WNLXppijeZgcoZDCq=bg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:33452 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750965AbcGRUgk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jul 2016 16:36:40 -0400
Content-Disposition: inline
In-Reply-To: <CALCETrWqdi=7hsXTx=WKf-=He-9GP-WNLXppijeZgcoZDCq=bg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnaldo Carvalho de Melo <acme@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Em Mon, Jul 18, 2016 at 01:04:34PM -0700, Andy Lutomirski escreveu:
> On Sun, Jul 17, 2016 at 10:18 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > On Fri, 15 Jul 2016 12:43:26 -0300 Arnaldo Carvalho de Melo <acme@redhat.com> wrote:

> >> Ok, same results, it works, queuing this one, ack? Stephen, does it work
> >> for you?

> > Sorry, no.  See my other email.
> >
> > I am cross building (if that makes a difference).

For me to try to reproduce the problem, yes, what is the environment?
Cross-compiling to what target?
 
> I wonder if something's wrong with the way that hostprogs-y works if
> the program includes kernel headers.
> 
> It's plausible that something like this:
> 
> https://git.kernel.org/cgit/linux/kernel/git/luto/linux.git/commit/?h=x86/vdso&id=424eb7848324efbfcffaf58b142db1a455a9628b
> 
> coupled with a change to make vdso2c or, more generally, hostprogs-y
> use USERINCLUDE would help.

There are still files outside tools/ that are being accessed by it, so,
yeah, this may have affected it, I'll try to do a final sweep untangling
this.

- Arnaldo
