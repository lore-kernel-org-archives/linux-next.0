From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: "clk: add non CONFIG_HAVE_CLK routines" commit
Date: Thu, 14 Jun 2012 11:04:25 +0100
Message-ID: <20120614100425.GC28714@n2100.arm.linux.org.uk>
References: <20120522234621.GA3610@windriver.com> <CAOh2x=mFOPKbzuY__k0RVpFHTdPfa-iN1e3Lpa3iWt9iP6FzFw@mail.gmail.com> <20120613221040.GJ30400@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:56022 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755534Ab2FNKEr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 Jun 2012 06:04:47 -0400
Content-Disposition: inline
In-Reply-To: <20120613221040.GJ30400@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: viresh kumar <viresh.linux@gmail.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Viresh Kumar <viresh.kumar@st.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, fengguang.wu@intel.com, spear-devel <spear-devel@list.st.com>

On Thu, Jun 14, 2012 at 12:10:40AM +0200, Sascha Hauer wrote:
> As the netx does not have fb support in mainline you can just drop this
> one aswell. It has no use.

Are you sure?

Grepping for clcd in arch/arm/mach-netx shows that nxdb500 and nxeb500hmi
seem to have all the necessary stuff to support the AMBA CLCD driver.
