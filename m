From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] regmap: fix regmap.c printk format warning
Date: Tue, 16 Oct 2012 13:30:18 -0700
Message-ID: <507DC3DA.3030403@xenotime.net>
References: <20121016145856.cfddc9c898c31b1c686804d7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy12-pub.bluehost.com ([50.87.16.10]:36421 "HELO
	oproxy12-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753939Ab2JPUaY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 16 Oct 2012 16:30:24 -0400
In-Reply-To: <20121016145856.cfddc9c898c31b1c686804d7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>

From: Randy Dunlap <rdunlap@xenotime.net>

Fix printk format warning (found on x86_64):

drivers/base/regmap/regmap.c:861:4: warning: format '%d' expects type 'int', but argument 5 has type 'size_t'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 drivers/base/regmap/regmap.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20121016.orig/drivers/base/regmap/regmap.c
+++ linux-next-20121016/drivers/base/regmap/regmap.c
@@ -858,7 +858,7 @@ static int _regmap_raw_write(struct regm
 
 		/* If the write goes beyond the end of the window split it */
 		while (val_num > win_residue) {
-			dev_dbg(map->dev, "Writing window %d/%d\n",
+			dev_dbg(map->dev, "Writing window %d/%zu\n",
 				win_residue, val_len / map->format.val_bytes);
 			ret = _regmap_raw_write(map, reg, val, win_residue *
 						map->format.val_bytes);
