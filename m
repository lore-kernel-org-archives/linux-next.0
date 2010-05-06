From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] usb: fix u132-hcd code/data warning
Date: Thu, 6 May 2010 16:46:03 -0700
Message-ID: <20100506164603.5c5107b7.randy.dunlap@oracle.com>
References: <20100506151502.f97afe54.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100506151502.f97afe54.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, lud <linux-usb@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix gcc warning on mixed declarations/code:
drivers/usb/host/u132-hcd.c:1450: warning: ISO C90 forbids mixed declarations and code

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/usb/host/u132-hcd.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20100506.orig/drivers/usb/host/u132-hcd.c
+++ linux-next-20100506/drivers/usb/host/u132-hcd.c
@@ -1446,9 +1446,9 @@ static void u132_hcd_endp_work_scheduler
 			return;
 		} else {
 			int retval;
-			address = u132->addr[endp->usb_addr].address;
 			struct urb *urb = endp->urb_list[ENDP_QUEUE_MASK &
 				endp->queue_next];
+			address = u132->addr[endp->usb_addr].address;
 			endp->active = 1;
 			ring->curr_endp = endp;
 			ring->in_use = 1;
