From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: origin tree build failure
Date: Wed, 15 Oct 2008 10:02:47 +0100
Message-ID: <20081015100247.1dc2d99f@lxorguk.ukuu.org.uk>
References: <20081015095916.f30c0979.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:33154 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752111AbYJOJDP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Oct 2008 05:03:15 -0400
In-Reply-To: <20081015095916.f30c0979.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, LKML <linux-kernel@vger.kernel.org>, Liam Girdwood <lrg@slimlogic.co.uk>

> drivers/mfd/wm8350-core.c: In function 'wm8350_device_init':
> drivers/mfd/wm8350-core.c:1220: error: 'NO_IRQ' undeclared (first use in this function)
> 
> Caused by commit ebccec0fa4e35dff0c18663a492a65f4dc6cad7a ("mfd: Add
> WM8350 interrupt support").

Should just be testing !irq

> 
> I applied the following (probably incorrect) patch.  Maybe this driver
> needs to be restricted to certain architectures?  (NO_IRQ appears to only
> be defined for arm, blackfin, powerpc, mn10300 and parisc)

NO_IRQ is an old IDE private define that some people kept abusing
