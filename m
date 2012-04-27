From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM:mfd: fix ezx-pcap build failure
Date: Fri, 27 Apr 2012 19:02:35 +0100
Message-ID: <20120427180235.GA19778@sirena.org.uk>
References: <1335366163-12920-1-git-send-email-mark.asselstine@windriver.com>
 <20120426215258.GG24211@n2100.arm.linux.org.uk>
 <2732324.Os5djSkuuZ@yow-masselst-d1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:40541 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759229Ab2D0SCs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 27 Apr 2012 14:02:48 -0400
Content-Disposition: inline
In-Reply-To: <2732324.Os5djSkuuZ@yow-masselst-d1>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, openezx-devel@lists.openezx.org, sameo@linux.intel.com, haojian.zhuang@marvell.com, Grant Likely <grant.likely@secretlab.ca>, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri, Apr 27, 2012 at 11:28:28AM -0400, Mark Asselstine wrote:
> On April 26, 2012 22:52:58 Russell King - ARM Linux wrote:

> > What is the effect when the supplied IRQ does not have a mapping to a
> > GPIO - or it _does_ by way of a badly coded irq_to_gpio() function
> > but that GPIO is not the correct one.

> > There is no prevention against endlessly looping, so it could cause a
> > system lockup.

> Unfortunately the commit [b1148fd4 mfd: fix pcap irq bottom handler
> ] which modified things to loop as long as the interrupt is asserted didn't 
> supply much information regarding the behavior they were trying to achieve/fix 
> nor what would be the consequence of bailing earlier.

The usual reason for this pattern is to simulate level triggered IRQs on
an edge triggered interrupt controller.
