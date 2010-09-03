From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the microblaze
	tree
Date: Thu, 2 Sep 2010 20:27:18 -0700
Message-ID: <20100903032718.GA13847@kroah.com>
References: <20100903130236.1f5f331c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:36303 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752832Ab0ICDa4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 2 Sep 2010 23:30:56 -0400
Content-Disposition: inline
In-Reply-To: <20100903130236.1f5f331c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Simek <michal.simek@petalogix.com>, Jason Wessel <jason.wessel@windriver.com>

On Fri, Sep 03, 2010 at 01:02:36PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in
> drivers/serial/uartlite.c between commit
> 52ea4a7ef12f286bd68d13a93daaa688f56a1e14 ("serial: Add CONSOLE_POLL
> support for uartlite") from the microblaze tree and commit
> 0e5176373d9c9a7741b54ce81a9eea342291bdca ("serial: Add CONSOLE_POLL
> support for uartlite") from the tty tree.
> 
> The same, but slightly different patch. I used the version from the tty
> tree.

Yes please, that's the version that works :)

Can someone drop it from the microblaze tree please?

thanks,

greg k-h
