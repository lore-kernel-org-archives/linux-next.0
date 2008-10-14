From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: origin tree build failure
Date: Tue, 14 Oct 2008 16:43:12 -0700 (PDT)
Message-ID: <alpine.LFD.2.00.0810141637210.3288@nehalem.linux-foundation.org>
References: <20081015095916.f30c0979.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:34521 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752594AbYJNXnb (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 19:43:31 -0400
In-Reply-To: <20081015095916.f30c0979.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, LKML <linux-kernel@vger.kernel.org>, Liam Girdwood <lrg@slimlogic.co.uk>



On Wed, 15 Oct 2008, Stephen Rothwell wrote:
> 
> drivers/mfd/wm8350-core.c: In function 'wm8350_device_init':
> drivers/mfd/wm8350-core.c:1220: error: 'NO_IRQ' undeclared (first use in this function)
> 
> Caused by commit ebccec0fa4e35dff0c18663a492a65f4dc6cad7a ("mfd: Add
> WM8350 interrupt support").
> 
> I applied the following (probably incorrect) patch.  Maybe this driver
> needs to be restricted to certain architectures?  (NO_IRQ appears to only
> be defined for arm, blackfin, powerpc, mn10300 and parisc)

Grr. Can we please just get rid of that IDIOTIC thing instead?

NO_IRQ was a bad idea to begin with. Let's not add more.

I assume that broken driver is some ARM-specific thing. I certainly don't 
want to see NO_IRQ in any general drivers. So instead of having that 
NO_IRQ insanity spread any more, I'd much rather see the driver either 
fixed to not use it, or just marked ARM-only.

The proper way to test for whether an interrupt is valid or not is to do

	if (dev->irq) {
		...

and no other. There is no spoon. That NO_IRQ was insane. And architectures 
or drivers that still think otherwise should fix themselves.

		Linus
