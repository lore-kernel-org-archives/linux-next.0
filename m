From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: linux-next: pci tree build failure
Date: Mon, 30 Jun 2008 10:11:17 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.0806301006040.2585-100000@iolanthe.rowland.org>
References: <20080630142314.34654d3c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:49713 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753353AbYF3OLS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 30 Jun 2008 10:11:18 -0400
In-Reply-To: <20080630142314.34654d3c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org, Greg KH <greg@kroah.com>, "Rafael J. Wysocki" <rjw@sisk.pl>

On Mon, 30 Jun 2008, Stephen Rothwell wrote:

> Hi Jesse,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> drivers/usb/core/driver.c: In function 'do_unbind_rebind':
> drivers/usb/core/driver.c:865: error: 'struct dev_pm_info' has no member named 'sleeping'
> 
> Due to commit 1eede070a59e1cc73da51e1aaa00d9ab86572cfc ("Introduce new
> top level suspend and hibernation callbacks") from the pci tree (which
> removed the sleeping field of the dev_pm_info structure) and commit
> fafa0857b87640d4c297777d432174b8778ac4fd ("USB: Force unbinding of
> drivers lacking reset_resume or other methods") from the usb tree which
> adds a reference.

I knew this was going to happen.  There was no way around it.

> For now I have reverted commit fafa0857b87640d4c297777d432174b8778ac4fd
> ("USB: Force unbinding of drivers lacking reset_resume or other methods")
> from the usb tree since that gives me a building tree without the pain of
> trying to revert 1eede070a59e1cc73da51e1aaa00d9ab86572cfc (which has
> several dependent commits).
> 
> A better solution would be nice (hint, hint).

Instead of reverting that USB commit, take a look at it.  There's a big 
FIXME comment at the point where the obsolete field member is used.  
For now you can insert a patch to remove that line of code.

That's not a correct fix, but it will allow things to build and run.  
Unfortunately it's not possible at this time to submit a correct fix
because the clash occurs between patches in two different development
trees.  In addition, the correct fix involves a non-trivial rewrite of
the USB-PM interface; it can't simply be dashed off.

Alan Stern
