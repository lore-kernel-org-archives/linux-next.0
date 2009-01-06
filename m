From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree
Date: Tue, 6 Jan 2009 11:54:06 +1100
Message-ID: <20090106115406.41638593.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40797 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751240AbZAFAyR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 5 Jan 2009 19:54:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>, Justin Chen <justin.chen@hp.com>

Hi Jesse,

Today's linux-next merge of the pci tree got a conflict in
drivers/pci/hotplug/acpiphp_glue.c between commit
b6adc1955d31515be6631e63b1fe4bcdcd41db77 ("PCI hotplug: acpiphp wants a
64-bit _SUN") from Linus' tree and commit
5a21939b5703db326c314cf30b9f2d37df6a8e1f ("PCI hotplug: introduce
functions for ACPI slot detection") from the pci tree.

Just changed context. I fixed it up (see below), but it should be
fixed by merging with Linus' tree (one way or the other).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/pci/hotplug/acpiphp_glue.c
index 3affc64,ffa47be..0000000
--- a/drivers/pci/hotplug/acpiphp_glue.c
+++ b/drivers/pci/hotplug/acpiphp_glue.c
@@@ -255,9 -194,8 +194,8 @@@ register_slot(acpi_handle handle, u32 l
  
  		bridge->nr_slots++;
  
 -		dbg("found ACPI PCI Hotplug slot %d at PCI %04x:%02x:%02x\n",
 +		dbg("found ACPI PCI Hotplug slot %llu at PCI %04x:%02x:%02x\n",
- 				slot->sun, pci_domain_nr(bridge->pci_bus),
- 				bridge->pci_bus->number, slot->device);
+ 		    slot->sun, pci_domain_nr(pbus), pbus->number, device);
  		retval = acpiphp_register_hotplug_slot(slot);
  		if (retval) {
  			if (retval == -EBUSY)
