From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: [PATCH 1/2] net: igb_main.c fix sparse integer as NULL pointer
	warning
Date: Wed, 16 Jul 2008 12:45:27 -0700
Message-ID: <1216237527.28841.17.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-net-owner@vger.kernel.org>
Sender: linux-net-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: linux-next <linux-next@vger.kernel.org>, linux-net <linux-net@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

drivers/net/igb/igb_main.c:388:20: warning: Using plain integer as NULL pointer

Signed-off-by: Harvey Harrison <harvey.harrison@gmail.com>
---
Appeared between next-20080715->next-20080716

 drivers/net/igb/igb_main.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/igb/igb_main.c b/drivers/net/igb/igb_main.c
index 043b630..1769c5a 100644
--- a/drivers/net/igb/igb_main.c
+++ b/drivers/net/igb/igb_main.c
@@ -385,7 +385,7 @@ static void igb_configure_msix(struct igb_adapter *adapter)
 
 	for (i = 0; i < adapter->num_rx_queues; i++) {
 		struct igb_ring *rx_ring = &adapter->rx_ring[i];
-		rx_ring->buddy = 0;
+		rx_ring->buddy = NULL;
 		igb_assign_vector(adapter, i, IGB_N0_QUEUE, vector++);
 		adapter->eims_enable_mask |= rx_ring->eims_value;
 		if (rx_ring->itr_val)
-- 
1.5.6.3.499.geae9


