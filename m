From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ttydev tree build failure
Date: Wed, 15 Oct 2008 20:39:46 +1100
Message-ID: <20081015203946.c45f3330.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47821 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751969AbYJOJlB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 05:41:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Lee Howard <lee.howard@mainpine.com>

Hi Alan,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/serial/8250_pci.c: In function 'pci_oxsemi_tornado_init':
drivers/serial/8250_pci.c:1868: error: 'pdev' undeclared (first use in this function)

Caused by commit f7c0c0bf8236d456488731940e0283434bd79ff6
("8250-oxsemi").  I applied the foloowing patch.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 15 Oct 2008 20:38:30 +1100
Subject: [PATCH] ttydev: fix typo in 8250-oxsemi

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/serial/8250_pci.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/serial/8250_pci.c b/drivers/serial/8250_pci.c
index 4ddd66c..43c990a 100644
--- a/drivers/serial/8250_pci.c
+++ b/drivers/serial/8250_pci.c
@@ -1865,7 +1865,7 @@ static int pci_oxsemi_tornado_init(struct pci_dev *dev, struct pciserial_board *
 	unsigned long deviceID;
 	unsigned int  number_uarts;
 
-	p = pci_iomap(pdev, 0, 5);
+	p = pci_iomap(dev, 0, 5);
 	if (p == NULL)
 		return -ENOMEM;
     
@@ -1878,7 +1878,7 @@ static int pci_oxsemi_tornado_init(struct pci_dev *dev, struct pciserial_board *
 			"%d ports detected on Oxford PCI Express device\n",
 								number_uarts);
 	}
-	pci_iounmap(pdev, p);
+	pci_iounmap(dev, p);
 	return 0;
 }
 
-- 
1.5.6.5
