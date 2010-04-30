From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the staging-next tree
Date: Fri, 30 Apr 2010 15:52:05 +1000
Message-ID: <20100430155205.a4171034.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57407 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758515Ab0D3RHd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 30 Apr 2010 13:07:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>, Benjamin Thery <benjamin.thery@bull.net>, NeilBrown <neilb@suse.de>

Hi Greg,

After merging the staging-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/md/md.c: In function 'level_store':
drivers/md/md.c:3029: error: too few arguments to function 'sysfs_get_dirent'

Caused by commit 262f8e4937e7b4a587923ca3c039a184668f49ec ("sysfs:
Implement sysfs tagged directory support") from the driver-core tree
interacting with commit fecc531e3cc0de60514d326c7d82f1075ed55888 ("md:
manage redundancy group in sysfs when changing level") from the md.

I have applied this fixup patch for today and can carry it as necessary.

[This could have been avoided, of course, by creating a new API (maybe
sysfs_get_dirent_tagged) and implementing the old API in terms of that].

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 30 Apr 2010 15:00:20 +1000
Subject: [PATCH] md: fixup for sysfs_get_dirent API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/md/md.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 7f23558..b075b26 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -3026,7 +3026,7 @@ level_store(mddev_t *mddev, const char *buf, size_t len)
 			printk(KERN_WARNING
 			       "md: cannot register extra attributes for %s\n",
 			       mdname(mddev));
-		mddev->sysfs_action = sysfs_get_dirent(mddev->kobj.sd, "sync_action");
+		mddev->sysfs_action = sysfs_get_dirent(mddev->kobj.sd, NULL, "sync_action");
 	}		
 	if (mddev->pers->sync_request != NULL &&
 	    pers->sync_request == NULL) {
-- 
1.7.1

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
