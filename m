From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: stackprotector tree build failure
Date: Wed, 22 Oct 2008 09:29:23 +0200
Message-ID: <20081022072923.GC27637@elte.hu>
References: <20081022131124.a572b11f.sfr@canb.auug.org.au> <20081022043227.GA31413@elte.hu> <20081022182149.f89fe88d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:34322 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751631AbYJVH3l (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Oct 2008 03:29:41 -0400
Content-Disposition: inline
In-Reply-To: <20081022182149.f89fe88d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Junio C Hamano <gitster@pobox.com>, git@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Ingo,
> 
> On Wed, 22 Oct 2008 06:32:27 +0200 Ingo Molnar <mingo@elte.hu> wrote:
> >
> > This seems to have been caused by a git-rerere bug - it mis-matched a 
> > timers tree conflict resolution. I cleared out that resolution (it had 
> > nothing to do with stackprotector), re-did the conflict resolution 
> > (which was about overlapping additions of header files), and pushed out 
> > a new stackprotector tree - the delta below has the expected result.
> 
> I wondered how you could have possibly got that result - aren't 
> computers wonderful! :-)

heh, yes :)

this is the second time i met a git-rerere mismatch - the first one was 
half a year ago.

Unfortunately i failed at generating a reproducer back then and even now 
- as to resolve this problem i manually removed the preimage and 
postimage, so it's gone now.

I've Cc:-ed Junio and the Git list as a general FYI - but it must be 
frustrating to get such a bugreport, because i have no reproducer.

git-rerere sometimes seems to be picking up the wrong resolution. VERY 
rarely.

It seems random and content dependent. Once it happened to 
arch/x86/kernel/traps_32.c and now to kernel/fork.c. Along the ~170 
successful resolutions i have in my tree right now. And i do many 
conflict resolutions every day - and it happened only once every 6 
months or so.

(the arch/x86/kernel/traps_32.c one happened regularly, that's why i 
thought it's content sha1 dependent, and not some corruption.)

Next time it happens i'll be on the watchout and will save the complete 
tree.

	Ingo
