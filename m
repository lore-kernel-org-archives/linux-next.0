From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemleak tree
Date: Mon, 19 Jan 2009 16:16:07 +1100
Message-ID: <20090119161607.952954a3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55499 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752590AbZASFQK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 Jan 2009 00:16:10 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org

Hi Catalin,

Today's linux-next merge of the kmemleak tree got a conflict in
mm/vmalloc.c between commit 822c18f2e38cbc775792ab65ace4f9198678dec9
("alpha: fix vmalloc breakage") from Linus' tree and commit
2465f1b33e3031313375b2992498560ad3ae5780 ("kmemleak: Add the vmalloc
memory allocation/freeing hooks") from the kmemleak tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary (but it could be fixed by merging Linus' tree into the
kmemleak tree).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc mm/vmalloc.c
index 75f49d3,98af10c..0000000
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@@ -23,7 -24,7 +23,8 @@@
  #include <linux/rbtree.h>
  #include <linux/radix-tree.h>
  #include <linux/rcupdate.h>
 +#include <linux/bootmem.h>
+ #include <linux/kmemleak.h>
  
  #include <asm/atomic.h>
  #include <asm/uaccess.h>
