From: Kristoffer Glembo <kristoffer@gaisler.com>
Subject: [PATCH] Use of_find_node_by_path to find root node.
Date: Fri, 13 Nov 2009 16:15:51 +0100
Message-ID: <1258125351-25965-1-git-send-email-kristoffer@gaisler.com>
References: <20091113.065751.162221666.davem@davemloft.net>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail176c2.megamailservers.com ([69.49.111.76]:50639 "EHLO
	mail176c2.megamailservers.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756681AbZKMPPo (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Nov 2009 10:15:44 -0500
In-Reply-To: <20091113.065751.162221666.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: davem@davemloft.net
Cc: linux-next@vger.kernel.org, Kristoffer Glembo <kristoffer@gaisler.com>

Signed-off-by: Kristoffer Glembo <kristoffer@gaisler.com>
---
 drivers/serial/apbuart.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/serial/apbuart.c b/drivers/serial/apbuart.c
index a1e9503..fe91319 100644
--- a/drivers/serial/apbuart.c
+++ b/drivers/serial/apbuart.c
@@ -609,7 +609,7 @@ static void grlib_apbuart_configure(void)
 		return;
 
 	/* Get bus frequency */
-	rp = of_find_node_by_name(NULL, "/");
+	rp = of_find_node_by_path("/");
 	rp = of_get_next_child(rp, NULL);
 	prop = of_get_property(rp, "clock-frequency", NULL);
 	freq_khz = *prop;
-- 
1.5.2.2
