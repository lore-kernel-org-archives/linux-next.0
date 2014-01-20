From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Mon, 20 Jan 2014 02:19:30 -0800
Message-ID: <52DCF832.9050704@zytor.com>
References: <20140116145829.5e4fcab103b1c5c77501ee77@canb.auug.org.au> <CAJvTdKmdopjSopfHrZRKXJBKqjizrFHich+dQCd6Fq7C3bOogw@mail.gmail.com> <20140120083021.GC30183@twins.programming.kicks-ass.net> <20140120101345.GC3694@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:42806 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750801AbaATKUR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Jan 2014 05:20:17 -0500
In-Reply-To: <20140120101345.GC3694@twins.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Len Brown <lenb@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 01/20/2014 02:13 AM, Peter Zijlstra wrote:
> On Mon, Jan 20, 2014 at 09:30:21AM +0100, Peter Zijlstra wrote:
>> Then make them so. The fact was that most of the mwait idle sites
>> were bloody broken. And the single mwait_idle_with_hints() function
>> presents a single nice function that does all the required magics.
> 
> To stress this a bit more; have a look see at mwwait_idle_with_hints();
> it does a whole lot of subtle magic.
> 
>  - current_{set,clr}_polling*(), these are crucial in not missing and
>    wrecking NEED_RESCHED state.
> 
>  - X86_FEATURE_CLFLUSH_MONTIOR quirk
> 
>  - Does the monitor(); if (!need_resched()) mwait() thing.
> 
> All of those are required for a correct and functional idle loop. And
> I've seen sites where any or all of the above were missing/broken.
> 
> Not unifying the lot into a simple usable function is just stupid --
> history has shown people simply cannot be trusted to get this right.
> 

I don't think anyone is arguing that.  The question is rather if the
implementation is correct, and if it is ready for the merge window.

	-hpa
