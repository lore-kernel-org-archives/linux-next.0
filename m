From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Wed, 4 Jun 2014 22:02:17 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1406042157220.18296@nanos>
References: <20140604160522.1d788c1e@canb.auug.org.au> <alpine.DEB.2.10.1406041134070.3319@nanos> <CAOesGMhGT30QN2LeVp2sgzY0BjbguW=iw3x1PH8RVB-Rj-GZNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:41056 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751290AbaFDUCe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Jun 2014 16:02:34 -0400
In-Reply-To: <CAOesGMhGT30QN2LeVp2sgzY0BjbguW=iw3x1PH8RVB-Rj-GZNQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, John Stultz <john.stultz@linaro.org>, Linus Torvalds <torvalds@linux-foundation.org>

On Wed, 4 Jun 2014, Olof Johansson wrote:
> On Wed, Jun 4, 2014 at 3:49 AM, Thomas Gleixner <tglx@linutronix.de> wrote:
> So, we'll dial back and stop taking these patches through our tree
> without an explicit ack or shared branch from you (or Daniel on
> clocksource). Not a problem at all.

I prefer the shared branch (for clocksource and irqchip) either from
me or from Daniel(clocksource) / Jason (irqchip).

That way you can proceed and we can do our unrelated changes without
creating merge dependencies.

> On the other hand, it would have been a lot easier
> to handle had the code on your end landed a bit sooner than in the
> middle of the merge window.

I know. I was just burried in futex wreckage for almost a week...

> Not much I can say besides what's above and that I owe you a few beers
> at the next conference.

Don't worry. I let off steam and all is good if we can avoid this in
the future. Though I'm certainly up for a few beers :)

Thanks,

	tglx
