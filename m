From: Paul Zimmerman <Paul.Zimmerman@synopsys.com>
Subject: [PATCH] staging: dwc2: fix compiler warnings
Date: Thu, 14 Mar 2013 13:12:00 -0700
Message-ID: <1363291920-11778-1-git-send-email-paulz@synopsys.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from alvesta.synopsys.com ([198.182.60.77]:49725 "EHLO
	alvesta.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751989Ab3CNUYc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 Mar 2013 16:24:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-next@vger.kernel.org, Paul Zimmerman <Paul.Zimmerman@synopsys.com>

Fix some compiler warnings when building for i386 arch. Reported by
Fengguang's build-bot.

Signed-off-by: Paul Zimmerman <paulz@synopsys.com>
---
 drivers/staging/dwc2/hcd.c      | 13 +++++++------
 drivers/staging/dwc2/hcd_intr.c |  8 ++++----
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/dwc2/hcd.c b/drivers/staging/dwc2/hcd.c
index cdb142d..246b483 100644
--- a/drivers/staging/dwc2/hcd.c
+++ b/drivers/staging/dwc2/hcd.c
@@ -1890,8 +1890,9 @@ void dwc2_hcd_dump_state(struct dwc2_hsotg *hsotg)
 				dev_dbg(hsotg->dev,
 					"      transfer_buffer: %p\n",
 					urb->buf);
-				dev_dbg(hsotg->dev, "      transfer_dma: %p\n",
-					(void *)urb->dma);
+				dev_dbg(hsotg->dev,
+					"      transfer_dma: %08lx\n",
+					(unsigned long)urb->dma);
 				dev_dbg(hsotg->dev,
 					"      transfer_buffer_length: %d\n",
 					urb->length);
@@ -2296,10 +2297,10 @@ static void dwc2_dump_urb_info(struct usb_hcd *hcd, struct urb *urb,
 		 usb_maxpacket(urb->dev, urb->pipe, usb_pipeout(urb->pipe)));
 	dev_vdbg(hsotg->dev, "  Data buffer length: %d\n",
 		 urb->transfer_buffer_length);
-	dev_vdbg(hsotg->dev, "  Transfer buffer: %p, Transfer DMA: %p\n",
-		 urb->transfer_buffer, (void *)urb->transfer_dma);
-	dev_vdbg(hsotg->dev, "  Setup buffer: %p, Setup DMA: %p\n",
-		 urb->setup_packet, (void *)urb->setup_dma);
+	dev_vdbg(hsotg->dev, "  Transfer buffer: %p, Transfer DMA: %08lx\n",
+		 urb->transfer_buffer, (unsigned long)urb->transfer_dma);
+	dev_vdbg(hsotg->dev, "  Setup buffer: %p, Setup DMA: %08lx\n",
+		 urb->setup_packet, (unsigned long)urb->setup_dma);
 	dev_vdbg(hsotg->dev, "  Interval: %d\n", urb->interval);
 
 	if (usb_pipetype(urb->pipe) == PIPE_ISOCHRONOUS) {
diff --git a/drivers/staging/dwc2/hcd_intr.c b/drivers/staging/dwc2/hcd_intr.c
index 01addd0..4b007ab 100644
--- a/drivers/staging/dwc2/hcd_intr.c
+++ b/drivers/staging/dwc2/hcd_intr.c
@@ -1535,10 +1535,10 @@ static void dwc2_hc_ahberr_intr(struct dwc2_hsotg *hsotg,
 	dev_err(hsotg->dev, "  Max packet size: %d\n",
 		dwc2_hcd_get_mps(&urb->pipe_info));
 	dev_err(hsotg->dev, "  Data buffer length: %d\n", urb->length);
-	dev_err(hsotg->dev, "  Transfer buffer: %p, Transfer DMA: %p\n",
-		urb->buf, (void *)urb->dma);
-	dev_err(hsotg->dev, "  Setup buffer: %p, Setup DMA: %p\n",
-		urb->setup_packet, (void *)urb->setup_dma);
+	dev_err(hsotg->dev, "  Transfer buffer: %p, Transfer DMA: %08lx\n",
+		urb->buf, (unsigned long)urb->dma);
+	dev_err(hsotg->dev, "  Setup buffer: %p, Setup DMA: %08lx\n",
+		urb->setup_packet, (unsigned long)urb->setup_dma);
 	dev_err(hsotg->dev, "  Interval: %d\n", urb->interval);
 
 	/* Core halts the channel for Descriptor DMA mode */
-- 
1.8.2.rc0.16.g20a599e
