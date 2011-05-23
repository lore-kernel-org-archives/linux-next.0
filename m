From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [bloat] Measuring header file bloat effects on kernel build
 performance: a more than 2x slowdown ...
Date: Mon, 23 May 2011 19:01:26 +0200
Message-ID: <20110523170126.GA14407@elte.hu>
References: <20110520161210.81bbef3a.sfr@canb.auug.org.au>
 <BANLkTi=Dn_jvJ8mLY0Bc6C1Ptoqa-kJrCg@mail.gmail.com>
 <20110523090918.GA5474@elte.hu>
 <BANLkTim_pWfU0=ck8=F1kt_bwjtdGRDgdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:42955 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932123Ab1EWRBp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 May 2011 13:01:45 -0400
Content-Disposition: inline
In-Reply-To: <BANLkTim_pWfU0=ck8=F1kt_bwjtdGRDgdQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Andrew Morton <akpm@linux-foundation.org>


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Mon, May 23, 2011 at 2:09 AM, Ingo Molnar <mingo@elte.hu> wrote:
> >
> > I've attached a totally hacky patch that removes all the big #include's from
> > kernel/pid.c and includes all structure and API definitions explicitly.
> 
> Hmm.
> 
> A less hacky patch might be to split up "sched.h" into multiple
> smaller things and at least get *part* of the way.
> 

Yeah, absolutely - Peter already raised that a couple of days ago in a sched.h 
discussion so it's on the radar.

The hacky patch was really just a throw-away attempt to see where we stand - we 
only had vague impressions about the level of problems we have, now we know 
some numbers.

> A lot of things want "struct task_struct" (and in some cases thread_info, but 
> that's already split).
> 
> Much fewer care about the signal stuff.
> 
> And many things probably don't even need the task_struct definition, and 
> might be perfectly happy with just function calls rather than having intimate 
> knowledge of the structure layout and an inline function.

Yeah.

Thanks,

	Ingo
