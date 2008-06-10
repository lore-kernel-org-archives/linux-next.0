From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: usb build failure
Date: Mon, 9 Jun 2008 19:13:47 -0700
Message-ID: <20080610021347.GA11173@kroah.com>
References: <20080610115603.db3c1847.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:54371 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752158AbYFJCPi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Jun 2008 22:15:38 -0400
Content-Disposition: inline
In-Reply-To: <20080610115603.db3c1847.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, Jiri Kosina <jikos@jikos.cz>

On Tue, Jun 10, 2008 at 11:56:03AM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build (powerpc ppc64_defconfig) with the usb tree
> applied failed like this:
> 
> drivers/hid/usbhid/hiddev.c: In function 'hiddev_compat_ioctl':
> drivers/hid/usbhid/hiddev.c:767: warning: passing argument 1 of 'hiddev_ioctl' from incompatible pointer type
> drivers/hid/usbhid/hiddev.c:767: warning: passing argument 2 of 'hiddev_ioctl' makes integer from pointer without a cast
> drivers/hid/usbhid/hiddev.c:767: error: too many arguments to function 'hiddev_ioctl'
> 
> This was fixed in Jiri's hid tree on May 27 using a patch like that below
> (though this patch is more complete in that it removes the now unused
> inode variable).
> 
> You and Jiri should decide who is carrying the patch "USB: hiddev: Switch
> to unlocked_ioctl".  Currently it is in both the usb and the hid trees.

I'll drop it from mine, sorry, I was going to wait until I saw Jiri
apply it.

thanks,

greg k-h
