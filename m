From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: usb.current tree build failure
Date: Tue, 7 Apr 2009 19:20:39 -0700
Message-ID: <20090408022039.GA13392@kroah.com>
References: <20090408101007.40822ec6.sfr@canb.auug.org.au> <20090408014830.GA13223@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:53688 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754915AbZDHCW7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Apr 2009 22:22:59 -0400
Content-Disposition: inline
In-Reply-To: <20090408014830.GA13223@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, David Vrabel <david.vrabel@csr.com>

On Tue, Apr 07, 2009 at 06:48:30PM -0700, Greg KH wrote:
> On Wed, Apr 08, 2009 at 10:10:07AM +1000, Stephen Rothwell wrote:
> > Hi Greg,
> > 
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > drivers/block/ub.c: In function 'ub_scsi_urb_compl':
> > drivers/block/ub.c:1052: error: implicit declaration of function 'usb_settoggle'
> > 
> > Caused by commit 876d77e4521ff2b4f937bf7104bf70d2d105b0c2 ("USB: add
> > reset endpoint operations") from the usb.current tree.
> > 
> > I have used the version of that tree from next-20090407. (Which means I
> > need to do the same for the driver-core, usb and staring trees that
> > depend on the usb.current tree.)
> 
> I think I'll just drop these patches, as this isn't ok.
> 
> David, care to respin these and resend them to me?  I'll have to drop
> your whole series :(

I've now dropped your 6 patches and pushed out a new series so that
linux-next will build properly with the usb tree in it tomorrow.

Stephen, sorry for the trouble.

greg k-h
