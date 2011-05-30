From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: build warningiIn Linus' tree
Date: Mon, 30 May 2011 09:34:45 +0200
Message-ID: <20110530073445.GA27557@elte.hu>
References: <20110530114828.8ef6625b.sfr@canb.auug.org.au>
 <alpine.LFD.2.02.1105292346340.10035@arrandale.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:34110 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752731Ab1E3HfD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 May 2011 03:35:03 -0400
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.02.1105292346340.10035@arrandale.kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Len Brown <len.brown@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org, stable@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>


* Len Brown <lenb@kernel.org> wrote:

> From: Len Brown <len.brown@intel.com>
> Date: Sun, 29 May 2011 23:38:15 -0400
> Subject: [PATCH] x86 idle: fix build warning for WARN_ONCE("idle=mwait")
> 
> In 5d4c47e0195b989f284907358bd5c268a44b91c7
> "x86 idle: deprecate mwait_idle() and "idle=mwait" cmdline param"...
> 
> I fat-fingered the editing when I updated the WARN_ONCE() string:
> 
> arch/x86/kernel/process.c: In function 'idle_setup':
> arch/x86/kernel/process.c:645:1: warning: unknown escape sequence: '\i'
> 
> remove the '\n' while we are here, it works fine without it.
> 
> Signed-off-by: Len Brown <len.brown@intel.com>
> ---
>  arch/x86/kernel/process.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Len, i'd *really* prefer it if patches changing arch/x86/ had a 
longer test time in linux-next than what you are gave it here.

This kind of 'send them to lkml and merge them into your linux-next 
branch and send it to Linus on the same day' kind of ambush you have 
done with the 'x86 idle' patches might be convenient to you, but it 
is inconvenient to pretty much anyone else - and it is absolutely 
unacceptable to us x86 maintainers ...

*Especially* as these patches were contentious when you last posted 
them as an RFC to lkml ...

So please watch out for this in the future, ok?

Thanks,

	Ingo
