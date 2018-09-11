From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH] usb: core: remove flags variable in __usb_hcd_giveback_urb()
Date: Tue, 11 Sep 2018 09:37:12 +0200
Message-ID: <20180911073712.d3uvighcpg23dhlf@linutronix.de>
References: <20180911124743.558e33dc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180911124743.558e33dc@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

In commit ed194d1367698 ("usb: core: remove local_irq_save() around
->complete() handler") I removed the only user of the flags variable and
forgot to remove the variable, leading to warning because it is unused
now.
Remove the unused variable.

Fixes: ed194d1367698 ("usb: core: remove local_irq_save() around
       ->complete() handler")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/usb/core/hcd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index f985d2303095c..487025d31d44c 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1738,7 +1738,6 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
 	struct usb_hcd *hcd = bus_to_hcd(urb->dev->bus);
 	struct usb_anchor *anchor = urb->anchor;
 	int status = urb->unlinked;
-	unsigned long flags;
 
 	urb->hcpriv = NULL;
 	if (unlikely((urb->transfer_flags & URB_SHORT_NOT_OK) &&
-- 
2.19.0.rc2
