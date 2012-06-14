From: viresh kumar <viresh.linux@gmail.com>
Subject: Re: "clk: add non CONFIG_HAVE_CLK routines" commit
Date: Thu, 14 Jun 2012 11:21:13 +0100
Message-ID: <CAOh2x=n64SMQ5OGkUC7NgMNCnRQYRgyc4mes4bDD0TUOMtn1BQ@mail.gmail.com>
References: <20120522234621.GA3610@windriver.com>
	<CAOh2x=mFOPKbzuY__k0RVpFHTdPfa-iN1e3Lpa3iWt9iP6FzFw@mail.gmail.com>
	<20120613221040.GJ30400@pengutronix.de>
	<20120614100425.GC28714@n2100.arm.linux.org.uk>
	<20120614101819.GR30400@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:65218 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750972Ab2FNKVN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 Jun 2012 06:21:13 -0400
Received: by obbtb18 with SMTP id tb18so2218901obb.19
        for <linux-next@vger.kernel.org>; Thu, 14 Jun 2012 03:21:13 -0700 (PDT)
In-Reply-To: <20120614101819.GR30400@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Paul Gortmaker <paul.gortmaker@windriver.com>, Viresh Kumar <viresh.kumar@st.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, fengguang.wu@intel.com, spear-devel <spear-devel@list.st.com>

On Thu, Jun 14, 2012 at 11:18 AM, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> Damn, you are right. I wasn't aware the netx has a AMBA cell and just
> grepped for netx in drivers/video.
> In this case I suggest to just return NULL for every clock.

And dropping fb's clk code would still be the right solution, as dummy
clk routines will
do that for you.

--
viresh
