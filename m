From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: sched tree build warning
Date: Mon, 22 Dec 2008 09:18:11 +0100
Message-ID: <20081222081811.GA10950@elte.hu>
References: <20081222152247.b934ed5b.sfr@canb.auug.org.au> <b040c32a0812212249p45aba306tbb68a960b79cd0ee@mail.gmail.com> <20081222070426.GD29160@elte.hu> <18767.19576.286910.148623@cargo.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:34497 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752921AbYLVISZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Dec 2008 03:18:25 -0500
Content-Disposition: inline
In-Reply-To: <18767.19576.286910.148623@cargo.ozlabs.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mackerras <paulus@samba.org>
Cc: Ken Chen <kenchen@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


* Paul Mackerras <paulus@samba.org> wrote:

> Ingo Molnar writes:
> 
> > the real solution is something like the patch below. That generates new 
> > (but harmless) warnings within the powerpc code but those are a one-off 
> > effort to fix and are not reoccuring.
> > 
> > Cc:-ed Paul Mackerras - Paul, am i missing anything?
> 
> That does change the formal types of things exported to userland, and 
> hence technically breaks the ABI, which is why I am cautious about this 
> idea.  Whether or not that causes real problems in practice I'm not 
> sure, but I would want to at least check with the glibc developers 
> first.
> 
> One solution to might be to use an #ifdef __KERNEL__ so that userland 
> still sees the long types but kernel code sees long longs.

which APIs do you mean exactly, could you give me an example please and 
the type of breakage you suspect?

I cannot see how the binary representation could ever change from this. 
(and that is all that an ABI is about - it is an application Binary 
interface. I.e. there's no ABI breakage.)

	Ingo
