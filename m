From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: linux-next: build failure after merge of the usb tree
Date: Tue, 18 May 2010 09:54:45 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1005180949560.1795-100000@iolanthe.rowland.org>
References: <20100518174253.37e38d66.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:56402 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1757542Ab0ERNyu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 18 May 2010 09:54:50 -0400
In-Reply-To: <20100518174253.37e38d66.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Kernel development list <linux-kernel@vger.kernel.org>

On Tue, 18 May 2010, Stephen Rothwell wrote:

> Hi Greg,
> 
> After merging the usb tree, today's linux-next build (powerpc
> ppc6xx_defconfig) failed like this:
> 
> drivers/usb/host/ehci-fsl.c:316: error: 'ehci' undeclared (first use in this function)
> 
> Caused by commit d19f8cd047971b43844d61d995be736dacb4826a ("USB: EHCI:
> fix controller wakeup flag settings during suspend").

Here's a fix for the problem.  It's awfully easy to mess things up when 
changing code for architectures you don't have.

Greg, can you merge this in with the original patch?

Alan Stern



Index: usb-2.6/drivers/usb/host/ehci-fsl.c
===================================================================
--- usb-2.6.orig/drivers/usb/host/ehci-fsl.c
+++ usb-2.6/drivers/usb/host/ehci-fsl.c
@@ -313,7 +313,7 @@ static int ehci_fsl_drv_suspend(struct d
 	struct ehci_fsl *ehci_fsl = hcd_to_ehci_fsl(hcd);
 	void __iomem *non_ehci = hcd->regs;
 
-	ehci_prepare_ports_for_controller_suspend(ehci);
+	ehci_prepare_ports_for_controller_suspend(hcd_to_ehci(hcd));
 	if (!fsl_deep_sleep())
 		return 0;
 
