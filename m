From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bdev tree
Date: Thu, 18 Sep 2008 16:11:21 +1000
Message-ID: <20080918161121.3c05de97.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51070 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751146AbYIRGLr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Sep 2008 02:11:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, Mikulas Patocka <mpatocka@redhat.com>, Alasdair G Kergon <agk@redhat.com>

Hi Al,

Today's linux-next merge of the uwb tree got a conflict in
drivers/md/dm-table.c and drivers/md/dm.h between commit
12aba00642892cc565093c57be41693c7810e540 ("dm-export-struct-dm_dev") from
the device-mapper tree and "[PATCH] introduce fmode_t, do annotations"
from the bdev tree.

I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/md/dm-table.c
index f897007,65ac365..0000000
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@@ -382,12 -379,11 +382,12 @@@ static int check_device_area(struct dm_
   * careful to leave things as they were if we fail to reopen the
   * device.
   */
- static int upgrade_mode(struct dm_dev_internal *dd, int new_mode,
 -static int upgrade_mode(struct dm_dev *dd, fmode_t new_mode, struct mapped_device *md)
++static int upgrade_mode(struct dm_dev_internal *dd, fmode_t new_mode,
 +			struct mapped_device *md)
  {
  	int r;
 -	struct dm_dev dd_copy;
 -	dev_t dev = dd->bdev->bd_dev;
 +	struct dm_dev_internal dd_copy;
 +	dev_t dev = dd->dm_dev.bdev->bd_dev;
  
  	dd_copy = *dd;
  
diff --cc drivers/md/dm.h
index cd189da,f81ad57..0000000
--- a/drivers/md/dm.h
+++ b/drivers/md/dm.h
diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
index 73806ff..3f8d4e7 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -85,7 +85,7 @@ void dm_set_device_limits(struct dm_target *ti, struct block_device *bdev);
 
 struct dm_dev {
 	struct block_device *bdev;
-	int mode;
+	fmode_t mode;
 	char name[16];
 };
 
