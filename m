From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the wireless tree
Date: Wed, 26 Nov 2008 19:40:41 +1100
Message-ID: <20081126194041.72bf3af5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56301 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750797AbYKZIky (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2008 03:40:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, Sujith <Sujith.Manoharan@atheros.com>, "Luis R. Rodriguez" <lrodriguez@atheros.com>, Bennyam Malavazi <Bennyam.Malavazi@atheros.com>, "David S. Miller" <davem@davemloft.net>

Hi John,

Today's linux-next merge of the wireless tree got a conflict in
drivers/net/wireless/ath9k/recv.c between commits
b4b6cda2298b0c9a0af902312184b775b8867c65 ("ath9k: correct expected max RX
buffer size") and ca0c7e5101fd4f37fed8e851709f08580b92fbb3 ("ath9k: Fix
SW-IOMMU bounce buffer starvation") from the wireless-current tree and
commits fd568653b38a91154b193338c312927385e77da1 ("ath9k: Revamp RX
handling") and from the wireless tree.

I fixed it up (see below - I hope it is correct) and assume that it will
be fixed soon.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/net/wireless/ath9k/recv.c
index d36b5e2,743ad22..0000000
--- a/drivers/net/wireless/ath9k/recv.c
+++ b/drivers/net/wireless/ath9k/recv.c
@@@ -49,12 -41,9 +41,11 @@@ static void ath_rx_buf_link(struct ath_
  	ASSERT(skb != NULL);
  	ds->ds_vdata = skb->data;
  
 -	/* setup rx descriptors */
 +	/* setup rx descriptors. The sc_rxbufsize here tells the harware
 +	 * how much data it can DMA to us and that we are prepared
 +	 * to process */
- 	ath9k_hw_setuprxdesc(ah,
- 			     ds,
+ 	ath9k_hw_setuprxdesc(ah, ds,
 -			     skb_tailroom(skb), /* buffer size */
 +			     sc->sc_rxbufsize,
  			     0);
  
  	if (sc->sc_rxlink == NULL)
@@@ -229,10 -298,9 +307,9 @@@ int ath_rx_init(struct ath_softc *sc, i
  
  			bf->bf_mpdu = skb;
  			bf->bf_buf_addr = pci_map_single(sc->pdev, skb->data,
 -					 skb_end_pointer(skb) - skb->head,
 +					 sc->sc_rxbufsize,
  					 PCI_DMA_FROMDEVICE);
  			bf->bf_dmacontext = bf->bf_buf_addr;
- 			ATH_RX_CONTEXT(skb)->ctx_rxbuf = bf;
  		}
  		sc->sc_rxlink = NULL;
  
@@@ -518,167 -512,43 +521,43 @@@ int ath_rx_tasklet(struct ath_softc *sc
  			}
  		}
  
- 		/* XXX: we do not support frames spanning
- 		 * multiple descriptors */
- 		bf->bf_status |= ATH_BUFSTATUS_DONE;
- 
  		skb = bf->bf_mpdu;
- 		if (skb == NULL) {		/* XXX ??? can this happen */
- 			spin_unlock_bh(&sc->sc_rxbuflock);
+ 		if (!skb)
  			continue;
- 		}
- 		/*
- 		 * Now we know it's a completed frame, we can indicate the
- 		 * frame. Remove the previous holding descriptor and leave
- 		 * this one in the queue as the new holding descriptor.
- 		 */
- 		if (bf_held) {
- 			list_del(&bf_held->list);
- 			bf_held->bf_status &= ~ATH_BUFSTATUS_STALE;
- 			if (bf_held->bf_status & ATH_BUFSTATUS_FREE) {
- 				list_add_tail(&bf_held->list, &sc->sc_rxbuf);
- 				/* try to requeue this descriptor */
- 				ath_rx_buf_link(sc, bf_held);
- 			}
- 		}
  
- 		bf->bf_status |= ATH_BUFSTATUS_STALE;
- 		bf_held = bf;
  		/*
- 		 * Release the lock here in case ieee80211_input() return
- 		 * the frame immediately by calling ath_rx_mpdu_requeue().
+ 		 * If we're asked to flush receive queue, directly
+ 		 * chain it back at the queue without processing it.
  		 */
- 		spin_unlock_bh(&sc->sc_rxbuflock);
+ 		if (flush)
+ 			goto requeue;
  
- 		if (flush) {
- 			/*
- 			 * If we're asked to flush receive queue, directly
- 			 * chain it back at the queue without processing it.
- 			 */
- 			goto rx_next;
- 		}
+ 		if (!ds->ds_rxstat.rs_datalen)
+ 			goto requeue;
  
- 		hdr = (struct ieee80211_hdr *)skb->data;
- 		fc = hdr->frame_control;
- 		memset(&rx_status, 0, sizeof(struct ath_recv_status));
+ 		/* The status portion of the descriptor could get corrupted. */
+ 		if (sc->sc_rxbufsize < ds->ds_rxstat.rs_datalen)
+ 			goto requeue;
  
- 		if (ds->ds_rxstat.rs_more) {
- 			/*
- 			 * Frame spans multiple descriptors; this
- 			 * cannot happen yet as we don't support
- 			 * jumbograms.  If not in monitor mode,
- 			 * discard the frame.
- 			 */
- #ifndef ERROR_FRAMES
- 			/*
- 			 * Enable this if you want to see
- 			 * error frames in Monitor mode.
- 			 */
- 			if (sc->sc_ah->ah_opmode != ATH9K_M_MONITOR)
- 				goto rx_next;
- #endif
- 			/* fall thru for monitor mode handling... */
- 		} else if (ds->ds_rxstat.rs_status != 0) {
- 			if (ds->ds_rxstat.rs_status & ATH9K_RXERR_CRC)
- 				rx_status.flags |= ATH_RX_FCS_ERROR;
- 			if (ds->ds_rxstat.rs_status & ATH9K_RXERR_PHY) {
- 				phyerr = ds->ds_rxstat.rs_phyerr & 0x1f;
- 				goto rx_next;
- 			}
+ 		if (!ath_rx_prepare(skb, ds, &rx_status, &decrypt_error, sc))
+ 			goto requeue;
  
- 			if (ds->ds_rxstat.rs_status & ATH9K_RXERR_DECRYPT) {
- 				/*
- 				 * Decrypt error. We only mark packet status
- 				 * here and always push up the frame up to let
- 				 * mac80211 handle the actual error case, be
- 				 * it no decryption key or real decryption
- 				 * error. This let us keep statistics there.
- 				 */
- 				rx_status.flags |= ATH_RX_DECRYPT_ERROR;
- 			} else if (ds->ds_rxstat.rs_status & ATH9K_RXERR_MIC) {
- 				/*
- 				 * Demic error. We only mark frame status here
- 				 * and always push up the frame up to let
- 				 * mac80211 handle the actual error case. This
- 				 * let us keep statistics there. Hardware may
- 				 * post a false-positive MIC error.
- 				 */
- 				if (ieee80211_is_ctl(fc))
- 					/*
- 					 * Sometimes, we get invalid
- 					 * MIC failures on valid control frames.
- 					 * Remove these mic errors.
- 					 */
- 					ds->ds_rxstat.rs_status &=
- 						~ATH9K_RXERR_MIC;
- 				else
- 					rx_status.flags |= ATH_RX_MIC_ERROR;
- 			}
- 			/*
- 			 * Reject error frames with the exception of
- 			 * decryption and MIC failures. For monitor mode,
- 			 * we also ignore the CRC error.
- 			 */
- 			if (sc->sc_ah->ah_opmode == ATH9K_M_MONITOR) {
- 				if (ds->ds_rxstat.rs_status &
- 				    ~(ATH9K_RXERR_DECRYPT | ATH9K_RXERR_MIC |
- 					ATH9K_RXERR_CRC))
- 					goto rx_next;
- 			} else {
- 				if (ds->ds_rxstat.rs_status &
- 				    ~(ATH9K_RXERR_DECRYPT | ATH9K_RXERR_MIC)) {
- 					goto rx_next;
- 				}
- 			}
- 		}
- 		/*
- 		 * The status portion of the descriptor could get corrupted.
- 		 */
- 		if (sc->sc_rxbufsize < ds->ds_rxstat.rs_datalen)
- 			goto rx_next;
- 		/*
- 		 * Sync and unmap the frame.  At this point we're
- 		 * committed to passing the sk_buff somewhere so
- 		 * clear buf_skb; this means a new sk_buff must be
- 		 * allocated when the rx descriptor is setup again
- 		 * to receive another frame.
- 		 */
- 		skb_put(skb, ds->ds_rxstat.rs_datalen);
- 		skb->protocol = cpu_to_be16(ETH_P_CONTROL);
- 		rx_status.tsf = ath_extend_tsf(sc, ds->ds_rxstat.rs_tstamp);
- 		rx_status.rateieee =
- 			sc->sc_hwmap[ds->ds_rxstat.rs_rate].ieeerate;
- 		rx_status.rateKbps =
- 			sc->sc_hwmap[ds->ds_rxstat.rs_rate].rateKbps;
- 		rx_status.ratecode = ds->ds_rxstat.rs_rate;
- 
- 		/* HT rate */
- 		if (rx_status.ratecode & 0x80) {
- 			/* TODO - add table to avoid division */
- 			if (ds->ds_rxstat.rs_flags & ATH9K_RX_2040) {
- 				rx_status.flags |= ATH_RX_40MHZ;
- 				rx_status.rateKbps =
- 					(rx_status.rateKbps * 27) / 13;
- 			}
- 			if (ds->ds_rxstat.rs_flags & ATH9K_RX_GI)
- 				rx_status.rateKbps =
- 					(rx_status.rateKbps * 10) / 9;
- 			else
- 				rx_status.flags |= ATH_RX_SHORT_GI;
- 		}
+ 		/* Ensure we always have an skb to requeue once we are done
+ 		 * processing the current buffer's skb */
+ 		requeue_skb = ath_rxbuf_alloc(sc, sc->sc_rxbufsize);
  
- 		/* sc_noise_floor is only available when the station
- 		   attaches to an AP, so we use a default value
- 		   if we are not yet attached. */
- 		rx_status.abs_rssi =
- 			ds->ds_rxstat.rs_rssi + sc->sc_ani.sc_noise_floor;
+ 		/* If there is no memory we ignore the current RX'd frame,
+ 		 * tell hardware it can give us a new frame using the old
+ 		 * skb and put it at the tail of the sc->sc_rxbuf list for
+ 		 * processing. */
+ 		if (!requeue_skb)
+ 			goto requeue;
  
- 		pci_dma_sync_single_for_cpu(sc->pdev,
- 					    bf->bf_buf_addr,
+ 		/* Sync and unmap the frame */
+ 		pci_dma_sync_single_for_cpu(sc->pdev, bf->bf_buf_addr,
 -					    skb_tailroom(skb),
 +					    sc->sc_rxbufsize,
  					    PCI_DMA_FROMDEVICE);
- 		pci_unmap_single(sc->pdev,
- 				 bf->bf_buf_addr,
+ 		pci_unmap_single(sc->pdev, bf->bf_buf_addr,
  				 sc->sc_rxbufsize,
  				 PCI_DMA_FROMDEVICE);
  
