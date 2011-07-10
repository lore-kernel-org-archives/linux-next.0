From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] usb/gadget: fix net2272 printk formats
Date: Sun, 10 Jul 2011 11:41:47 -0700
Message-ID: <20110710114147.c4ae629f.randy.dunlap@oracle.com>
References: <20110707172544.867b980a1196db005b577c14@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110707172544.867b980a1196db005b577c14@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Felipe Balbi <balbi@ti.com>, lud <linux-usb@vger.kernel.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix printk formats for dma_addr_t:

drivers/usb/gadget/net2272.c:740: warning: format '%08x' expects type 'unsigned int', but argument 6 has type 'dma_addr_t'
drivers/usb/gadget/net2272.c:859: warning: format '%08x' expects type 'unsigned int', but argument 8 has type 'dma_addr_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/usb/gadget/net2272.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20110706.orig/drivers/usb/gadget/net2272.c
+++ linux-next-20110706/drivers/usb/gadget/net2272.c
@@ -737,8 +737,8 @@ net2272_kick_dma(struct net2272_ep *ep, 
 	if (req->req.length & 1)
 		return -EINVAL;
 
-	dev_vdbg(ep->dev->dev, "kick_dma %s req %p dma %08x\n",
-		ep->ep.name, req, req->req.dma);
+	dev_vdbg(ep->dev->dev, "kick_dma %s req %p dma %08llx\n",
+		ep->ep.name, req, (unsigned long long)(req->req.dma));
 
 	net2272_ep_write(ep, EP_RSPSET, 1 << ALT_NAK_OUT_PACKETS);
 
@@ -856,9 +856,9 @@ net2272_queue(struct usb_ep *_ep, struct
 		req->mapped = 1;
 	}
 
-	dev_vdbg(dev->dev, "%s queue req %p, len %d buf %p dma %08x %s\n",
+	dev_vdbg(dev->dev, "%s queue req %p, len %d buf %p dma %08llx %s\n",
 		_ep->name, _req, _req->length, _req->buf,
-		_req->dma, _req->zero ? "zero" : "!zero");
+		(unsigned long long)(_req->dma), _req->zero ? "zero" : "!zero");
 
 	spin_lock_irqsave(&dev->lock, flags);
 
