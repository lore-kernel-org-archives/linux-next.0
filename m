From: Jon Mason <mason@myri.com>
Subject: [PATCH] PCI: export pcie_bus_configure_settings symbol
Date: Tue, 2 Aug 2011 00:01:18 -0500
Message-ID: <20110802050117.GA21227@myri.com>
References: <20110802104838.ac7f46b54e8a3fcc4cdd9448@canb.auug.org.au>
 <20110802112336.fd2d2b577a2a71892189733b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:59606 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750807Ab1HBFBX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Aug 2011 01:01:23 -0400
Content-Disposition: inline
In-Reply-To: <20110802112336.fd2d2b577a2a71892189733b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jordan Hargrave <jordan_hargrave@dell.com>

pcie_bus_configure_settings needs to be exported if the PCI hotplug
driver is being compiled as a module.

Discovered by Stephen Rothwell

Signed-off-by: Jon Mason <mason@myri.com>
---
 drivers/pci/probe.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 5becf7c..8473727 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1470,6 +1470,7 @@ void pcie_bus_configure_settings(struct pci_bus *bus, u8 mpss)
 	pcie_bus_configure_set(bus->self, &smpss);
 	pci_walk_bus(bus, pcie_bus_configure_set, &smpss);
 }
+EXPORT_SYMBOL_GPL(pcie_bus_configure_settings);
 
 unsigned int __devinit pci_scan_child_bus(struct pci_bus *bus)
 {
-- 
1.7.6
