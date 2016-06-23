From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: linux-next: build warning after merge of the pci tree
Date: Thu, 23 Jun 2016 11:48:49 -0500
Message-ID: <20160623164848.GE17987@localhost>
References: <20160623115154.62730f7f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:46918 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751155AbcFWQsx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Jun 2016 12:48:53 -0400
Content-Disposition: inline
In-Reply-To: <20160623115154.62730f7f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Thumshirn <jthumshirn@suse.de>

On Thu, Jun 23, 2016 at 11:51:54AM +1000, Stephen Rothwell wrote:
> Hi Bjorn,
> 
> After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> drivers/misc/genwqe/card_base.c: In function 'genwqe_pci_remove':
> drivers/misc/genwqe/card_base.c:1155:6: warning: unused variable 'bars' [-Wunused-variable]
>   int bars;
>       ^
> drivers/misc/genwqe/card_base.c: In function 'genwqe_pci_setup':
> drivers/misc/genwqe/card_base.c:1143:2: warning: 'bars' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   pci_release_selected_regions(pci_dev, bars);
>   ^
> 
> Introduced by commit
> 
>   370b01694826 ("GenWQE: Use pci_(request|release)_mem_regions")

Thanks, Stephen.  I made the following edits, which should resolve these
warnings.  Johannes, let me know if they look right to you.


diff --git a/drivers/misc/genwqe/card_base.c b/drivers/misc/genwqe/card_base.c
index cb398be..a70b853 100644
--- a/drivers/misc/genwqe/card_base.c
+++ b/drivers/misc/genwqe/card_base.c
@@ -1067,7 +1067,7 @@ static int genwqe_health_check_stop(struct genwqe_dev *cd)
  */
 static int genwqe_pci_setup(struct genwqe_dev *cd)
 {
-	int err, bars;
+	int err;
 	struct pci_dev *pci_dev = cd->pci_dev;
 
 	err = pci_enable_device_mem(pci_dev);
@@ -1140,7 +1140,7 @@ static int genwqe_pci_setup(struct genwqe_dev *cd)
  out_iounmap:
 	pci_iounmap(pci_dev, cd->mmio);
  out_release_resources:
-	pci_release_selected_regions(pci_dev, bars);
+	pci_release_mem_regions(pci_dev);
  err_disable_device:
 	pci_disable_device(pci_dev);
  err_out:
@@ -1152,7 +1152,6 @@ static int genwqe_pci_setup(struct genwqe_dev *cd)
  */
 static void genwqe_pci_remove(struct genwqe_dev *cd)
 {
-	int bars;
 	struct pci_dev *pci_dev = cd->pci_dev;
 
 	if (cd->mmio)
