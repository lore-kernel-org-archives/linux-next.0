From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] usb: fix ehci printk formats
Date: Fri, 13 Feb 2009 11:22:06 -0800
Message-ID: <4995C85E.9040001@oracle.com>
References: <20090213175526.d0590862.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet13.oracle.com ([148.87.113.125]:25415 "EHLO
	rgminet13.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751326AbZBMTWV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Feb 2009 14:22:21 -0500
In-Reply-To: <20090213175526.d0590862.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg KH <greg@kroah.com>, linux-usb <linux-usb@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix ehci printk formats:

drivers/usb/host/ehci-q.c:351: warning: format '%d' expects type 'int', but argument 4 has type 'size_t'
drivers/usb/host/ehci-q.c:351: warning: format '%d' expects type 'int', but argument 5 has type 'size_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/usb/host/ehci-q.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20090213.orig/drivers/usb/host/ehci-q.c
+++ linux-next-20090213/drivers/usb/host/ehci-q.c
@@ -349,7 +349,7 @@ qh_completions (struct ehci_hcd *ehci, s
 						--qh->xacterrs > 0 &&
 						!urb->unlinked) {
 					ehci_dbg(ehci,
-	"detected XactErr len %d/%d retry %d\n",
+	"detected XactErr len %zu/%zu retry %d\n",
 	qtd->length - QTD_LENGTH(token), qtd->length,
 	QH_XACTERR_MAX - qh->xacterrs);
 
