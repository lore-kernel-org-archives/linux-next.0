From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Fri, 20 May 2011 18:16:29 +0200 (CEST)
Message-ID: <alpine.LFD.2.02.1105201806340.3078@ionos>
References: <20110520161210.81bbef3a.sfr@canb.auug.org.au> <BANLkTi=Dn_jvJ8mLY0Bc6C1Ptoqa-kJrCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:58966 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934520Ab1ETQQy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 May 2011 12:16:54 -0400
In-Reply-To: <BANLkTi=Dn_jvJ8mLY0Bc6C1Ptoqa-kJrCg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org

On Fri, 20 May 2011, Linus Torvalds wrote:
> On Thu, May 19, 2011 at 11:12 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the final tree, today's linux-next build (sparc32 defconfig)
> > failed like this:
> 
> Hmm. So I had actually done a "allyesconfig" build on x86, which
> annoys me. Because it means that the extra "let's compile everything
> to make sure I didn't break anything" was just almost totally
> worthless.
> 
> What seems to be happening is that the x86 <asm/uaccess.h> include
> ends up getting the <linux/prefetch.h>.
> 
> I have *no* idea why x86 does that, but x86 wants prefetch.h *so* much
> that it actually includes it first in <asm/uaccess.h> and then *again*
> in each of the 32/64-bit specific <asm/uaccess_[32,64].h> header
> files.
> 
> That seems a bit excessive. I don't think x86 should include
> <linux/prefetch.h> at all, since (a) it doesn't actually use any of
> it, and (b) it ended up hiding this problem from me.
> 
> Thomas, Ingo, Peter: would you be willing to just remove that stupid
> header file inclusion and fix up the fallout? Instead of having these
> one-by-one patches that come from Stephen testing out breakage on
> other architectures that x86 simply hid due to its odd include files?

Removed it, but it does not break anything on x86 because
linux/thread_info.h includes asm/thread_info.h which includes
asm/processor.h on x86 for non obvious reasons.

Thanks,

	tglx
