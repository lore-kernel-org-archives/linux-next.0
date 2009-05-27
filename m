From: Gerard Lledo <gerard.lledo@gmail.com>
Subject: [PATCH] Staging: comedi: Fix build warning (type mismatch)
Date: Wed, 27 May 2009 17:35:19 +0300
Message-ID: <1243434919-10192-3-git-send-email-gerard.lledo@gmail.com>
References: <1243434919-10192-1-git-send-email-gerard.lledo@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.27]:6782 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760413AbZE0Of2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 May 2009 10:35:28 -0400
In-Reply-To: <1243434919-10192-1-git-send-email-gerard.lledo@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-janitors@vger.kernel.org
Cc: linux-next@vger.kernel.org, Gerard Lledo <gerard.lledo@gmail.com>

spin_lock_irqsave expects flags to be unsigned long, not unsigned int.

Signed-off-by: Gerard Lledo <gerard.lledo@gmail.com>
---
 drivers/staging/comedi/drivers/cb_pcidas.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/comedi/drivers/cb_pcidas.c b/drivers/staging/comedi/drivers/cb_pcidas.c
index 28212ad..702de15 100644
--- a/drivers/staging/comedi/drivers/cb_pcidas.c
+++ b/drivers/staging/comedi/drivers/cb_pcidas.c
@@ -1593,7 +1593,7 @@ static void handle_ao_interrupt(struct comedi_device *dev, unsigned int status)
 	struct comedi_cmd *cmd = &async->cmd;
 	unsigned int half_fifo = thisboard->fifo_size / 2;
 	unsigned int num_points;
-	unsigned int flags;
+	unsigned long flags;
 
 	async->events = 0;
 
-- 
1.5.6.5
