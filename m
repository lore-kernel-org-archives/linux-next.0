From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with the net-current tree
Date: Mon, 16 Mar 2009 16:05:01 +1100
Message-ID: <20090316160501.6b20c544.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54588 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750956AbZCPFFG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 01:05:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Alexander Duyck <alexander.h.duyck@intel.com>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>

Hi David,

Today's linux-next merge of the net tree got a conflict in
drivers/net/igb/igb_main.c between commit
682337fe062e939578d933c74157ae9a36baa4ce ("igb: remove ASPM L0s
workaround") from the net-current tree and commits
aed5dec370e294233d647251ce1e5f74d70b09c9 ("igb: remove check for needing
an io port") and 450c87c8d28aeaf83889389ceeb01457c1a6f3e9 ("igb: remove
redundant count set and err_hw_init") from the net tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/net/igb/igb_main.c
index 9dd13ad,7124f59..0000000
--- a/drivers/net/igb/igb_main.c
+++ b/drivers/net/igb/igb_main.c
@@@ -1023,23 -1128,15 +1128,14 @@@ static int __devinit igb_probe(struct p
  	struct net_device *netdev;
  	struct igb_adapter *adapter;
  	struct e1000_hw *hw;
 -	struct pci_dev *us_dev;
  	const struct e1000_info *ei = igb_info_tbl[ent->driver_data];
  	unsigned long mmio_start, mmio_len;
- 	int i, err, pci_using_dac;
 -	int err, pci_using_dac, pos;
 -	u16 eeprom_data = 0, state = 0;
++	int err, pci_using_dac;
 +	u16 eeprom_data = 0;
  	u16 eeprom_apme_mask = IGB_EEPROM_APME;
  	u32 part_num;
- 	int bars, need_ioport;
  
- 	/* do not allocate ioport bars when not needed */
- 	need_ioport = igb_is_need_ioport(pdev);
- 	if (need_ioport) {
- 		bars = pci_select_bars(pdev, IORESOURCE_MEM | IORESOURCE_IO);
- 		err = pci_enable_device(pdev);
- 	} else {
- 		bars = pci_select_bars(pdev, IORESOURCE_MEM);
- 		err = pci_enable_device_mem(pdev);
- 	}
+ 	err = pci_enable_device_mem(pdev);
  	if (err)
  		return err;
  
@@@ -1061,7 -1158,30 +1157,9 @@@
  		}
  	}
  
- 	err = pci_request_selected_regions(pdev, bars, igb_driver_name);
 -	/* 82575 requires that the pci-e link partner disable the L0s state */
 -	switch (pdev->device) {
 -	case E1000_DEV_ID_82575EB_COPPER:
 -	case E1000_DEV_ID_82575EB_FIBER_SERDES:
 -	case E1000_DEV_ID_82575GB_QUAD_COPPER:
 -		us_dev = pdev->bus->self;
 -		pos = pci_find_capability(us_dev, PCI_CAP_ID_EXP);
 -		if (pos) {
 -			pci_read_config_word(us_dev, pos + PCI_EXP_LNKCTL,
 -			                     &state);
 -			state &= ~PCIE_LINK_STATE_L0S;
 -			pci_write_config_word(us_dev, pos + PCI_EXP_LNKCTL,
 -			                      state);
 -			dev_info(&pdev->dev,
 -				 "Disabling ASPM L0s upstream switch port %s\n",
 -				 pci_name(us_dev));
 -		}
 -	default:
 -		break;
 -	}
 -
+ 	err = pci_request_selected_regions(pdev, pci_select_bars(pdev,
+ 	                                   IORESOURCE_MEM),
+ 	                                   igb_driver_name);
  	if (err)
  		goto err_pci_reg;
  
