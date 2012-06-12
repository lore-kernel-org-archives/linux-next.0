From: viresh kumar <viresh.kumar2@arm.com>
Subject: Re: "clk: add non CONFIG_HAVE_CLK routines" commit
Date: Tue, 12 Jun 2012 12:13:23 +0100
Message-ID: <4FD72453.1040602@arm.com>
References: <20120522234621.GA3610@windriver.com> <CAOh2x=mFOPKbzuY__k0RVpFHTdPfa-iN1e3Lpa3iWt9iP6FzFw@mail.gmail.com> <20120612110929.GA16511@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:52207 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751354Ab2FLLN2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Jun 2012 07:13:28 -0400
In-Reply-To: <20120612110929.GA16511@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: viresh kumar <viresh.linux@gmail.com>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, spear-devel <spear-devel@list.st.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 12/06/12 12:09, Fengguang Wu wrote:
> Another thing I'm not sure is that the typical clk_get() callers only
> tests IS_ERR() on the returned value. As a clk newbie, I don't know
> whether there will be lots of clk users seeing this (new) NULL value
> on !CONFIG_HAVE_CLK and whether the current behavior is correct..

There have been long discussions over it in past, check this thread

https://lkml.org/lkml/2012/4/24/389

--
Viresh

-- IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium.  Thank you.
