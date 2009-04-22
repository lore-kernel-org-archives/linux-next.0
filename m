From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: wireless-current tree build failure
Date: Wed, 22 Apr 2009 15:19:28 +1000
Message-ID: <20090422151928.d1c5ad6a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48378 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751878AbZDVFTc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Apr 2009 01:19:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, Reinette Chatre <reinette.chatre@intel.com>

Hi John,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/net/wireless/iwlwifi/iwl3945-base.c:1415: error: __ksymtab_iwl3945_rx_queue_reset causes a section type conflict

I am pretty sure that this is a compiler bug, so not to worry.  However,
as far as I can see, iwl-3945.o (the only user) and iwl3945-base.o are
always linked into the same module, so the EXPORT_SYMBOL (which causes
the problem) should not be needed.  Correct?

I applied the following patch for today.  This makes the above error go
away and my x86_64 allmodconfig still builds.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 22 Apr 2009 15:11:05 +1000
Subject: [PATCH] wireless: remove unneeded EXPORT_SYMBOL the tickles a powerpc compiler bug

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/wireless/iwlwifi/iwl3945-base.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/net/wireless/iwlwifi/iwl3945-base.c b/drivers/net/wireless/iwlwifi/iwl3945-base.c
index 9c0779d..da2b3d1 100644
--- a/drivers/net/wireless/iwlwifi/iwl3945-base.c
+++ b/drivers/net/wireless/iwlwifi/iwl3945-base.c
@@ -1412,7 +1412,6 @@ void iwl3945_rx_queue_reset(struct iwl_priv *priv, struct iwl_rx_queue *rxq)
 	rxq->free_count = 0;
 	spin_unlock_irqrestore(&rxq->lock, flags);
 }
-EXPORT_SYMBOL(iwl3945_rx_queue_reset);
 
 /*
  * this should be called while priv->lock is locked
-- 
1.6.2.3
