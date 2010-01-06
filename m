From: Ben Hutchings <bhutchings@solarflare.com>
Subject: [PATCH] sfc: Fix DMA mapping cleanup in case of an error in TSO
Date: Wed, 06 Jan 2010 15:59:02 +0000
Message-ID: <1262793542.2777.6.camel@achroite.uk.solarflarecom.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.solarflare.com ([216.237.3.220]:15198 "EHLO
	exchange.solarflare.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932226Ab0AFP7G (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 Jan 2010 10:59:06 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: stable@kernel.org
Cc: linux-next <linux-next@vger.kernel.org>

From: Neil Turton <nturton@solarflare.com>

commit a7ebd27a13757248863cd61e541af7fa9e7727ee upstream

We need buffer->len to remain valid to work out the correct address to
be unmapped.  We therefore need to clear buffer->len after the unmap
operation.

Signed-off-by: Ben Hutchings <bhutchings@solarflare.com>
---
This applies to 2.6.31 and .32 with harmless fuzz.
For 2.6.27, change 'true' to '1' before applying.

Ben.

 drivers/net/sfc/tx.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/sfc/tx.c b/drivers/net/sfc/tx.c
index e669f94..a8b70ef 100644
--- a/drivers/net/sfc/tx.c
+++ b/drivers/net/sfc/tx.c
@@ -821,8 +821,6 @@ static void efx_enqueue_unwind(struct efx_tx_queue *tx_queue)
 					   EFX_TXQ_MASK];
 		efx_tsoh_free(tx_queue, buffer);
 		EFX_BUG_ON_PARANOID(buffer->skb);
-		buffer->len = 0;
-		buffer->continuation = true;
 		if (buffer->unmap_len) {
 			unmap_addr = (buffer->dma_addr + buffer->len -
 				      buffer->unmap_len);
@@ -836,6 +834,8 @@ static void efx_enqueue_unwind(struct efx_tx_queue *tx_queue)
 					       PCI_DMA_TODEVICE);
 			buffer->unmap_len = 0;
 		}
+		buffer->len = 0;
+		buffer->continuation = true;
 	}
 }
 
-- 
1.5.5


-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
