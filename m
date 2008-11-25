From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: ftrace tree build failure
Date: Tue, 25 Nov 2008 08:14:36 +0100
Message-ID: <20081125071436.GA9660@elte.hu>
References: <20081125142105.2b6d464a.sfr@canb.auug.org.au> <1227584931.7622.11.camel@localhost.localdomain> <20081125151345.3f0ed493.sfr@canb.auug.org.au> <1227587493.7622.14.camel@localhost.localdomain> <20081125160935.2bd3dcb2.sfr@canb.auug.org.au> <1227591856.7622.26.camel@localhost.localdomain> <20081125175708.d28d08cd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:60085 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750932AbYKYHOy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 02:14:54 -0500
Content-Disposition: inline
In-Reply-To: <20081125175708.d28d08cd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Steven Rostedt <srostedt@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Steve,
> 
> On Tue, 25 Nov 2008 00:44:16 -0500 Steven Rostedt <srostedt@redhat.com> wrote:
> >
> > Yep, it was the wrong constraint used in the asm. Googling around, I
> > found a similar bug listed in gcc, which was not a bug.
> 
> Amazing what we trip over :-(
> 
> > Patch has been sent to fix this.
> 
> Can you put that patch in your tree as well, or will it reach 
> linux-next quickly enough anyway?

i've applied the assembly constraint fix to the x86 tree and i've 
integrated a new version of auto-x86-next which includes the fix, and 
pushed it out.

Thanks,

	Ingo
