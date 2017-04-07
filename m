From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb-gadget tree with the usb tree
Date: Fri, 7 Apr 2017 14:45:17 +1000
Message-ID: <20170407144517.19e4fb7d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41845 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752167AbdDGEpT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 7 Apr 2017 00:45:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Felipe Balbi <balbi@kernel.org>, Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Romain Perier <romain.perier@collabora.com>, "Gustavo A. R. Silva" <garsilva@embeddedor.com>

Hi Felipe,

Today's linux-next merge of the usb-gadget tree got a conflict in:

  drivers/usb/gadget/udc/amd5536udc.c

between commit:

  b5a6a4e5baef ("usb: gadget: amd5536udc: Replace PCI pool old API")

from the usb tree and commit:

  7bf80fcd797f ("usb: gadget: udc: avoid use of freed pointer")

from the usb-gadget tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/usb/gadget/udc/amd5536udc.c
index 270876b438ab,91d0f1a4dac1..000000000000
--- a/drivers/usb/gadget/udc/amd5536udc.c
+++ b/drivers/usb/gadget/udc/amd5536udc.c
@@@ -618,17 -579,12 +579,12 @@@ static void udc_free_dma_chain(struct u
  	DBG(dev, "free chain req = %p\n", req);
  
  	/* do not free first desc., will be done by free for request */
- 	td_last = req->td_data;
- 	td = phys_to_virt(td_last->next);
- 
  	for (i = 1; i < req->chain_len; i++) {
- 		dma_pool_free(dev->data_requests, td,
- 			      (dma_addr_t)td_last->next);
- 		td_last = td;
- 		td = phys_to_virt(td_last->next);
+ 		td = phys_to_virt(addr);
+ 		addr_next = (dma_addr_t)td->next;
 -		pci_pool_free(dev->data_requests, td, addr);
++		dma_pool_free(dev->data_requests, td, addr);
+ 		addr = addr_next;
  	}
- 
- 	return ret_val;
  }
  
  /* Frees request packet, called by gadget driver */
