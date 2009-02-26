From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with Linus' tree
Date: Thu, 26 Feb 2009 13:48:59 +1100
Message-ID: <20090226134859.402ed4df.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40952 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751629AbZBZCtK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Feb 2009 21:49:10 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>, David Woodhouse <David.Woodhouse@intel.com>, Bhavesh Davda <bhavesh@vmware.com>, Chris Wright <chrisw@sous-sol.org>, Tomas Winkler <tomas.winkler@intel.com>, Samuel Ortiz <samuel.ortiz@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, "John W. Linville" <linville@tuxdriver.com>

Hi David,

Today's linux-next merge of the net tree got a conflict in
drivers/net/wireless/iwlwifi/iwl-tx.c between commit
6aa03ab06978e97b3e0720f83280d7841051916b ("Fix iwlan DMA mapping
direction") from Linus' tree and commit
7aaa1d79e3a2d573ac469744506f17b1c9386840 ("iwlwifi: Add TFD library
operations") from the net tree.

The latter moved some code that the former modified.  I fixed it up (see
below) and can carry it for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/net/wireless/iwlwifi/iwl-tx.c
index ab13ff2,ae04c20..0000000
--- a/drivers/net/wireless/iwlwifi/iwl-tx.c
+++ b/drivers/net/wireless/iwlwifi/iwl-tx.c
diff --git a/drivers/net/wireless/iwlwifi/iwl-agn.c b/drivers/net/wireless/iwlwifi/iwl-agn.c
index 397577c..e9729f4 100644
--- a/drivers/net/wireless/iwlwifi/iwl-agn.c
+++ b/drivers/net/wireless/iwlwifi/iwl-agn.c
@@ -444,7 +444,7 @@ void iwl_hw_txq_free_tfd(struct iwl_priv *priv, struct iwl_tx_queue *txq)
 		pci_unmap_single(dev,
 				pci_unmap_addr(&txq->cmd[index]->meta, mapping),
 				pci_unmap_len(&txq->cmd[index]->meta, len),
-				PCI_DMA_TODEVICE);
+				PCI_DMA_BIDIRECTIONAL);
 
 	/* Unmap chunks, if any. */
 	for (i = 1; i < num_tbs; i++) {
