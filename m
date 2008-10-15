From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the md tree
Date: Wed, 15 Oct 2008 19:41:45 +1100
Message-ID: <20081015194145.f11c34e9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58958 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752032AbYJOJOo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 05:14:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Neil Brown <neilb@suse.de>
Cc: linux-next@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, Rusty Russell <rusty@rustcorp.com.au>

Hi Neil,

Today's linux-next merge of the md tree got a conflict in drivers/md/md.c
between commit d8ade4ef35e2ae74b4d4b012eacd16ac1c34ad50 ("remove
CONFIG_KMOD from drivers") from the rr tree and commit
6caa3b0bbdb474647f6bdd8a958ffc46f78d8d58 ("md: Remove unnecessary
#includes, #defines, and function declarations") from the md tree.

Overlapping removals. I fixed it up (see below) and can carry the fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/md/md.c
index 3323d76,8a34fc9..0000000
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@@ -41,17 -38,14 +38,15 @@@
  #include <linux/sysctl.h>
  #include <linux/buffer_head.h> /* for invalidate_bdev */
  #include <linux/poll.h>
- #include <linux/mutex.h>
  #include <linux/ctype.h>
- #include <linux/freezer.h>
- #include <linux/init.h>
- #include <linux/file.h>
 +#include <linux/kmod.h>
- 
- #include <asm/unaligned.h>
+ #include <linux/hdreg.h>
+ #include <linux/proc_fs.h>
+ #include <linux/random.h>
+ #include <linux/reboot.h>
+ #include <linux/file.h>
  
  #define MAJOR_NR MD_MAJOR
- #define MD_DRIVER
  
  /* 63 partitions with the alternate major number (mdp) */
  #define MdpMinorShift 6
