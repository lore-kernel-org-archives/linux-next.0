From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: usb series import failure
Date: Sun, 19 Apr 2009 22:14:09 -0700
Message-ID: <20090420051409.GA6254@kroah.com>
References: <20090420102137.ae71f973.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:51112 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753185AbZDTFZs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Apr 2009 01:25:48 -0400
Content-Disposition: inline
In-Reply-To: <20090420102137.ae71f973.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Mon, Apr 20, 2009 at 10:21:37AM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's import of the usb quilt series failed like this:
> 
> $ git quiltimport --author Greg KH <greg@kroah.com> --patches ../quilt/usb
> musb_gadget-fix-unhandled-endpoint-0-irqs.patch
> musb_gadget-suppress-parasitic-tx-interrupts-with-cppi.patch
> error: patch failed: drivers/usb/musb/musb_gadget.c:349
> error: drivers/usb/musb/musb_gadget.c: patch does not apply
> 
> I assume there have been some changes in the upstream tree to cause this
> since that series hasn't changed since Friday.  I will have to drop the
> usb tree for today (and the staging tree that depends on it).

Sorry, it was my fault, I messed up pushing my tree to kernel.org.  It
should all be resolved for your tree tomorrow.  Thanks for letting me
know, and again, sorry for the mistake.

greg k-h
