From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree with the usb-gadget-fixes
 tree
Date: Thu, 23 Mar 2017 13:16:33 +1100
Message-ID: <20170323131633.44445bd0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Felipe Balbi <balbi@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <garsilva@embeddedor.com>, Romain Perier <romain.perier@collabora.com>
List-Id: linux-next.vger.kernel.org

Hi Greg,

Today's linux-next merge of the usb tree got a conflict in:

  drivers/usb/gadget/udc/pch_udc.c

between commit:

  1f459262b0e1 ("usb: gadget: udc: remove pointer dereference after free")

from the usb-gadget-fixes tree and commit:

  d293408ef303 ("usb: gadget: pch_udc: Replace PCI pool old API")

from the usb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/usb/gadget/udc/pch_udc.c
index 8a365aad66fe,84dcbcd756f0..000000000000
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@@ -1522,7 -1522,8 +1522,7 @@@ static void pch_udc_free_dma_chain(stru
  		/* do not free first desc., will be done by free for request */
  		td = phys_to_virt(addr);
  		addr2 = (dma_addr_t)td->next;
- 		pci_pool_free(dev->data_requests, td, addr);
+ 		dma_pool_free(dev->data_requests, td, addr);
 -		td->next = 0x00;
  		addr = addr2;
  	}
  	req->chain_len = 1;
