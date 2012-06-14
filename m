From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: "clk: add non CONFIG_HAVE_CLK routines" commit
Date: Thu, 14 Jun 2012 12:18:19 +0200
Message-ID: <20120614101819.GR30400@pengutronix.de>
References: <20120522234621.GA3610@windriver.com>
 <CAOh2x=mFOPKbzuY__k0RVpFHTdPfa-iN1e3Lpa3iWt9iP6FzFw@mail.gmail.com>
 <20120613221040.GJ30400@pengutronix.de>
 <20120614100425.GC28714@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:43484 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755692Ab2FNKSb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 Jun 2012 06:18:31 -0400
Content-Disposition: inline
In-Reply-To: <20120614100425.GC28714@n2100.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: viresh kumar <viresh.linux@gmail.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Viresh Kumar <viresh.kumar@st.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, fengguang.wu@intel.com, spear-devel <spear-devel@list.st.com>

On Thu, Jun 14, 2012 at 11:04:25AM +0100, Russell King - ARM Linux wrote:
> On Thu, Jun 14, 2012 at 12:10:40AM +0200, Sascha Hauer wrote:
> > As the netx does not have fb support in mainline you can just drop this
> > one aswell. It has no use.
> 
> Are you sure?
> 
> Grepping for clcd in arch/arm/mach-netx shows that nxdb500 and nxeb500hmi
> seem to have all the necessary stuff to support the AMBA CLCD driver.

Damn, you are right. I wasn't aware the netx has a AMBA cell and just
grepped for netx in drivers/video.
In this case I suggest to just return NULL for every clock.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
