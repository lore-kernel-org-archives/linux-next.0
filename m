From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pm tree with Linus' tree
Date: Mon, 9 Nov 2015 10:45:01 +1100
Message-ID: <20151109104501.348445c7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47627 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750791AbbKHXpF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 8 Nov 2015 18:45:05 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Taku Izumi <izumi.taku@jp.fujitsu.com>, Bjorn Helgaas <bhelgaas@google.com>, "Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>

Hi Rafael,

Today's linux-next merge of the pm tree got a conflict in:

  drivers/pci/probe.c

between commit:

  b07461a8e45b ("PCI/AER: Clear error status registers during enumeration and restore")

from Linus' tree and commit:

  29dbe1f0af88 ("PCI: ACPI: Add support for PCI device DMA coherency")

from the pm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/pci/probe.c
index f53b8e85f137,0dac52633f01..000000000000
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@@ -12,7 -13,7 +13,8 @@@
  #include <linux/module.h>
  #include <linux/cpumask.h>
  #include <linux/pci-aspm.h>
 +#include <linux/aer.h>
+ #include <linux/acpi.h>
  #include <asm-generic/pci-bridge.h>
  #include "pci.h"
  
