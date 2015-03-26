From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build warnings after merge of the access_once tree
Date: Thu, 26 Mar 2015 10:12:19 -0700
Message-ID: <20150326171219.GI28980@linux.vnet.ibm.com>
References: <20150326193112.2c87eb39@canb.auug.org.au>
 <20150326103442.GV21418@twins.programming.kicks-ass.net>
 <20150326132750.GA2805@arm.com>
 <20150326142220.GY21418@twins.programming.kicks-ass.net>
 <CA+55aFyLTc72-xTkjugVSMb3EQq=+__UcFe28agu086xf9d6ZA@mail.gmail.com>
 <20150326162857.GB21418@twins.programming.kicks-ass.net>
 <CA+55aFzUPPSHakwbp-Y-SaXB+o1=V6rOknz7L3AYNXNPU1MSfg@mail.gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e37.co.us.ibm.com ([32.97.110.158]:58548 "EHLO
	e37.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752194AbbCZRM3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Mar 2015 13:12:29 -0400
Received: from /spool/local
	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Thu, 26 Mar 2015 11:12:28 -0600
Content-Disposition: inline
In-Reply-To: <CA+55aFzUPPSHakwbp-Y-SaXB+o1=V6rOknz7L3AYNXNPU1MSfg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Christian Borntraeger <borntraeger@de.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@elte.hu>, Davidlohr Bueso <dave@stgolabs.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will.deacon@arm.com>

On Thu, Mar 26, 2015 at 09:37:50AM -0700, Linus Torvalds wrote:
> On Mar 26, 2015 9:29 AM, "Peter Zijlstra" <peterz@infradead.org> wrote:
> >
> > And the size check in READ_ONCE() helps asserting this.
> 
> No it d does NOT.
> 
> Even the documentation you quoted agrees with me: the shearing issue is
> only for sizes where it is appropriate. The size check is wrong, because it
> warns explicitly about the sizes where the shearing will happen, but the
> code is supposed to work anyway.
> 
> All the documentation documents a *special case* (although a common one),
> not some generic requirement.
> 
> And the point is - the warning is wrong, and it is counterproductive. And
> it causes people who should know better to try to introduce bugs.
> 
> The warning must go. This whole thread proves it. The warning is dangerous
> and actively misleading.

The only cases I can think of where this warning would be useful is
in 64-bit architecture-specific code that used u64 (or long long or
whatever) and needed to avoid both reloads and load shearing.  In those
(admittedly rare, perhaps nonexistent) cases, presumably the surrounding
code should do __native_word() if needed.  (In case the code were to be
mindlessly copied to a 32-bit architecture or something.)

Not sure that adding this to memory-barriers.txt is worthwhile, just
trying to make sure that I understand the tradeoffs.

							Thanx, Paul
