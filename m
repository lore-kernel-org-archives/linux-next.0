From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: build warnings after merge of the access_once tree
Date: Thu, 26 Mar 2015 17:28:57 +0100
Message-ID: <20150326162857.GB21418@twins.programming.kicks-ass.net>
References: <20150326193112.2c87eb39@canb.auug.org.au>
 <20150326103442.GV21418@twins.programming.kicks-ass.net>
 <20150326132750.GA2805@arm.com>
 <20150326142220.GY21418@twins.programming.kicks-ass.net>
 <CA+55aFyLTc72-xTkjugVSMb3EQq=+__UcFe28agu086xf9d6ZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:53343 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751807AbbCZQ3J (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Mar 2015 12:29:09 -0400
Content-Disposition: inline
In-Reply-To: <CA+55aFyLTc72-xTkjugVSMb3EQq=+__UcFe28agu086xf9d6ZA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will.deacon@arm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Christian Borntraeger <borntraeger@de.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Paul McKenney <paulmck@linux.vnet.ibm.com>

On Thu, Mar 26, 2015 at 09:15:21AM -0700, Linus Torvalds wrote:
> Notice how it is *not* about atomicitiy. The compiler can read the
> value in fifteen pieces, randomly mixing one bit or five. Nobody
> cares.

If you read Documentation/memory-barriers.txt you'll find that it very
much also is about reading it in one go.

"The ACCESS_ONCE() function can prevent any number of optimizations that,
while perfectly safe in single-threaded code, can be fatal in concurrent
code.  Here are some examples of these sorts of optimizations:

 ...

 (*) For aligned memory locations whose size allows them to be accessed
     with a single memory-reference instruction, prevents "load tearing"
     and "store tearing," ..."

There are many places in the kernel where we rely and use ACCESS_ONCE()
in order to 'guarantee' single loads. Paul is the expert here, but from
what I understand the compiler is not allowed to split loads for
volatile reads (assuming the load is both naturally aligned and of
machine word size).

And the size check in READ_ONCE() helps asserting this.
