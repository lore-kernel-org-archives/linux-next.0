From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: import of usb series failed
Date: Wed, 17 Feb 2010 16:21:44 -0800
Message-ID: <20100218002144.GA17850@kroah.com>
References: <20100218105500.898ece5e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:45478 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750851Ab0BRAWm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Feb 2010 19:22:42 -0500
Content-Disposition: inline
In-Reply-To: <20100218105500.898ece5e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, Feb 18, 2010 at 10:55:00AM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Importing the usb quilt series failed like this:
> 
> usb-ftdi_sio-correct-spelling-in-header-files.patch
> error: patch failed: drivers/usb/serial/ftdi_sio_ids.h:185
> error: drivers/usb/serial/ftdi_sio_ids.h: patch does not apply
> 
> I removed that patch for today.

Very wierd, you must have gotten this just as I updated my tree.  It
should all be fine tomorrow, if not, please let me know.

thanks,

greg k-h
