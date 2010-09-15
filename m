From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bkl-vfs tree with the usb tree
Date: Wed, 15 Sep 2010 13:42:20 +1000
Message-ID: <20100915134220.743bd584.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47981 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752331Ab0IODmZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Sep 2010 23:42:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?IlV3ZSBLbGVpbmUtS8O2bmlnIg==?= <u.kleine-koenig@pengutronix.de>, Greg KH <greg@kroah.com>, Jan Blunck <jblunck@infradead.org>

Hi Arnd,

Today's linux-next merge of the bkl-vfs tree got a conflict in
drivers/usb/gadget/inode.c between commit
e77e6e934520456e9e47f51847eb9dffa3dca9e5 ("usb gadget: don't save bind
callback in struct usb_gadget_driver") from the usb tree and commit
5cfc17f9036a43727c498ababa0ae79148bb4fb5 ("BKL: Explicitly add BKL around
get_sb/fill_super") from the bkl-vfs tree.

Just context changes. I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/usb/gadget/inode.c
index e2e8eda,82a88d3..0000000
--- a/drivers/usb/gadget/inode.c
+++ b/drivers/usb/gadget/inode.c
@@@ -2041,13 -2043,19 +2041,19 @@@ gadgetfs_fill_super (struct super_bloc
  	struct dentry	*d;
  	struct dev_data	*dev;
  
- 	if (the_device)
+ 	lock_kernel();
+ 
+ 	if (the_device) {
+ 		unlock_kernel();
  		return -ESRCH;
+ 	}
  
  	/* fake probe to determine $CHIP */
 -	(void) usb_gadget_register_driver (&probe_driver);
 +	(void) usb_gadget_probe_driver(&probe_driver, gadgetfs_probe);
- 	if (!CHIP)
+ 	if (!CHIP) {
+ 		unlock_kernel();
  		return -ENODEV;
+ 	}
  
  	/* superblock */
  	sb->s_blocksize = PAGE_CACHE_SIZE;
