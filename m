From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: build failure after merge of the luto-misc tree
Date: Fri, 15 Jul 2016 09:31:19 +0200
Message-ID: <20160715073119.GR30927@twins.programming.kicks-ass.net>
References: <20160715170654.0b09a8bc@canb.auug.org.au>
 <20160715072243.GP30154@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:47089 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932072AbcGOHb2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 15 Jul 2016 03:31:28 -0400
Content-Disposition: inline
In-Reply-To: <20160715072243.GP30154@twins.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andy Lutomirski <luto@amacapital.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>

On Fri, Jul 15, 2016 at 09:22:43AM +0200, Peter Zijlstra wrote:
> On Fri, Jul 15, 2016 at 05:06:54PM +1000, Stephen Rothwell wrote:
> > interacting with commit
> > 
> >   2a00f026a15d ("tools: Fix up BITS_PER_LONG setting")
> > 
> > from the tip tree.
> 
> Yuck.. that thing is horrid :/
> 
> What's wrong with so?
> 
> And if you really want to retain CONFIG_64BIT (because other headers
> might want it, and they currently do not) then do something like:
> 
> #ifdef __LP64__
> #define CONFIG_64BIT
> #else
> #define CONFIG_32BIT
> #endif
> 
> All GCC versions I checked have __CHAR_BIT__ and __SIZEOF_LONG__.
> 
> (and I checked most everything from 4.4 - 6.1)

clang-3.8 also defines all three of those, and I don't consider that a
usable compiler as it doesn't even build a kernel.
