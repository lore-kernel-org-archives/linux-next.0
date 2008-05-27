From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: usb/sparc build failure
Date: Tue, 27 May 2008 11:02:36 -0700
Message-ID: <20080527180236.GA23505@kroah.com>
References: <20080527202630.6352736d.sfr@canb.auug.org.au> <483C47D3.2090705@csr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pentafluge.infradead.org ([213.146.154.40]:49492 "EHLO
	pentafluge.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756044AbYE0SFd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 May 2008 14:05:33 -0400
Content-Disposition: inline
In-Reply-To: <483C47D3.2090705@csr.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Vrabel <david.vrabel@csr.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

On Tue, May 27, 2008 at 06:41:39PM +0100, David Vrabel wrote:
> Stephen Rothwell wrote:
> > Hi Greg,
> > 
> > Today's (though it is not new) linux-next build (spac allmodconfig) fails
> > like this:
> > 
> > drivers/uwb/whci.c:166: error: `DMA_64BIT_MASK' undeclared (first use in this function)
> > drivers/uwb/whci.c:166: error: (Each undeclared identifier is reported only once
> > drivers/uwb/whci.c:166: error: for each function it appears in.)
> > drivers/uwb/whci.c:168: error: `DMA_32BIT_MASK' undeclared (first use in this function)
> > drivers/uwb/whc-rc.c:268: error: implicit declaration of function `dma_alloc_coherent'
> > drivers/uwb/whc-rc.c:286: error: implicit declaration of function `dma_free_coherent'
> > drivers/usb/host/whci/pzl.c:372: error: implicit declaration of function `dma_alloc_coherent'
> > drivers/usb/host/whci/pzl.c:395: error: implicit declaration of function `dma_free_coherent'
> > drivers/usb/host/whci/init.c:132: error: implicit declaration of function `dma_alloc_coherent'
> > drivers/usb/host/whci/init.c:162: error: implicit declaration of function `dma_free_coherent'
> > drivers/usb/host/whci/hw.c:48: error: implicit declaration of function `dma_map_single'
> > drivers/usb/host/whci/hw.c:48: error: `DMA_TO_DEVICE' undeclared (first use in this function)
> > drivers/usb/host/whci/hw.c:48: error: (Each undeclared identifier is reported only once
> > drivers/usb/host/whci/hw.c:48: error: for each function it appears in.)
> > drivers/usb/host/whci/hw.c:78: error: implicit declaration of function `dma_unmap_single'
> > drivers/usb/host/whci/qset.c:274: error: implicit declaration of function `dma_unmap_single'
> > drivers/usb/host/whci/qset.c:276: error: `DMA_TO_DEVICE' undeclared (first use in this function)
> > drivers/usb/host/whci/qset.c:276: error: (Each undeclared identifier is reported only once
> > drivers/usb/host/whci/qset.c:276: error: for each function it appears in.)
> > drivers/usb/host/whci/qset.c:326: error: implicit declaration of function `dma_map_single'
> > drivers/usb/host/whci/qset.c:326: error: `DMA_TO_DEVICE' undeclared (first use in this function)
> > 
> > I suspect that these files should include linux/dma-mapping.h directly
> > since it uses things from there.
> 
> How odd.  Looking at my local patch set this has been fixed but looking
> at the patches Greg has and I see it's not.  Try this.
> 
> I also note that some architectures (sparc amongst them) will BUG with
> these drivers as the DMA API is only available to PCI devices. The
> whc-rc and whci-hcd drivers use umc devices which are children of a PCI
> device.

Thanks, I've now merged this in with my patch series.

greg k-h
