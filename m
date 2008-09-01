From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the firmware tree
Date: Mon, 1 Sep 2008 16:19:26 +1000
Message-ID: <20080901161926.d51de879.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45891 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751016AbYIAGTc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Sep 2008 02:19:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Jaswinder Singh <jaswinder@infradead.org>, "David S. Miller" <davem@davemloft.net>

Hi David,

Today's linux-next merge of the firmware tree got a conflict in
drivers/scsi/qlogicpti.c between commits
738f2b7b813913e651f39387d007dd961755dee2 ("sparc: Convert all SBUS
drivers to dma_*() interfaces") and
5dc2536bb8d8adb5fdfbe76cd6fdcdf9de3f40f8 ("qlogicpti: Convert to pure OF
driver") from the sparc tree and commit
229d9a03273684dc2175821be4104dbaa52f3ce0 ("qlogicpti: use
request_firmware") from the firmware tree.

Just simple clashes. I fixed it up (see below) and can carry the fixup.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/scsi/qlogicpti.c
index 4280767,1b6594e..0000000
--- a/drivers/scsi/qlogicpti.c
+++ b/drivers/scsi/qlogicpti.c
@@@ -25,9 -25,7 +25,10 @@@
  #include <linux/interrupt.h>
  #include <linux/module.h>
  #include <linux/jiffies.h>
 +#include <linux/dma-mapping.h>
 +#include <linux/of.h>
 +#include <linux/of_device.h>
+ #include <linux/firmware.h>
  
  #include <asm/byteorder.h>
  
@@@ -1456,7 -1470,8 +1474,8 @@@ static void __exit qpti_exit(void
  MODULE_DESCRIPTION("QlogicISP SBUS driver");
  MODULE_AUTHOR("David S. Miller (davem@davemloft.net)");
  MODULE_LICENSE("GPL");
 -MODULE_VERSION("2.0");
 +MODULE_VERSION("2.1");
+ MODULE_FIRMWARE("qlogic/isp1000.bin");
  
  module_init(qpti_init);
  module_exit(qpti_exit);
