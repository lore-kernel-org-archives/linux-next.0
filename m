From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: usb tree build warnings
Date: Wed, 29 Apr 2009 10:51:52 -0700
Message-ID: <20090429175152.GA29144@kroah.com>
References: <20090429163949.636a17c5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:46401 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751061AbZD2R6V (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Apr 2009 13:58:21 -0400
Content-Disposition: inline
In-Reply-To: <20090429163949.636a17c5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Sarah Sharp <sarah.a.sharp@linux.intel.com>

On Wed, Apr 29, 2009 at 04:39:49PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build (x86_64 allmodconfig) produced these warnings:
> 
> In file included from drivers/usb/host/xhci-mem.c:27:
> drivers/usb/host/xhci.h: In function 'xhci_writel':
> drivers/usb/host/xhci.h:1083: warning: passing argument 1 of 'xhci_to_hcd' discards qualifiers from pointer target type
> drivers/usb/host/xhci.h:1083: warning: passing argument 1 of 'xhci_to_hcd' discards qualifiers from pointer target type
> drivers/usb/host/xhci.h:1083: warning: cast from pointer to integer of different size
> drivers/usb/host/xhci-mem.c: In function 'xhci_segment_alloc':
> drivers/usb/host/xhci-mem.c:43: warning: cast from pointer to integer of different size
> drivers/usb/host/xhci-mem.c:51: warning: cast from pointer to integer of different size
> drivers/usb/host/xhci-mem.c: In function 'xhci_segment_free':
> drivers/usb/host/xhci-mem.c:66: warning: cast from pointer to integer of different size
> drivers/usb/host/xhci-mem.c:72: warning: cast from pointer to integer of different size
> drivers/usb/host/xhci-mem.c: In function 'xhci_link_segments':
> drivers/usb/host/xhci-mem.c:101: warning: format '%x' expects type 'unsigned int', but argument 4 has type 'dma_addr_t'
> drivers/usb/host/xhci-mem.c:101: warning: format '%x' expects type 'unsigned int', but argument 5 has type 'dma_addr_t'
> drivers/usb/host/xhci-mem.c: In function 'xhci_ring_free':
> drivers/usb/host/xhci-mem.c:115: warning: cast from pointer to integer of different size
> drivers/usb/host/xhci-mem.c: In function 'xhci_ring_alloc':
> drivers/usb/host/xhci-mem.c:140: warning: cast from pointer to integer of different size
> drivers/usb/host/xhci-mem.c:171: warning: cast from pointer to integer of different size
> drivers/usb/host/xhci-mem.c: In function 'xhci_alloc_virt_device':
> drivers/usb/host/xhci-mem.c:245: warning: format '%x' expects type 'unsigned int', but argument 5 has type 'dma_addr_t'
> drivers/usb/host/xhci-mem.c:253: warning: format '%x' expects type 'unsigned int', but argument 5 has type 'dma_addr_t'
> drivers/usb/host/xhci-mem.c:269: warning: cast from pointer to integer of different size
> drivers/usb/host/xhci-mem.c:269: warning: format '%x' expects type 'unsigned int', but argument 6 has type 'dma_addr_t'
> drivers/usb/host/xhci-mem.c: In function 'xhci_setup_addressable_virt_dev':
> drivers/usb/host/xhci-mem.c:342: warning: cast from pointer to integer of different size
> drivers/usb/host/xhci-mem.c: In function 'xhci_mem_init':
> drivers/usb/host/xhci-mem.c:646: warning: cast from pointer to integer of different size
> drivers/usb/host/xhci-mem.c:646: warning: format '%x' expects type 'unsigned int', but argument 4 has type 'dma_addr_t'
> drivers/usb/host/xhci-mem.c:671: warning: cast from pointer to integer of different size
> drivers/usb/host/xhci-mem.c:708: warning: format '%x' expects type 'unsigned int', but argument 4 has type 'dma_addr_t'
> drivers/usb/host/xhci-mem.c:713: warning: cast from pointer to integer of different size
> drivers/usb/host/xhci-mem.c:713: warning: format '%x' expects type 'unsigned int', but argument 6 has type 'dma_addr_t'
> drivers/usb/host/xhci-mem.c:738: warning: format '%x' expects type 'unsigned int', but argument 4 has type 'dma_addr_t'
> 
> There were quite a few more in the xhci code as well.

All should now be resolved in my trees, thanks for being patient.

greg k-h
