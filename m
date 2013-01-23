From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with Linus' tree
Date: Tue, 22 Jan 2013 20:42:36 -0800
Message-ID: <20130123044236.GB3079@kroah.com>
References: <20130123151552.1b8723dfa9c9a5dd75f7fec2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:57952 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753093Ab3AWElL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Jan 2013 23:41:11 -0500
Content-Disposition: inline
In-Reply-To: <20130123151552.1b8723dfa9c9a5dd75f7fec2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@avionic-design.de>, Linus Walleij <linus.walleij@linaro.org>

On Wed, Jan 23, 2013 at 03:15:52PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/gpio/gpio-mvebu.c between commit 11c0ceec073c ("gpio: mvebu:
> Don't free chip label memory") from Linus' tree and commit 641d03422a59
> ("gpio: Convert to devm_ioremap_resource()") from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.

greg k-h
