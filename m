From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the devicetree tree
Date: Mon, 12 Aug 2013 23:14:06 -0700
Message-ID: <20130813061406.GB9854@kroah.com>
References: <20130813154106.f89661732443289013035481@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:44758 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755090Ab3HMGX3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 13 Aug 2013 02:23:29 -0400
Content-Disposition: inline
In-Reply-To: <20130813154106.f89661732443289013035481@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Grant Likely <grant.likely@secretlab.ca>, Sascha Hauer <s.hauer@pengutronix.de>

On Tue, Aug 13, 2013 at 03:41:06PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in include/linux/of.h between commit 2adfffa22350 ("OF: make of_property_for_each_{u32|string}() use parameters if OF is not enabled") from the devicetree tree and commit 5c19e95216b9 ("OF: Add helper for matching against linux,stdout-path") from the tty tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.

> Out of interest, why does of_device_is_stdout_path() not return bool?

Good question, Sascha, any ideas?

greg k-h
