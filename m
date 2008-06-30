From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: linux-next: Tree for June 30 (USB: cdc-acm)
Date: Mon, 30 Jun 2008 15:32:44 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.0806301531310.2138-100000@iolanthe.rowland.org>
References: <20080630190125.GA3553@kroah.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:49730 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753878AbYF3Tcp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 30 Jun 2008 15:32:45 -0400
In-Reply-To: <20080630190125.GA3553@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Oliver Neukum <oliver@neukum.org>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, 30 Jun 2008, Greg KH wrote:

> On Mon, Jun 30, 2008 at 11:43:32AM -0700, Randy Dunlap wrote:
> > cdc-acm fails to build when CONFIG_PM=n:
> > 
> > linux-next-20080630/drivers/usb/class/cdc-acm.c: In function 'acm_suspend':
> > linux-next-20080630/drivers/usb/class/cdc-acm.c:1263: error: 'struct usb_device' has no member named 'auto_pm'
> > make[4]: *** [drivers/usb/class/cdc-acm.o] Error 1
> 
> Yeah, known issue due to the pm and usb trees conflicting here.  It will
> be fixed up at the merge time with Linus.
> 
> Or so Alan promises :)

Not me this time -- cdc-acm is Oliver's doing.

Alan Stern
