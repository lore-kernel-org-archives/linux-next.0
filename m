From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: build failure after merge of the final tree (gpio
 tree related)
Date: Mon, 6 Feb 2012 14:02:13 +0000
Message-ID: <20120206140213.GC10173@sirena.org.uk>
References: <20120206152346.106057d7dd747d0daa47bbc8@canb.auug.org.au>
 <20120206060708.GC21449@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:53048 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754408Ab2BFOCQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 6 Feb 2012 09:02:16 -0500
Content-Disposition: inline
In-Reply-To: <20120206060708.GC21449@ponder.secretlab.ca>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Hans J. Koch" <hjk@linutronix.de>, Torben Hohn <torbenh@linutronix.de>

On Sun, Feb 05, 2012 at 11:07:08PM -0700, Grant Likely wrote:
> On Mon, Feb 06, 2012 at 03:23:46PM +1100, Stephen Rothwell wrote:

> > drivers/gpio/gpio-sodaville.c: In function 'sdv_register_irqsupport':
> > drivers/gpio/gpio-sodaville.c:152:8: error: 'struct irq_domain' has no member named 'irq_base'

> The sodavile is an x86 driver only.  This problem can be solved by
> making it depend on x86, which I'll do now.  When x86 is converted to the
> new irq_domain code the problem will go even further away.

IIRC I saw a similar issue trying to build the twl-core driver on
Samsung platforms (or possibly x86).
