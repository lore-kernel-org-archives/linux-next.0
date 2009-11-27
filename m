From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] misc/eeprom: fix at24 printk format
Date: Thu, 26 Nov 2009 22:22:00 -0800
Message-ID: <4B0F7008.8000204@oracle.com>
References: <20091126203837.b64fb4d3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:19937 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751650AbZK0GXP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 27 Nov 2009 01:23:15 -0500
In-Reply-To: <20091126203837.b64fb4d3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Wolfram Sang <w.sang@pengutronix.de>, David Brownell <dbrownell@users.sourceforge.net>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix printk format warning:

drivers/misc/eeprom/at24.c:230: warning: format '%zd' expects type 'signed size_t', but argument 6 has type 'int'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc:	Wolfram Sang <w.sang@pengutronix.de>
Cc:	David Brownell <dbrownell@users.sourceforge.net>
---
 drivers/misc/eeprom/at24.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20091126.orig/drivers/misc/eeprom/at24.c
+++ linux-next-20091126/drivers/misc/eeprom/at24.c
@@ -227,7 +227,7 @@ static ssize_t at24_eeprom_read(struct a
 			if (status == 2)
 				status = count;
 		}
-		dev_dbg(&client->dev, "read %zu@%d --> %zd (%ld)\n",
+		dev_dbg(&client->dev, "read %zu@%d --> %d (%ld)\n",
 				count, offset, status, jiffies);
 
 		if (status == count)
