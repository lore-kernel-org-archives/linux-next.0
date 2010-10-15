From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
Subject: [PATCH] xhci: Fix compile error when CONFIG_PM=n
Date: Fri, 15 Oct 2010 11:24:14 -0700
Message-ID: <20101015182414.GA12349@xanatos>
References: <20101015181656.GA6473@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:11842 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756502Ab0JOSYS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Oct 2010 14:24:18 -0400
Content-Disposition: inline
In-Reply-To: <20101015181656.GA6473@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@suse.de>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, lud <linux-usb@vger.kernel.org>, Andiry Xu <andiry.xu@amd.com>, Dong Nguyen <dong.nguyen@amd.com>, Libin Yang <libin.yang@amd.com>

Fix this error when CONFIG_PM is not enabled:

drivers/usb/host/xhci.c:675: error: implicit declaration of function 'usb_root_hub_lost_power'

Wrap xhci_suspend() and xhci_resume() into an ifdef CONFIG_PM, along with
the functions that only they call -- xhci_save_registers() and
xhci_restore_registers().

Reported-by: Randy Dunlap <randy.dunlap@oracle.com>
Signed-off-by: Sarah Sharp <sarah.a.sharp@linux.intel.com>
---
 drivers/usb/host/xhci.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 33d0034..9dc5be5 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -551,6 +551,7 @@ void xhci_shutdown(struct usb_hcd *hcd)
 		    xhci_readl(xhci, &xhci->op_regs->status));
 }
 
+#ifdef CONFIG_PM
 static void xhci_save_registers(struct xhci_hcd *xhci)
 {
 	xhci->s3.command = xhci_readl(xhci, &xhci->op_regs->command);
@@ -761,6 +762,13 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 	return 0;
 }
 
+#else
+
+#define	xhci_suspend	NULL
+#define	xhci_resume	NULL
+
+#endif	/* CONFIG_PM */
+
 /*-------------------------------------------------------------------------*/
 
 /**
-- 
1.6.3.3
