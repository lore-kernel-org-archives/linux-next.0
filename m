From: Alessio Igor Bogani <abogani@texware.it>
Subject: [PATCH] Staging: sxg: replace __FUNCTION__ usages
Date: Tue, 31 Mar 2009 21:40:50 +0200
Message-ID: <1238528453-13251-1-git-send-email-abogani@texware.it>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f158.google.com ([209.85.220.158]:58258 "EHLO
	mail-fx0-f158.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751636AbZCaTlF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 31 Mar 2009 15:41:05 -0400
Received: by fxm2 with SMTP id 2so2605355fxm.37
        for <linux-next@vger.kernel.org>; Tue, 31 Mar 2009 12:41:01 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: LNML <linux-next@vger.kernel.org>, Alessio Igor Bogani <abogani@texware.it>

__FUNCTION__ is gcc-specific, use __func__

Signed-off-by: Alessio Igor Bogani <abogani@texware.it>
---
 drivers/staging/sxg/sxg.c         |   38 ++++++++++++++++++------------------
 drivers/staging/sxg/sxg_ethtool.c |    2 +-
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/sxg/sxg.c b/drivers/staging/sxg/sxg.c
index 0050a02..ddf750d 100644
--- a/drivers/staging/sxg/sxg.c
+++ b/drivers/staging/sxg/sxg.c
@@ -350,7 +350,7 @@ void sxg_remove_msix_isr(struct adapter_t *adapter)
 	for(i=0; i< adapter->nr_msix_entries;i++)
 	{
 		vector = adapter->msi_entries[i].vector;
-		DBG_ERROR("%s : Freeing IRQ vector#%d\n",__FUNCTION__,vector);
+		DBG_ERROR("%s : Freeing IRQ vector#%d\n",__func__,vector);
 		free_irq(vector,netdev);
 	}
 }
@@ -847,7 +847,7 @@ static inline int sxg_read_config(struct adapter_t *adapter)
  		 * Get out of here
  		 */
 		printk(KERN_ERR"%s : Could not allocate memory for reading \
-				 EEPROM\n", __FUNCTION__);
+				 EEPROM\n", __func__);
 		return -ENOMEM;
 	}
 
@@ -882,7 +882,7 @@ static inline int sxg_read_config(struct adapter_t *adapter)
 	case SXG_CFG_LOAD_ERROR:
 	default:	/* Fix default handler later */
 		printk(KERN_WARNING"%s  : We could not read the config \
-			word. Status = %ld\n", __FUNCTION__, status);
+			word. Status = %ld\n", __func__, status);
 		break;
 	}
 	pci_free_consistent(adapter->pcidev, sizeof(struct sw_cfg_data), data,
@@ -975,7 +975,7 @@ static int sxg_entry_probe(struct pci_dev *pcidev,
 		adapter->asictype = SAHARA_REV_B;
 	} else {
 		ASSERT(0);
-		DBG_ERROR("%s Unexpected revision ID %x\n", __FUNCTION__, revision_id);
+		DBG_ERROR("%s Unexpected revision ID %x\n", __func__, revision_id);
 		goto err_out_exit_sxg_probe;
 	}
 	adapter->netdev = netdev;
@@ -1164,9 +1164,9 @@ static int sxg_entry_probe(struct pci_dev *pcidev,
 		  smp_processor_id());
 
 	pci_disable_device(pcidev);
-        DBG_ERROR("sxg: %s deallocate device\n", __FUNCTION__);
+        DBG_ERROR("sxg: %s deallocate device\n", __func__);
         kfree(netdev);
-	printk("Exit %s, Sxg driver loading failed..\n", __FUNCTION__);
+	printk("Exit %s, Sxg driver loading failed..\n", __func__);
 
 	return -ENODEV;
 }
@@ -2179,10 +2179,10 @@ static int sxg_entry_open(struct net_device *dev)
 	/*
 	 * The microcode expects it to be downloaded on every open.
 	 */
-	DBG_ERROR("sxg: %s ENTER sxg_download_microcode\n", __FUNCTION__);
+	DBG_ERROR("sxg: %s ENTER sxg_download_microcode\n", __func__);
 	if (sxg_download_microcode(adapter, SXG_UCODE_SYSTEM)) {
 		DBG_ERROR("sxg: %s ENTER sxg_adapter_set_hwaddr\n",
-				__FUNCTION__);
+				__func__);
 		sxg_read_config(adapter);
 	} else {
 		adapter->state = ADAPT_FAIL;
@@ -2293,14 +2293,14 @@ static void __devexit sxg_entry_remove(struct pci_dev *pcidev)
         mmio_start = pci_resource_start(pcidev, 0);
         mmio_len = pci_resource_len(pcidev, 0);
 
-        DBG_ERROR("sxg: %s rel_region(0) start[%x] len[%x]\n", __FUNCTION__,
+        DBG_ERROR("sxg: %s rel_region(0) start[%x] len[%x]\n", __func__,
                   mmio_start, mmio_len);
         release_mem_region(mmio_start, mmio_len);
 
         mmio_start = pci_resource_start(pcidev, 2);
         mmio_len = pci_resource_len(pcidev, 2);
 
-        DBG_ERROR("sxg: %s rel_region(2) start[%x] len[%x]\n", __FUNCTION__,
+        DBG_ERROR("sxg: %s rel_region(2) start[%x] len[%x]\n", __func__,
                   mmio_start, mmio_len);
         release_mem_region(mmio_start, mmio_len);
 
@@ -2386,7 +2386,7 @@ static int sxg_entry_halt(struct net_device *dev)
 	atomic_set(&adapter->pending_allocations, 0);
 	adapter->intrregistered = 0;
 	sxg_remove_isr(adapter);
-	DBG_ERROR("sxg: %s (%s) EXIT\n", __FUNCTION__, dev->name);
+	DBG_ERROR("sxg: %s (%s) EXIT\n", __func__, dev->name);
 	return (STATUS_SUCCESS);
 }
 
@@ -2440,7 +2440,7 @@ static int sxg_send_packets(struct sk_buff *skb, struct net_device *dev)
 	u32 status = STATUS_SUCCESS;
 
 	/*
-	 * DBG_ERROR("sxg: %s ENTER sxg_send_packets skb[%p]\n", __FUNCTION__,
+	 * DBG_ERROR("sxg: %s ENTER sxg_send_packets skb[%p]\n", __func__,
 	 *	  skb);
 	 */
 
@@ -3364,7 +3364,7 @@ static int sxg_read_mdio_reg(struct adapter_t *adapter,
 
 	SXG_TRACE(TRACE_SXG, SxgTraceBuffer, TRACE_NOISY, "WrtMDIO",
 		  adapter, 0, 0, 0);
-	DBG_ERROR("ENTER %s\n", __FUNCTION__);
+	DBG_ERROR("ENTER %s\n", __func__);
 
 	/* Ensure values don't exceed field width */
 	DevAddr &= 0x001F;	/* 5-bit field */
@@ -3400,7 +3400,7 @@ static int sxg_read_mdio_reg(struct adapter_t *adapter,
 		udelay(100);	/* Timeout in 100us units */
 		READ_REG(HwRegs->MacAmiimIndicator, ValueRead);
 		if (--Timeout == 0) {
-            DBG_ERROR("EXIT %s with STATUS_FAILURE 1\n", __FUNCTION__);
+            DBG_ERROR("EXIT %s with STATUS_FAILURE 1\n", __func__);
 
 			return (STATUS_FAILURE);
 		}
@@ -3421,7 +3421,7 @@ static int sxg_read_mdio_reg(struct adapter_t *adapter,
 		udelay(100);	/* Timeout in 100us units */
 		READ_REG(HwRegs->MacAmiimIndicator, ValueRead);
 		if (--Timeout == 0) {
-            DBG_ERROR("EXIT %s with STATUS_FAILURE 2\n", __FUNCTION__);
+            DBG_ERROR("EXIT %s with STATUS_FAILURE 2\n", __func__);
 
 			return (STATUS_FAILURE);
 		}
@@ -3431,7 +3431,7 @@ static int sxg_read_mdio_reg(struct adapter_t *adapter,
 	READ_REG(HwRegs->MacAmiimField, *pValue);
 	*pValue &= 0xFFFF;	/* data is in the lower 16 bits */
 
-	DBG_ERROR("EXIT %s\n", __FUNCTION__);
+	DBG_ERROR("EXIT %s\n", __func__);
 
 	return (STATUS_SUCCESS);
 }
@@ -3504,7 +3504,7 @@ static void sxg_mcast_set_mask(struct adapter_t *adapter)
 {
 	struct sxg_ucode_regs *sxg_regs = adapter->UcodeRegs;
 
-	DBG_ERROR("%s ENTER (%s) MacFilter[%x] mask[%llx]\n", __FUNCTION__,
+	DBG_ERROR("%s ENTER (%s) MacFilter[%x] mask[%llx]\n", __func__,
 		  adapter->netdev->name, (unsigned int)adapter->MacFilter,
 		  adapter->MulticastMask);
 
@@ -4014,7 +4014,7 @@ static int sxg_adapter_set_hwaddr(struct adapter_t *adapter)
 	 *  sxg_dbg_macaddrs(adapter);
 	 */
 	/* DBG_ERROR ("%s AFTER copying from config.macinfo into currmacaddr\n",
-	 *	   		__FUNCTION__);
+	 *	   		__func__);
 	 */
 
 	/* sxg_dbg_macaddrs(adapter); */
@@ -4025,7 +4025,7 @@ static int sxg_adapter_set_hwaddr(struct adapter_t *adapter)
 		printk("sxg: Dev is Null\n");
 	}
 
-        DBG_ERROR("%s ENTER (%s)\n", __FUNCTION__, adapter->netdev->name);
+        DBG_ERROR("%s ENTER (%s)\n", __func__, adapter->netdev->name);
 
         if (netif_running(dev)) {
                 return -EBUSY;
diff --git a/drivers/staging/sxg/sxg_ethtool.c b/drivers/staging/sxg/sxg_ethtool.c
index 97f765d..ad89cb8 100644
--- a/drivers/staging/sxg/sxg_ethtool.c
+++ b/drivers/staging/sxg/sxg_ethtool.c
@@ -278,7 +278,7 @@ static int sxg_nic_get_eeprom(struct net_device *netdev,
                  * Get out of here
                  */
                 printk(KERN_ERR"%s : Could not allocate memory for reading \
-                                EEPROM\n", __FUNCTION__);
+                                EEPROM\n", __func__);
                 return -ENOMEM;
         }
 
-- 
1.6.0.4
