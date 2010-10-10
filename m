From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Tree for October 8 (staging/intel_sst)
Date: Sun, 10 Oct 2010 13:29:21 -0700
Message-ID: <20101010202921.GB4900@kroah.com>
References: <20101008161552.07c9f137.sfr@canb.auug.org.au> <20101010115618.b048a89e.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:60505 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753146Ab0JKDW0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 10 Oct 2010 23:22:26 -0400
Content-Disposition: inline
In-Reply-To: <20101010115618.b048a89e.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, driverdevel <devel@driverdev.osuosl.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vinod.koul@intel.com>, Harsha Priya <priya.harsha@intel.com>, Dharageswari R <dharageswari.r@intel.com>

On Sun, Oct 10, 2010 at 11:56:18AM -0700, Randy Dunlap wrote:
> On Fri, 8 Oct 2010 16:15:52 +1100 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Changes since 20101007:
> 
> 
> drivers/staging/intel_sst/intel_sst_drv_interface.c:88: error: implicit declaration of function 'msleep'
> 
> needs
> #include <linux/delay.h>

Care to send a patch?

thanks,

greg k-h
