From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree
Date: Mon, 21 Jul 2008 20:14:23 -0700
Message-ID: <20080722031423.GA32013@kroah.com>
References: <20080722105640.8cb5989b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:57208 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753277AbYGVDSg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 Jul 2008 23:18:36 -0400
Content-Disposition: inline
In-Reply-To: <20080722105640.8cb5989b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>

On Tue, Jul 22, 2008 at 10:56:40AM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/usb/core/devio.c between commit
> e04199b2167e88f0e2d0410fafaa2c35ff7ba8c1 ("usbfs: don't store bad
> pointers in registration") from Linus' tree and commits
> 56d207f2504091e7a173640b91cb39072a2f4542 ("device create: usb: convert
> device_create to device_create_drvdata")
> 0de4509ad6495261fba5ebb539ac6fbb5cf66999 ("device create: usb: convert
> device_create_drvdata to device_create") from the driver-core tree.
> 
> I did the (reasonably obvious) fixup in usb_classdev_add.  Probably worth
> a check when I publish the tree.

If the code builds properly, the merge succeeded :)

I'll look at this as I hit this myself when pushing the USB tree to
Linus.  Now it's down to the driver-core tree having to handle these
fixups...

thanks,

greg k-h
