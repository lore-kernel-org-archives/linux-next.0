From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: input tree build failure
Date: Tue, 19 Aug 2008 12:59:56 -0700
Message-ID: <20080819195956.GC10502@kroah.com>
References: <20080819163148.159c7d8c.sfr@canb.auug.org.au> <20080819084729.ZZRA012@mailhub.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:53806 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755374AbYHSUI6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Aug 2008 16:08:58 -0400
Content-Disposition: inline
In-Reply-To: <20080819084729.ZZRA012@mailhub.coreip.homeip.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, "Alfred E. Heggestad" <aeh@db.org>

On Tue, Aug 19, 2008 at 09:01:24AM -0400, Dmitry Torokhov wrote:
> On Tue, Aug 19, 2008 at 04:31:48PM +1000, Stephen Rothwell wrote:
> > Hi Dmitry,
> > 
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > drivers/input/misc/cm109.c: In function 'cm109_usb_suspend':
> > drivers/input/misc/cm109.c:768: error: implicit declaration of function 'info'
> > 
> > Caused by commit c04148f915e5ba7947752e6348e0da4cdab1329e ("Input: add
> > driver for USB VoIP phones with CM109 chipset") adding a usage of the info
> > () function while commit 8aac48f4f2460b00468fd5f1101addf3df04e94c ("USB:
> > remove info() macro from usb.h") from the usb tree removed it.
> > 
> > I applied the following patch (which may not be the best).
> 
> Thank you Stephen, but I wonder if total removal of info() and warn()
> is a good thing, since they provide standard way of outputting data
> from modules when there is no device, i.e. at the time of driver
> registration or removal.
> 
> Greg, do you think we could keep err, warn and info (maybe renaming to
> dr_err, dr_warn and dr_info and probably moving them to kernel.h)
> while still taking the parts of your patch that convert drivers to use
> dev_* macros when possible?

No, the goal here is to remove macros that merely wrap up printk().  The
err(), warn(), and info() macros are _old_ (2.3 days), and whenever you
use or see them you need to remember exactly what they do (add the
file/module name, no \n needed, etc.)

In the _very rare_ cases that you need/want a printk and you don't have
access to a struct device in a module, then just use a call to printk().
That way everyone knows exactly what you are doing, you don't have to
remember the wierd \n issues, and people can later just remove them as
usually they are pointless (advertising that a module is loaded is
generally just noise.)

So I really don't want to re-introduce these functions, especially given
the work to standardize on kernel messages, we want to clean up the
code, not add more options to developers to get wrong :)

thanks,

greg k-h
