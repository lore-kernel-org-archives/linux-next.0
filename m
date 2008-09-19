From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Fri, 19 Sep 2008 12:53:32 +1000
Message-ID: <20080919125332.f84ddf4b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59867 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754223AbYISCxk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Sep 2008 22:53:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/char/ip2/ip2main.c between commit
64dd9a65b282990a82d5ca0459e0be291f00270c ("device create: char: convert
device_create_drvdata to device_create") from the driver-core tree and
commit f9d65d9f1b0ad12c71771e1c47fb585da1f19818 ("ip2-cleanup-init") from
the ttydev tree.

I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/char/ip2/ip2main.c
index e215e0c,6774572..0000000
--- a/drivers/char/ip2/ip2main.c
+++ b/drivers/char/ip2/ip2main.c
@@@ -705,23 -731,24 +731,24 @@@ static int __init ip2_loadmain(void
  	/* Register the read_procmem thing */
  	if (!proc_create("ip2mem",0,NULL,&ip2mem_proc_fops)) {
  		printk(KERN_ERR "IP2: failed to register read_procmem\n");
- 	} else {
+ 		return -EIO; /* leaking resources */
+ 	}
  
- 	ip2trace (ITRC_NO_PORT, ITRC_INIT, 4, 0 );
- 		/* Register the interrupt handler or poll handler, depending upon the
- 		 * specified interrupt.
- 		 */
+ 	ip2trace(ITRC_NO_PORT, ITRC_INIT, 4, 0);
+ 	/* Register the interrupt handler or poll handler, depending upon the
+ 	 * specified interrupt.
+ 	 */
  
- 		for( i = 0; i < IP2_MAX_BOARDS; ++i ) {
- 			if ( 0 == ip2config.addr[i] ) {
- 				continue;
- 			}
+ 	for (i = 0; i < IP2_MAX_BOARDS; ++i) {
+ 		if (ip2config.addr[i] == 0)
+ 			continue;
  
- 			if ( NULL != ( pB = i2BoardPtrTable[i] ) ) {
- 				device_create(ip2_class, NULL,
+ 		pB = i2BoardPtrTable[i];
+ 		if (pB != NULL) {
 -			device_create_drvdata(ip2_class, NULL,
++			device_create(ip2_class, NULL,
  					      MKDEV(IP2_IPL_MAJOR, 4 * i),
  					      NULL, "ipl%d", i);
- 				device_create(ip2_class, NULL,
 -			device_create_drvdata(ip2_class, NULL,
++			device_create(ip2_class, NULL,
  					      MKDEV(IP2_IPL_MAJOR, 4 * i + 1),
  					      NULL, "stat%d", i);
  
