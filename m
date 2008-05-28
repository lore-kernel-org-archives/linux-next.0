From: Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>
Subject: [PATCH 1/4] Updated version of 72c4928058175e889b2f83d1a62ac6f2eb0498a0
Date: Wed, 28 May 2008 14:56:00 +0900
Message-ID: <483CF3F0.2050401@jp.fujitsu.com>
References: <20080528122758.70c4bec9.sfr@canb.auug.org.au> <483CC873.5000300@jp.fujitsu.com> <200805272108.32974.jbarnes@virtuousgeek.org> <483CF356.1010807@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fgwmail7.fujitsu.co.jp ([192.51.44.37]:41350 "EHLO
	fgwmail7.fujitsu.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753034AbYE1F4i (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 May 2008 01:56:38 -0400
In-Reply-To: <483CF356.1010807@jp.fujitsu.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

Remove the redundant initialization of pci_dev member of struct
controller in pciehp_probe(). It is initialized in pcie_init().

Signed-off-by: Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>

---
 drivers/pci/hotplug/pciehp_core.c |    1 -
 1 file changed, 1 deletion(-)

Index: linux-2.6.26-rc4/drivers/pci/hotplug/pciehp_core.c
===================================================================
--- linux-2.6.26-rc4.orig/drivers/pci/hotplug/pciehp_core.c
+++ linux-2.6.26-rc4/drivers/pci/hotplug/pciehp_core.c
@@ -454,7 +454,6 @@ static int pciehp_probe(struct pcie_devi
 	INIT_LIST_HEAD(&ctrl->slot_list);
 
 	pdev = dev->port;
-	ctrl->pci_dev = pdev;
 
 	rc = pcie_init(ctrl, dev);
 	if (rc) {


