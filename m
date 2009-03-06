From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemleak tree with the tip-core
 tree
Date: Fri, 6 Mar 2009 18:19:31 +1100
Message-ID: <20090306181931.4cdcc127.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51256 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751421AbZCFHTf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Mar 2009 02:19:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org

Hi Catalin,

Today's linux-next merge of the kmemleak tree got a conflict in
mm/vmalloc.c between commit f0aa6617903648077dffe5cfcf7c4458f4610fa7
("vmalloc: implement vm_area_register_early()") from the tip-core tree
and commit 27e72e01c414e46d39dc87024fa48092d93b77c5 ("kmemleak: Add the
vmalloc memory allocation/freeing hooks") from the kmemleak tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc mm/vmalloc.c
index af58324,40b9040..0000000
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@@ -24,7 -24,7 +24,8 @@@
  #include <linux/radix-tree.h>
  #include <linux/rcupdate.h>
  #include <linux/bootmem.h>
 +#include <linux/pfn.h>
+ #include <linux/kmemleak.h>
  
  #include <asm/atomic.h>
  #include <asm/uaccess.h>
