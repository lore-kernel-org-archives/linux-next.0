From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: origin tree build failure
Date: Wed, 15 Oct 2008 01:05:41 +0100
Message-ID: <20081015000541.GA22570@opensource.wolfsonmicro.com>
References: <20081015095916.f30c0979.sfr@canb.auug.org.au> <alpine.LFD.2.00.0810141637210.3288@nehalem.linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:42903 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753867AbYJOAFn (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 20:05:43 -0400
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.0810141637210.3288@nehalem.linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Liam Girdwood <lrg@slimlogic.co.uk>

On Tue, Oct 14, 2008 at 04:43:12PM -0700, Linus Torvalds wrote:

> I assume that broken driver is some ARM-specific thing. I certainly don't 
> want to see NO_IRQ in any general drivers. So instead of having that 
> NO_IRQ insanity spread any more, I'd much rather see the driver either 
> fixed to not use it, or just marked ARM-only.

It's not ARM-specific, though the overwhelming majority of users will be
ARM systems (it's an embedded PMIC) - I'll post a patch tomorrow
changing it to check for non-zero IRQ instead.  That makes other bits of
the driver easier, anyway.

> The proper way to test for whether an interrupt is valid or not is to do

> 	if (dev->irq) {
> 		...

> and no other. There is no spoon. That NO_IRQ was insane. And architectures 
> or drivers that still think otherwise should fix themselves.

That would be people on the ARM list.  Unless I misremember I first
heard about using NO_IRQ from the ARM list in connection with another
(much less ARM-specific) driver only within the past six months.
