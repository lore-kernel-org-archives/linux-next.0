From: Paul Mackerras <paulus@samba.org>
Subject: Re: linux-next: sched tree build warning
Date: Mon, 22 Dec 2008 19:14:48 +1100
Message-ID: <18767.19576.286910.148623@cargo.ozlabs.ibm.com>
References: <20081222152247.b934ed5b.sfr@canb.auug.org.au>
	<b040c32a0812212249p45aba306tbb68a960b79cd0ee@mail.gmail.com>
	<20081222070426.GD29160@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:46340 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752991AbYLVIO5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Dec 2008 03:14:57 -0500
In-Reply-To: <20081222070426.GD29160@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Ken Chen <kenchen@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

Ingo Molnar writes:

> the real solution is something like the patch below. That generates new 
> (but harmless) warnings within the powerpc code but those are a one-off 
> effort to fix and are not reoccuring.
> 
> Cc:-ed Paul Mackerras - Paul, am i missing anything?

That does change the formal types of things exported to userland, and
hence technically breaks the ABI, which is why I am cautious about
this idea.  Whether or not that causes real problems in practice I'm
not sure, but I would want to at least check with the glibc developers
first.

One solution to might be to use an #ifdef __KERNEL__ so that userland
still sees the long types but kernel code sees long longs.

Paul.
