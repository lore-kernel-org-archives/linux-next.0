From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the moduleh tree
Date: Wed, 28 Sep 2011 17:50:57 +1000
Message-ID: <20110928175057.2bff6b3dca98b4662a68a1d2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:50781 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751246Ab1I1HvB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Sep 2011 03:51:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Bradshaw <sbradshaw@micron.com>, Asai Thambi S P <asamymuthupa@micron.com>, Jens Axboe <axboe@kernel.dk>

Hi Paul,

After merging the moduleh tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/block/mtip32xx/mtip32xx.c:3542:1: warning: data definition has no type or storage class
drivers/block/mtip32xx/mtip32xx.c:3542:1: warning: type defaults to 'int' in declaration of 'MODULE_DEVICE_TABLE'
drivers/block/mtip32xx/mtip32xx.c:3542:1: warning: parameter names (without types) in function declaration
drivers/block/mtip32xx/mtip32xx.c:3589:15: error: expected declaration specifiers or '...' before string constant
drivers/block/mtip32xx/mtip32xx.c:3589:1: warning: data definition has no type or storage class
drivers/block/mtip32xx/mtip32xx.c:3589:1: warning: type defaults to 'int' in declaration of 'MODULE_AUTHOR'
drivers/block/mtip32xx/mtip32xx.c:3589:15: warning: function declaration isn't a prototype
drivers/block/mtip32xx/mtip32xx.c:3590:20: error: expected declaration specifiers or '...' before string constant
drivers/block/mtip32xx/mtip32xx.c:3590:1: warning: data definition has no type or storage class
drivers/block/mtip32xx/mtip32xx.c:3590:1: warning: type defaults to 'int' in declaration of 'MODULE_DESCRIPTION'
drivers/block/mtip32xx/mtip32xx.c:3590:20: warning: function declaration isn't a prototype
drivers/block/mtip32xx/mtip32xx.c:3591:16: error: expected declaration specifiers or '...' before string constant
drivers/block/mtip32xx/mtip32xx.c:3591:1: warning: data definition has no type or storage class
drivers/block/mtip32xx/mtip32xx.c:3591:1: warning: type defaults to 'int' in declaration of 'MODULE_LICENSE'
drivers/block/mtip32xx/mtip32xx.c:3591:16: warning: function declaration isn't a prototype
drivers/block/mtip32xx/mtip32xx.c:3592:16: error: expected declaration specifiers or '...' before string constant
drivers/block/mtip32xx/mtip32xx.c:3592:1: warning: data definition has no type or storage class
drivers/block/mtip32xx/mtip32xx.c:3592:1: warning: type defaults to 'int' in declaration of 'MODULE_VERSION'
drivers/block/mtip32xx/mtip32xx.c:3592:16: warning: function declaration isn't a prototype

Casued by commit 49fdf3a7c4cf ("block: Add driver for Micron RealSSD pcie
flash cards") from the block tree interacting with the module.h split up.

I applied the following patch for today (whcih should be applied to the
block tree ...).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 28 Sep 2011 17:47:05 +1000
Subject: [PATCH] block/mtip32xx: include module.h for its utilities

The module.h split up produced thses errors/warnings:

drivers/block/mtip32xx/mtip32xx.c:3542:1: warning: data definition has no type or storage class
drivers/block/mtip32xx/mtip32xx.c:3542:1: warning: type defaults to 'int' in declaration of 'MODULE_DEVICE_TABLE'
drivers/block/mtip32xx/mtip32xx.c:3542:1: warning: parameter names (without types) in function declaration
drivers/block/mtip32xx/mtip32xx.c:3589:15: error: expected declaration specifiers or '...' before string constant
drivers/block/mtip32xx/mtip32xx.c:3589:1: warning: data definition has no type or storage class
drivers/block/mtip32xx/mtip32xx.c:3589:1: warning: type defaults to 'int' in declaration of 'MODULE_AUTHOR'
drivers/block/mtip32xx/mtip32xx.c:3589:15: warning: function declaration isn't a prototype
drivers/block/mtip32xx/mtip32xx.c:3590:20: error: expected declaration specifiers or '...' before string constant
drivers/block/mtip32xx/mtip32xx.c:3590:1: warning: data definition has no type or storage class
drivers/block/mtip32xx/mtip32xx.c:3590:1: warning: type defaults to 'int' in declaration of 'MODULE_DESCRIPTION'
drivers/block/mtip32xx/mtip32xx.c:3590:20: warning: function declaration isn't a prototype
drivers/block/mtip32xx/mtip32xx.c:3591:16: error: expected declaration specifiers or '...' before string constant
drivers/block/mtip32xx/mtip32xx.c:3591:1: warning: data definition has no type or storage class
drivers/block/mtip32xx/mtip32xx.c:3591:1: warning: type defaults to 'int' in declaration of 'MODULE_LICENSE'
drivers/block/mtip32xx/mtip32xx.c:3591:16: warning: function declaration isn't a prototype
drivers/block/mtip32xx/mtip32xx.c:3592:16: error: expected declaration specifiers or '...' before string constant
drivers/block/mtip32xx/mtip32xx.c:3592:1: warning: data definition has no type or storage class
drivers/block/mtip32xx/mtip32xx.c:3592:1: warning: type defaults to 'int' in declaration of 'MODULE_VERSION'
drivers/block/mtip32xx/mtip32xx.c:3592:16: warning: function declaration isn't a prototype

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/block/mtip32xx/mtip32xx.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index 3ec3d34..0e19eb5 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -33,6 +33,7 @@
 #include <linux/bio.h>
 #include <linux/dma-mapping.h>
 #include <linux/idr.h>
+#include <linux/module.h>
 #include <../drivers/ata/ahci.h>
 #include "mtip32xx.h"
 
-- 
1.7.6.3

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
