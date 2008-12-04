From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH] fix for tty-serial-move-port
Date: Thu, 4 Dec 2008 20:16:17 +0300
Message-ID: <20081204171617.GA17913@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ug-out-1314.google.com ([66.249.92.168]:51595 "EHLO
	ug-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753473AbYLDRQ2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Dec 2008 12:16:28 -0500
Received: by ug-out-1314.google.com with SMTP id 39so3828790ugf.37
        for <linux-next@vger.kernel.org>; Thu, 04 Dec 2008 09:16:26 -0800 (PST)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, alan@lxorguk.ukuu.org.uk, linux-kernel@vger.kernel.org

Hi Alan

next-20081204 crashes with the following message:

BUG: unable to handle kernel paging request at ffff88007d320248
IP: [<ffffffff803de934>] uart_remove_one_port+0xef/0x111
                kfree(info);
     393:       49 8d 7d 10             lea    0x10(%r13),%rdi
     397:       e8 00 00 00 00          callq  39c <uart_remove_one_port+0xef>

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 drivers/serial/serial_core.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/serial/serial_core.c b/drivers/serial/serial_core.c
index e99a269..4fc25e4 100644
--- a/drivers/serial/serial_core.c
+++ b/drivers/serial/serial_core.c
@@ -2530,10 +2530,8 @@ int uart_remove_one_port(struct uart_driver *drv, struct uart_port *port)
 	/*
 	 * Kill the tasklet, and free resources.
 	 */
-	if (info) {
+	if (info)
 		tasklet_kill(&info->tlet);
-		kfree(info);
-	}
 
 	state->port = NULL;
 	mutex_unlock(&port_mutex);
