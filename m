From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH/RFC] Re: linux-next: build failure after merge of the
 luto-misc tree
Date: Fri, 15 Jul 2016 17:49:30 +0200
Message-ID: <20160715154930.GC3115@twins.programming.kicks-ass.net>
References: <20160715170654.0b09a8bc@canb.auug.org.au>
 <20160715072243.GP30154@twins.programming.kicks-ass.net>
 <20160715073119.GR30927@twins.programming.kicks-ass.net>
 <20160715150903.GA2523@redhat.com>
 <20160715152436.GB2523@redhat.com>
 <20160715154326.GC2523@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:47884 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751220AbcGOPtk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 15 Jul 2016 11:49:40 -0400
Content-Disposition: inline
In-Reply-To: <20160715154326.GC2523@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andy Lutomirski <luto@amacapital.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>

On Fri, Jul 15, 2016 at 12:43:26PM -0300, Arnaldo Carvalho de Melo wrote:
> Ok, same results, it works, queuing this one, ack?

Sure. Although I'm still somewhat puzzled by the duplicated effort of
__BITS_PER_LONG and BITS_PER_LONG.

> commit a08cc3e6f7bb965672a3ff60f98d0dbbc5334ee7
> Author: Peter Zijlstra <peterz@infradead.org>
> Date:   Fri Jul 15 12:38:18 2016 -0300
> 
>     tools: Simplify BITS_PER_LONG define
>     
>     Do it using (__CHAR_BIT__ * __SIZEOF_LONG__), simpler, works everywhere,
>     reduces the complexity by ditching CONFIG_64BIT, that was being
>     synthesized from yet another set of defines, which proved fragile,
>     breaking the build on linux-next for no obvious reasons.

If you ever do need to introduce CONFIG_64BIT, __LP64__ seems like the
right symbol to use for it.
