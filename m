From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: driver-core tree build failure
Date: Tue, 23 Jun 2009 09:28:21 -0700
Message-ID: <20090623162821.GA8482@kroah.com>
References: <20090623160100.ab086e63.sfr@canb.auug.org.au> <20090623152916.GA27467@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:53077 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751316AbZFWQcd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Jun 2009 12:32:33 -0400
Content-Disposition: inline
In-Reply-To: <20090623152916.GA27467@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

On Tue, Jun 23, 2009 at 08:29:16AM -0700, Greg KH wrote:
> On Tue, Jun 23, 2009 at 04:01:00PM +1000, Stephen Rothwell wrote:
> > Hi Greg,
> > 
> > Today's linux-next build (arm omap_osk_5912_defconfig) failed like this:
> > 
> > drivers/video/omap/omapfb_main.c: In function 'omapfb_show_caps_num':
> > drivers/video/omap/omapfb_main.c:1253: error: 'struct device' has no member named 'driver_data'
> > drivers/video/omap/omapfb_main.c: In function 'omapfb_show_caps_text':
> > drivers/video/omap/omapfb_main.c:1273: error: 'struct device' has no member named 'driver_data'
> > drivers/video/omap/omapfb_main.c: In function 'omapfb_show_panel_name':
> > drivers/video/omap/omapfb_main.c:1320: error: 'struct device' has no member named 'driver_data'
> > drivers/video/omap/omapfb_main.c: In function 'omapfb_show_bklight_level':
> > drivers/video/omap/omapfb_main.c:1329: error: 'struct device' has no member named 'driver_data'
> > drivers/video/omap/omapfb_main.c: In function 'omapfb_store_bklight_level':
> > drivers/video/omap/omapfb_main.c:1344: error: 'struct device' has no member named 'driver_data'
> > drivers/video/omap/omapfb_main.c: In function 'omapfb_show_bklight_max':
> > drivers/video/omap/omapfb_main.c:1363: error: 'struct device' has no member named 'driver_data'
> > drivers/video/omap/omapfb_main.c: In function 'omapfb_show_ctrl_name':
> > drivers/video/omap/omapfb_main.c:1396: error: 'struct device' has no member named 'driver_data'
> > 
> > Caused by commit 53d8ba57f16029a47ed5df9840ab6c3f9abd3727 ("Driver core:
> > move dev_get/set_drvdata to drivers/base/dd.c") from the driver-core tree.
> > 
> > I see more grepping in your future :-)
> 
> Heh, thanks, I got i386, x86-64, and ppc64 working properly this time
> around, but new things keep slipping in :)
> 
> I'll go resolve these as well.

Now fixed and pushed out.

thanks,

greg k-h
