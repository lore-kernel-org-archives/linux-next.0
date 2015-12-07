From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the wireless-drivers-next tree with
 Linus' tree
Date: Mon, 7 Dec 2015 14:13:25 +1100
Message-ID: <20151207141325.1609aec1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55043 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755067AbbLGDN2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 6 Dec 2015 22:13:28 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vivek Natarajan <nataraja@qti.qualcomm.com>, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Hi Kalle,

Today's linux-next merge of the wireless-drivers-next tree got a
conflict in:

  drivers/net/wireless/ath/ath10k/pci.c

between commit:

  6419fdbb6f90 ("ath10k: poll HTT send completion when CE 5 is unused")

from Linus' tree and commit:

  afb0bf7f530b ("ath10k: add support for pktlog in QCA99X0")

from the wireless-drivers-next tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/net/wireless/ath/ath10k/pci.c
index 930785a724e1,5c91a673cf80..000000000000
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@@ -107,9 -111,9 +107,10 @@@ static void ath10k_pci_htc_tx_cb(struc
  static void ath10k_pci_htc_rx_cb(struct ath10k_ce_pipe *ce_state);
  static void ath10k_pci_htt_tx_cb(struct ath10k_ce_pipe *ce_state);
  static void ath10k_pci_htt_rx_cb(struct ath10k_ce_pipe *ce_state);
 +static void ath10k_pci_htt_htc_rx_cb(struct ath10k_ce_pipe *ce_state);
+ static void ath10k_pci_pktlog_rx_cb(struct ath10k_ce_pipe *ce_state);
  
 -static const struct ce_attr host_ce_config_wlan[] = {
 +static struct ce_attr host_ce_config_wlan[] = {
  	/* CE0: host->target HTC control and raw streams */
  	{
  		.flags = CE_ATTR_FLAGS,
@@@ -1205,16 -1210,15 +1207,25 @@@ static void ath10k_pci_htc_rx_cb(struc
  	ath10k_pci_process_rx_cb(ce_state, ath10k_htc_rx_completion_handler);
  }
  
 +static void ath10k_pci_htt_htc_rx_cb(struct ath10k_ce_pipe *ce_state)
 +{
 +	/* CE4 polling needs to be done whenever CE pipe which transports
 +	 * HTT Rx (target->host) is processed.
 +	 */
 +	ath10k_ce_per_engine_service(ce_state->ar, 4);
 +
 +	ath10k_pci_process_rx_cb(ce_state, ath10k_htc_rx_completion_handler);
 +}
 +
+ /* Called by lower (CE) layer when data is received from the Target.
+  * Only 10.4 firmware uses separate CE to transfer pktlog data.
+  */
+ static void ath10k_pci_pktlog_rx_cb(struct ath10k_ce_pipe *ce_state)
+ {
+ 	ath10k_pci_process_rx_cb(ce_state,
+ 				 ath10k_htt_rx_pktlog_completion_handler);
+ }
+ 
  /* Called by lower (CE) layer when a send to HTT Target completes. */
  static void ath10k_pci_htt_tx_cb(struct ath10k_ce_pipe *ce_state)
  {
