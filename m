From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: usb tree build failure
Date: Wed, 29 Apr 2009 08:18:20 -0700
Message-ID: <49F86FBC.5030802@oracle.com>
References: <20090429171752.f70c7de1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:38997 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754533AbZD2PRN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Apr 2009 11:17:13 -0400
In-Reply-To: <20090429171752.f70c7de1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Sarah Sharp <sarah.a.sharp@linux.intel.com>

Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> drivers/usb/built-in.o: In function `.handle_event':
> (.text+0x67dd0): multiple definition of `.handle_event'
> drivers/pcmcia/built-in.o:(.text+0xcfcc): first defined here
> drivers/usb/built-in.o: In function `handle_event':
> (.opd+0x5bc8): multiple definition of `handle_event'
> drivers/pcmcia/built-in.o:(.opd+0xed0): first defined here


There's also this one:

drivers/usb/host/xhci-mem.c:46: error: implicit declaration of function 'dma_pool_alloc'
drivers/usb/host/xhci-mem.c:69: error: implicit declaration of function 'dma_pool_free'
drivers/usb/host/xhci-mem.c:578: error: implicit declaration of function 'dma_pool_destroy'
drivers/usb/host/xhci-mem.c:657: error: implicit declaration of function 'dma_pool_create'

That file needs to
#include <linux/dmapool.h>

-- 
~Randy
