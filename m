From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: usb tree build failure
Date: Wed, 29 Apr 2009 17:17:52 +1000
Message-ID: <20090429171752.f70c7de1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53895 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750736AbZD2HRz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Apr 2009 03:17:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Sarah Sharp <sarah.a.sharp@linux.intel.com>

Hi Greg,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/usb/built-in.o: In function `.handle_event':
(.text+0x67dd0): multiple definition of `.handle_event'
drivers/pcmcia/built-in.o:(.text+0xcfcc): first defined here
drivers/usb/built-in.o: In function `handle_event':
(.opd+0x5bc8): multiple definition of `handle_event'
drivers/pcmcia/built-in.o:(.opd+0xed0): first defined here

Caused by commit 787747a731389c767e6d437f5f94bdc8169ec968 ("USB: xhci:
No-op command queueing and irq handler").  handle_event is a bit generic
for a global symbol (pcmcia should probably be fixed as well).

[Also, the handle_event routine is tail recursive?]
[Also, there a a few other global routines in there that may want less
generic names.]
[Also, I can't find this large series of patches posted on lkml? Maybe
more exposure would be good.]

I added the following patch just for today.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 29 Apr 2009 17:06:13 +1000
Subject: [PATCH] usb: use xhci_handle_event instead of handle_event

The former is way to generic for a global symbol.

Fixes this build error:

drivers/usb/built-in.o: In function `.handle_event':
(.text+0x67dd0): multiple definition of `.handle_event'
drivers/pcmcia/built-in.o:(.text+0xcfcc): first defined here
drivers/usb/built-in.o: In function `handle_event':
(.opd+0x5bc8): multiple definition of `handle_event'
drivers/pcmcia/built-in.o:(.opd+0xed0): first defined here

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/usb/host/xhci-hcd.c  |    2 +-
 drivers/usb/host/xhci-ring.c |    4 ++--
 drivers/usb/host/xhci.h      |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-hcd.c b/drivers/usb/host/xhci-hcd.c
index 4763144..3ac7fbf 100644
--- a/drivers/usb/host/xhci-hcd.c
+++ b/drivers/usb/host/xhci-hcd.c
@@ -251,7 +251,7 @@ static void xhci_work(struct xhci_hcd *xhci)
 	xhci_readl(xhci, &xhci->ir_set->irq_pending);
 
 	/* FIXME this should be a delayed service routine that clears the EHB */
-	handle_event(xhci);
+	xhci_handle_event(xhci);
 
 	/* Clear the event handler busy flag; the event ring should be empty. */
 	temp = xhci_readl(xhci, &xhci->ir_set->erst_dequeue[0]);
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index b7dcbf0..0be8d68 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1016,7 +1016,7 @@ cleanup:
  * This function handles all OS-owned events on the event ring.  It may drop
  * xhci->lock between event processing (e.g. to pass up port status changes).
  */
-void handle_event(struct xhci_hcd *xhci)
+void xhci_handle_event(struct xhci_hcd *xhci)
 {
 	union xhci_trb *event;
 	int update_ptrs = 1;
@@ -1061,7 +1061,7 @@ void handle_event(struct xhci_hcd *xhci)
 		set_hc_event_deq(xhci);
 	}
 	/* Are there more items on the event ring? */
-	handle_event(xhci);
+	xhci_handle_event(xhci);
 }
 
 /****		Endpoint Ring Operations	****/
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 0475066..1f71fad 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1142,7 +1142,7 @@ void xhci_reset_bandwidth(struct usb_hcd *hcd, struct usb_device *udev);
 dma_addr_t trb_virt_to_dma(struct xhci_segment *seg, union xhci_trb *trb);
 void ring_cmd_db(struct xhci_hcd *xhci);
 void *setup_one_noop(struct xhci_hcd *xhci);
-void handle_event(struct xhci_hcd *xhci);
+void xhci_handle_event(struct xhci_hcd *xhci);
 void set_hc_event_deq(struct xhci_hcd *xhci);
 int queue_slot_control(struct xhci_hcd *xhci, u32 trb_type, u32 slot_id);
 int queue_address_device(struct xhci_hcd *xhci, dma_addr_t in_ctx_ptr, u32 slot_id);
-- 
1.6.2.4
