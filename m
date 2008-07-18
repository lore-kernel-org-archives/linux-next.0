From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: x86 tree build failure
Date: Fri, 18 Jul 2008 22:12:06 +0200
Message-ID: <20080718201206.GA16377@elte.hu>
References: <20080717120754.66b6c14c.sfr@canb.auug.org.au> <19f34abd0807170223t7a81dbcfyb860b5e3fc32251c@mail.gmail.com> <20080718201040.GC27176@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:34561 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758768AbYGRUMW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2008 16:12:22 -0400
Content-Disposition: inline
In-Reply-To: <20080718201040.GC27176@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


* Ingo Molnar <mingo@elte.hu> wrote:

> > The basic problem is that I completely overlooked the fact that some 
> > headers use the guards of _other_ headers in #if-checks. I think we 
> > should drop the consolidations completely until I have fixed the 
> > script to replace the header guard names which are used in other 
> > files as well. I'm sorry :-/
> 
> ok, dropped them from the -next integration rules. Stephen, can you 
> use the previous version of the x86 branch, or should i reintegrate it 
> now?

ok, i fixed it up in tip/auto-x86-next and pushed it out.

	Ingo
