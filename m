From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Tree for August 18 (usb gadget build error)
Date: Mon, 18 Aug 2008 16:00:56 -0700
Message-ID: <20080818230056.GA26819@kroah.com>
References: <20080818175931.52d2b2d6.sfr@canb.auug.org.au> <20080818123739.93111805.randy.dunlap@oracle.com> <200808181555.33062.david-b@pacbell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:53565 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752019AbYHRXEW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 18 Aug 2008 19:04:22 -0400
Content-Disposition: inline
In-Reply-To: <200808181555.33062.david-b@pacbell.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Brownell <david-b@pacbell.net>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, lud <linux-usb@vger.kernel.org>

On Mon, Aug 18, 2008 at 03:55:32PM -0700, David Brownell wrote:
> On Monday 18 August 2008, Randy Dunlap wrote:
> > ERROR: "ecm_bind_config" [drivers/usb/gadget/g_cdc.ko] undefined!
> > 
> > config attached.
> 
> I'm guessing that's associate with Greg's patches to
> split the gadget drivers up into lots of little modules.
> 
> I'm really not keen on that, and I guess that means I'll
> have to send the alternate patches (even though I got no
> feedback from my posts on those topics).

Sorry, was off trying to enjoy a weekend :)

I just responded, and it looks like I'm going to drop those patches and
go with David's last patch/idea, hopefully -next tomorrow will be all
fixed up.

I'll post the patch series when I get everything building properly to
linux-usb for review.

thanks,

greg k-h
