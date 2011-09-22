From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: [PATCH -next] sysfs: add unsigned long cast to prevent compile
 warning
Date: Thu, 22 Sep 2011 19:34:33 +0200
Message-ID: <20110922173432.GA2578@osiris.boeblingen.de.ibm.com>
References: <1316675701-5230-1-git-send-email-heiko.carstens@de.ibm.com>
 <Pine.LNX.4.64.1109221014240.28236@hs20-bc2-1.build.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate3.uk.ibm.com ([194.196.100.163]:34498 "EHLO
	mtagate3.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751197Ab1IVReg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 Sep 2011 13:34:36 -0400
Received: from d06nrmr1707.portsmouth.uk.ibm.com (d06nrmr1707.portsmouth.uk.ibm.com [9.149.39.225])
	by mtagate3.uk.ibm.com (8.13.1/8.13.1) with ESMTP id p8MHYYAP015811
	for <linux-next@vger.kernel.org>; Thu, 22 Sep 2011 17:34:34 GMT
Received: from d06av09.portsmouth.uk.ibm.com (d06av09.portsmouth.uk.ibm.com [9.149.37.250])
	by d06nrmr1707.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id p8MHYYVu2490502
	for <linux-next@vger.kernel.org>; Thu, 22 Sep 2011 18:34:34 +0100
Received: from d06av09.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id p8MHYXsA018194
	for <linux-next@vger.kernel.org>; Thu, 22 Sep 2011 11:34:33 -0600
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.1109221014240.28236@hs20-bc2-1.build.redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, linux-next@vger.kernel.org

On Thu, Sep 22, 2011 at 10:16:51AM -0400, Mikulas Patocka wrote:
> > -			printk(KERN_CRIT "sysfs: inserting duplicate inode '%lx'\n", sd->s_ino);
> > +			printk(KERN_CRIT "sysfs: inserting duplicate inode '%lux'\n",
> 
> This change is wrong. Leave the format string as it was ... "%lux" 
> actually prints a decimal long unsigned integer followed by the character 
> "x". "%lx" prints the hexadecimal unsigned long string.

Indeed.. I wanted to change it to %lu (so it matches other places which
print an inode) but obviously didn't manage to remove the "x".

So let's just keep it. Updated patch:

Subject: [PATCH] sysfs: add unsigned long cast to prevent compile warning

From: Heiko Carstens <heiko.carstens@de.ibm.com>

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
index c3646d9..83bb9d1 100644
--- a/fs/sysfs/dir.c
+++ b/fs/sysfs/dir.c
@@ -60,7 +60,8 @@ static void sysfs_link_sibling(struct sysfs_dirent *sd)
 		} else if (sd->s_ino > node->s_ino) {
 			p = &node->inode_node.rb_right;
 		} else {
-			printk(KERN_CRIT "sysfs: inserting duplicate inode '%lx'\n", sd->s_ino);
+			printk(KERN_CRIT "sysfs: inserting duplicate inode '%lx'\n",
+			       (unsigned long) sd->s_ino);
 			BUG();
 		}
 #undef node
-- 
1.7.5.4
