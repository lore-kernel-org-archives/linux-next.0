From: Steven Rostedt <srostedt@redhat.com>
Subject: Re: linux-next: ftrace tree build failure
Date: Tue, 25 Nov 2008 00:44:16 -0500
Message-ID: <1227591856.7622.26.camel@localhost.localdomain>
References: <20081125142105.2b6d464a.sfr@canb.auug.org.au>
	 <1227584931.7622.11.camel@localhost.localdomain>
	 <20081125151345.3f0ed493.sfr@canb.auug.org.au>
	 <1227587493.7622.14.camel@localhost.localdomain>
	 <20081125160935.2bd3dcb2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:40935 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750894AbYKYFpY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 00:45:24 -0500
In-Reply-To: <20081125160935.2bd3dcb2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


On Tue, 2008-11-25 at 16:09 +1100, Stephen Rothwell wrote:
> Hi Steve,
> 
> On Mon, 24 Nov 2008 23:31:33 -0500 Steven Rostedt <srostedt@redhat.com> wrote:
> >
> > This may be a compiler bug, or something introduced by the compiler. I
> > compiled it fine first with gcc 4.0.2, but then tried with the same
> > compiler you used, and got the same error as you.
> 
> A quick bisect points to this commit:
> 
> commit 2bcd521a684cc94befbe2ce7d5b613c841b0d304
> Author: Steven Rostedt <srostedt@redhat.com>
> Date:   Fri Nov 21 01:30:54 2008 -0500
> 
>     trace: profile all if conditionals
> 
> I guess something in there is tickling the compiler ...

Yep, it was the wrong constraint used in the asm. Googling around, I
found a similar bug listed in gcc, which was not a bug.

Patch has been sent to fix this.

Ah, I forgot to Cc Peter on that patch.

I'll bounce it to him ;-)

-- Steve
