From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: "clk: add non CONFIG_HAVE_CLK routines" commit
Date: Tue, 12 Jun 2012 19:09:29 +0800
Message-ID: <20120612110929.GA16511@localhost>
References: <20120522234621.GA3610@windriver.com>
 <CAOh2x=mFOPKbzuY__k0RVpFHTdPfa-iN1e3Lpa3iWt9iP6FzFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:25653 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751092Ab2FLLJc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Jun 2012 07:09:32 -0400
Content-Disposition: inline
In-Reply-To: <CAOh2x=mFOPKbzuY__k0RVpFHTdPfa-iN1e3Lpa3iWt9iP6FzFw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: viresh kumar <viresh.linux@gmail.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, Viresh Kumar <viresh.kumar@st.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, spear-devel <spear-devel@list.st.com>

> Following are present in mach-netx/fb.c:
[snip]
> struct clk *clk_get(struct device *dev, const char *id)
> {
> 	return dev && strcmp(dev_name(dev), "fb") == 0 ? NULL : ERR_PTR(-ENOENT);
> }
> 
> I can remove first four without any issues, but just can't remove the last one.
> The dummy clk_get() always returns NULL, whereas this one returns NULL only for
> fb device.
> 
> How should I fix this?

Another thing I'm not sure is that the typical clk_get() callers only
tests IS_ERR() on the returned value. As a clk newbie, I don't know
whether there will be lots of clk users seeing this (new) NULL value
on !CONFIG_HAVE_CLK and whether the current behavior is correct..

Thanks,
Fengguang
