From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: usb tree build failure
Date: Wed, 29 Apr 2009 08:37:14 -0700
Message-ID: <20090429153714.GB22297@kroah.com>
References: <20090429171752.f70c7de1.sfr@canb.auug.org.au> <49F86FBC.5030802@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:54176 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757497AbZD2PlL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Apr 2009 11:41:11 -0400
Content-Disposition: inline
In-Reply-To: <49F86FBC.5030802@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Sarah Sharp <sarah.a.sharp@linux.intel.com>

On Wed, Apr 29, 2009 at 08:18:20AM -0700, Randy Dunlap wrote:
> Stephen Rothwell wrote:
> > Hi Greg,
> > 
> > Today's linux-next build (powerpc allyesconfig) failed like this:
> > 
> > drivers/usb/built-in.o: In function `.handle_event':
> > (.text+0x67dd0): multiple definition of `.handle_event'
> > drivers/pcmcia/built-in.o:(.text+0xcfcc): first defined here
> > drivers/usb/built-in.o: In function `handle_event':
> > (.opd+0x5bc8): multiple definition of `handle_event'
> > drivers/pcmcia/built-in.o:(.opd+0xed0): first defined here
> 
> 
> There's also this one:
> 
> drivers/usb/host/xhci-mem.c:46: error: implicit declaration of function 'dma_pool_alloc'
> drivers/usb/host/xhci-mem.c:69: error: implicit declaration of function 'dma_pool_free'
> drivers/usb/host/xhci-mem.c:578: error: implicit declaration of function 'dma_pool_destroy'
> drivers/usb/host/xhci-mem.c:657: error: implicit declaration of function 'dma_pool_create'
> 
> That file needs to
> #include <linux/dmapool.h>

What arch had this problem?

thanks,

greg k-h
