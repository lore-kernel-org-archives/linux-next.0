From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: Signed-off-by missing for commit in the tip tree
Date: Thu, 21 Dec 2017 11:25:18 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1712211122290.1741@nanos>
References: <20171220070651.2816be29@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:54478 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752181AbdLUKZl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Dec 2017 05:25:41 -0500
In-Reply-To: <20171220070651.2816be29@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, 20 Dec 2017, Stephen Rothwell wrote:

> Hi all,
> 
> Commit
> 
>   44d5c715330c ("x86/mm: Create asm/invpcid.h")
> 
> is missing a Signed-off-by from its committer.

Yes. That's from the PTI work in progress branch. It was high flux so we
did not care much about those details and the patches went back and forth
between various people. So if we would have done that by the book we'd have
something like.

SOB: tglx
SOB: peterz
SOB: mingo
SOB: tglx
SOB: mingo
SOB: tglx

We'll clean that up for the final version

Thanks,

	tglx
