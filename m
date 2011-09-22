From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [PATCH -next] sysfs: add unsigned long cast to prevent compile warning
Date: Thu, 22 Sep 2011 09:15:01 +0200
Message-ID: <1316675701-5230-1-git-send-email-heiko.carstens@de.ibm.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate3.uk.ibm.com ([194.196.100.163]:40510 "EHLO
	mtagate3.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750857Ab1IVHPI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 Sep 2011 03:15:08 -0400
Received: from d06nrmr1707.portsmouth.uk.ibm.com (d06nrmr1707.portsmouth.uk.ibm.com [9.149.39.225])
	by mtagate3.uk.ibm.com (8.13.1/8.13.1) with ESMTP id p8M7F4js009753
	for <linux-next@vger.kernel.org>; Thu, 22 Sep 2011 07:15:04 GMT
Received: from d06av09.portsmouth.uk.ibm.com (d06av09.portsmouth.uk.ibm.com [9.149.37.250])
	by d06nrmr1707.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id p8M7F3Ii2330644
	for <linux-next@vger.kernel.org>; Thu, 22 Sep 2011 08:15:04 +0100
Received: from d06av09.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id p8M7F2JZ027482
	for <linux-next@vger.kernel.org>; Thu, 22 Sep 2011 01:15:03 -0600
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: linux-next@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, Mikulas Patocka <mpatocka@redhat.com>

"sysfs: use rb-tree for inode number lookup" added a new printk which
causes a new compile warning on s390 (and few other architectures):

fs/sysfs/dir.c: In function 'sysfs_link_sibling':
fs/sysfs/dir.c:63:4: warning: format '%lx' expects argument of type
  'long unsigned int', but argument 2 has type 'ino_t' [-Wform

Add an explicit unsigned long cast since ino_t is an unsigned long on
most architectures.

Cc: Mikulas Patocka <mpatocka@redhat.com>
Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---
 fs/sysfs/dir.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/fs/sysfs/dir.c b/fs/sysfs/dir.c
index c3646d9..9a6e020 100644
--- a/fs/sysfs/dir.c
+++ b/fs/sysfs/dir.c
@@ -60,7 +60,8 @@ static void sysfs_link_sibling(struct sysfs_dirent *sd)
 		} else if (sd->s_ino > node->s_ino) {
 			p = &node->inode_node.rb_right;
 		} else {
-			printk(KERN_CRIT "sysfs: inserting duplicate inode '%lx'\n", sd->s_ino);
+			printk(KERN_CRIT "sysfs: inserting duplicate inode '%lux'\n",
+			       (unsigned long) sd->s_ino);
 			BUG();
 		}
 #undef node
-- 
1.7.5.4
