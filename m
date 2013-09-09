From: Jon Mason <jon.mason@intel.com>
Subject: Re: linux-next: Tree for Sep 9 (ntb)
Date: Mon, 9 Sep 2013 16:19:47 -0700
Message-ID: <20130909231947.GB17587@jonmason-lab>
References: <20130909161616.0d663a37c9d5b6b3a2a2735a@canb.auug.org.au>
 <522E0FA3.6060900@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:46597 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756037Ab3IIXTs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Sep 2013 19:19:48 -0400
Content-Disposition: inline
In-Reply-To: <522E0FA3.6060900@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>

On Mon, Sep 09, 2013 at 11:12:51AM -0700, Randy Dunlap wrote:
> On 09/08/13 23:16, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Please do not add any code for v3.13 to your linux-next included branches
> > until after v3.12-rc1 is released.
> > 
> > Changes since 20130906:
> > 
> 
> 
> on x86_64:
> 
> drivers/built-in.o: In function `ntb_transport_free_queue':
> (.text+0x150344): undefined reference to `dma_sync_wait'
> drivers/built-in.o: In function `ntb_transport_create_queue':
> (.text+0x1504b5): undefined reference to `dma_find_channel'
> drivers/built-in.o: In function `ntb_transport_rx':
> ntb_transport.c:(.text+0x150c65): undefined reference to `dma_sync_wait'
> 
> 
> ntb_transport.c uses several dma_*() interfaces.
> It looks like it needs to select DMA_ENGINE at a minimum.

Discussed it with Dan Williams, and will have a patch out shortly
correct it.

Thanks,
Jon

> 
> 
> -- 
> ~Randy
