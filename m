From: Bilel DRIRA <bilel.dr@gmail.com>
Subject: [PATCH] staging: ft1000: fix braces warning
Date: Tue,  3 Feb 2015 21:26:27 +0100
Message-ID: <1422995187-4188-1-git-send-email-bilel.dr@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f53.google.com ([74.125.82.53]:50952 "EHLO
	mail-wg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752213AbbBCU0i (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Feb 2015 15:26:38 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: marek.belisko@gmail.com, gregkh@linuxfoundation.org, joe@perches.com, tapaswenipathak@gmail.com, gdonald@gmail.com, aybuke.147@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Cc: Bilel DRIRA <bilel.dr@gmail.com>

This patch fix checkpatch.pl WARNING:

 WARNING: braces {} are not necessary for single statement blocks

Signed-off-by: Bilel DRIRA <bilel.dr@gmail.com>
---
 drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.c |   73 +++++++++-------------
 1 file changed, 29 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.c b/drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.c
index e9a37ee..5897b59 100644
--- a/drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.c
+++ b/drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.c
@@ -204,11 +204,11 @@ static inline void ft1000_write_dpram_mag_16(struct net_device *dev,
 	/* Provide mutual exclusive access while reading ASIC registers. */
 	spin_lock_irqsave(&info->dpram_lock, flags);
 	ft1000_write_reg(dev, FT1000_REG_DPRAM_ADDR, offset);
-	if (Index) {
+	if (Index)
 		ft1000_write_reg(dev, FT1000_REG_MAG_DPDATAL, value);
-	} else {
+	else
 		ft1000_write_reg(dev, FT1000_REG_MAG_DPDATAH, value);
-	}
+
 	spin_unlock_irqrestore(&info->dpram_lock, flags);
 }
 
@@ -440,9 +440,8 @@ static int ft1000_reset_card(struct net_device *dev)
 			tempword =
 				ft1000_read_dpram_mag_16(dev, FT1000_MAG_DPRAM_FEFE,
 							 FT1000_MAG_DPRAM_FEFE_INDX);
-			if (tempword == 0xfefe) {
+			if (tempword == 0xfefe)
 				break;
-			}
 			mdelay(20);
 		}
 
@@ -621,9 +620,9 @@ static void ft1000_hbchk(u_long data)
 
 		tempword = ft1000_read_reg(dev, FT1000_REG_DOORBELL);
 		/* Let's check doorbell again if fail */
-		if (tempword & FT1000_DB_HB) {
+		if (tempword & FT1000_DB_HB)
 			tempword = ft1000_read_reg(dev, FT1000_REG_DOORBELL);
-		}
+
 		if (tempword & FT1000_DB_HB) {
 			pr_info("heartbeat doorbell not clear by firmware\n");
 			if (info->AsicID == ELECTRABUZZ_ID) {
@@ -770,9 +769,8 @@ static void ft1000_send_cmd(struct net_device *dev, u16 *ptempbuffer, int size,
 
 	size += sizeof(struct pseudo_hdr);
 	/* check for odd byte and increment to 16-bit word align value */
-	if ((size & 0x0001)) {
+	if ((size & 0x0001))
 		size++;
-	}
 	pr_debug("total length = %d\n", size);
 	pr_debug("length = %d\n", ntohs(*ptempbuffer));
 	/*
@@ -915,9 +913,8 @@ static bool ft1000_receive_cmd(struct net_device *dev, u16 *pbuffer,
 		 * Calculate pseudo header checksum
 		 */
 		tempword = *ppseudohdr++;
-		for (i = 1; i < 7; i++) {
+		for (i = 1; i < 7; i++)
 			tempword ^= *ppseudohdr++;
-		}
 		if ((tempword != *ppseudohdr)) {
 			pr_debug("Pseudo header checksum mismatch\n");
 			/* Drop this message */
@@ -982,9 +979,8 @@ static void ft1000_proc_drvmsg(struct net_device *dev)
 				while (tempword & FT1000_DB_DPRAM_TX) {
 					mdelay(5);
 					i++;
-					if (i == 10) {
+					if (i == 10)
 						break;
-					}
 				}
 				ptr =
 					list_entry(info->prov_list.next,
@@ -1105,9 +1101,8 @@ static void ft1000_proc_drvmsg(struct net_device *dev)
 				mdelay(10);
 				tempword =
 					ft1000_read_reg(dev, FT1000_REG_DOORBELL);
-				if (tempword & FT1000_DB_DPRAM_TX) {
+				if (tempword & FT1000_DB_DPRAM_TX)
 					mdelay(10);
-				}
 			}
 
 			if ((tempword & FT1000_DB_DPRAM_TX) == 0) {
@@ -1134,9 +1129,9 @@ static void ft1000_proc_drvmsg(struct net_device *dev)
 				ppseudo_hdr->portsrc = 0;
 				/* Calculate new checksum */
 				ppseudo_hdr->checksum = *pmsg++;
-				for (i = 1; i < 7; i++) {
+				for (i = 1; i < 7; i++)
 					ppseudo_hdr->checksum ^= *pmsg++;
-				}
+
 				info->DSPInfoBlk[8] = 0x7200;
 				info->DSPInfoBlk[9] =
 					htons(info->DSPInfoBlklen);
@@ -1156,9 +1151,8 @@ static void ft1000_proc_drvmsg(struct net_device *dev)
 				mdelay(10);
 				tempword =
 					ft1000_read_reg(dev, FT1000_REG_DOORBELL);
-				if (tempword & FT1000_DB_DPRAM_TX) {
+				if (tempword & FT1000_DB_DPRAM_TX)
 					mdelay(10);
-				}
 			}
 
 			if ((tempword & FT1000_DB_DPRAM_TX) == 0) {
@@ -1184,9 +1178,9 @@ static void ft1000_proc_drvmsg(struct net_device *dev)
 				ppseudo_hdr->portsrc = 0;
 				/* Calculate new checksum */
 				ppseudo_hdr->checksum = *pmsg++;
-				for (i = 1; i < 7; i++) {
+				for (i = 1; i < 7; i++)
 					ppseudo_hdr->checksum ^= *pmsg++;
-				}
+
 				pmsg = (u16 *)&tempbuffer[16];
 				*pmsg++ = htons(RSP_DRV_ERR_RPT_MSG);
 				*pmsg++ = htons(0x000e);
@@ -1508,9 +1502,8 @@ static void ft1000_flush_fifo(struct net_device *dev, u16 DrvErrNum)
 			tempword = inw(dev->base_addr + FT1000_REG_MAG_DFSR);
 			pr_debug("FT1000_REG_MAG_DFSR = 0x%x\n", tempword);
 		}
-		if (DrvErrNum) {
+		if (DrvErrNum)
 			pcmcia->PktIntfErr++;
-		}
 	}
 }
 
@@ -1567,9 +1560,9 @@ static int ft1000_copy_up_pkt(struct net_device *dev)
 	if (skb == NULL) {
 		pr_debug("No Network buffers available\n");
 		/* Read High word to complete 32 bit access */
-		if (info->AsicID == MAGNEMITE_ID) {
+		if (info->AsicID == MAGNEMITE_ID)
 			tempword = ft1000_read_reg(dev, FT1000_REG_MAG_DFRH);
-		}
+
 		ft1000_flush_fifo(dev, 0);
 		info->stats.rx_errors++;
 		return FAILURE;
@@ -1673,9 +1666,8 @@ static int ft1000_copy_up_pkt(struct net_device *dev)
 	}
 
 	pr_debug("Data passed to Protocol layer:\n");
-	for (i = 0; i < len + 12; i++) {
+	for (i = 0; i < len + 12; i++)
 		pr_debug("Protocol Data: 0x%x\n", *ptemp++);
-	}
 
 	skb->dev = dev;
 	skb->protocol = eth_type_trans(skb, dev);
@@ -1729,21 +1721,16 @@ static int ft1000_copy_down_pkt(struct net_device *dev, u16 *packet, u16 len)
 	/* Check if there is room on the FIFO */
 	if (len > ft1000_read_fifo_len(dev)) {
 		udelay(10);
-		if (len > ft1000_read_fifo_len(dev)) {
+		if (len > ft1000_read_fifo_len(dev))
 			udelay(20);
-		}
-		if (len > ft1000_read_fifo_len(dev)) {
+		if (len > ft1000_read_fifo_len(dev))
 			udelay(20);
-		}
-		if (len > ft1000_read_fifo_len(dev)) {
+		if (len > ft1000_read_fifo_len(dev))
 			udelay(20);
-		}
-		if (len > ft1000_read_fifo_len(dev)) {
+		if (len > ft1000_read_fifo_len(dev))
 			udelay(20);
-		}
-		if (len > ft1000_read_fifo_len(dev)) {
+		if (len > ft1000_read_fifo_len(dev))
 			udelay(20);
-		}
 		if (len > ft1000_read_fifo_len(dev)) {
 			pr_debug("Transmit FIFO is full - pkt drop\n");
 			info->stats.tx_errors++;
@@ -1751,11 +1738,11 @@ static int ft1000_copy_down_pkt(struct net_device *dev, u16 *packet, u16 len)
 		}
 	}
 	/* Create pseudo header and send pseudo/ip to hardware */
-	if (info->AsicID == ELECTRABUZZ_ID) {
+	if (info->AsicID == ELECTRABUZZ_ID)
 		pseudo.blk.length = len;
-	} else {
+	else
 		pseudo.blk.length = ntohs(len);
-	}
+
 	pseudo.blk.source = DSPID;	/* Need to swap to get in correct order */
 	pseudo.blk.destination = HOSTID;
 	pseudo.blk.portdest = NETWORKID;	/* Need to swap to get in correct order */
@@ -1768,9 +1755,8 @@ static int ft1000_copy_down_pkt(struct net_device *dev, u16 *packet, u16 len)
 	pseudo.blk.qos_class = 0;
 	/* Calculate pseudo header checksum */
 	pseudo.blk.checksum = pseudo.buff[0];
-	for (i = 1; i < 7; i++) {
+	for (i = 1; i < 7; i++)
 		pseudo.blk.checksum ^= pseudo.buff[i];
-	}
 
 	/* Production Mode */
 	if (info->AsicID == ELECTRABUZZ_ID) {
@@ -1835,9 +1821,8 @@ static int ft1000_copy_down_pkt(struct net_device *dev, u16 *packet, u16 len)
 
 		plong = (u32 *)packet;
 		/* Write PPP type + IP Packet into Downlink FIFO */
-		for (i = 0; i < (len >> 2); i++) {
+		for (i = 0; i < (len >> 2); i++)
 			outl(*plong++, dev->base_addr + FT1000_REG_MAG_UFDR);
-		}
 
 		/* Check for odd alignment */
 		if (len & 0x0003) {
-- 
1.7.9.5
