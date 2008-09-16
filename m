From: "Randy.Dunlap" <rdunlap@xenotime.net>
Subject: [PATCH -next] blkdev.h: fix warnings when CONFIG_BLOCK=n
Date: Tue, 16 Sep 2008 12:29:21 -0700 (PDT)
Message-ID: <Pine.LNX.4.64.0809161226230.32267@shark.he.net>
References: <20080916173415.14012569.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xenotime.net ([66.160.160.81]:48535 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1754513AbYIPT3Z (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Sep 2008 15:29:25 -0400
Received: from shark.he.net ([66.160.160.2]) by xenotime.net for <linux-next@vger.kernel.org>; Tue, 16 Sep 2008 12:29:21 -0700
In-Reply-To: <20080916173415.14012569.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, akpm@linux-foundation.org, LKML <linux-kernel@vger.kernel.org>, axboe@kernel.dk

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix lots of build warnings when CONFIG_BLOCK=n:

linux-next-20080916/include/linux/blkdev.h:1093: warning: 'struct block_device' declared inside parameter list
linux-next-20080916/include/linux/blkdev.h:1093: warning: its scope is only this definition or declaration, which is probably not what you want
linux-next-20080916/include/linux/blkdev.h:1097: warning: 'struct gendisk' declared inside parameter list
linux-next-20080916/include/linux/blkdev.h:1105: warning: 'struct hd_geometry' declared inside parameter list

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 include/linux/blkdev.h |    4 ++++
 1 file changed, 4 insertions(+)

--- linux-next-20080916.orig/include/linux/blkdev.h
+++ linux-next-20080916/include/linux/blkdev.h
@@ -1089,6 +1089,10 @@ static inline long nr_blockdev_pages(voi
 
 #endif /* CONFIG_BLOCK */
 
+struct block_device;
+struct gendisk;
+struct hd_geometry;
+
 extern int __blkdev_driver_ioctl(struct block_device *, fmode_t, unsigned int,
 				 unsigned long);
 
