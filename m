From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree
Date: Tue, 30 Dec 2008 23:18:15 +1100
Message-ID: <20081230231815.38762dc6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57085 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751303AbYL3MSR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 30 Dec 2008 07:18:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Akinobu Mita <akinobu.mita@gmail.com>

Hi all,

Today's linux-next merge of the kmemcheck tree got a conflict in
mm/slub.c between commit 773ff60e841461cb1f9374a713ffcda029b8c317 ("SLUB:
failslab support") from the slab tree and commit
18fd427debcf37c06917b55295df682fd05fee76 ("slub: add hooks for
kmemcheck") from the kmemcheck tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc mm/slub.c
index f0e2892,df12f28..0000000
--- a/mm/slub.c
+++ b/mm/slub.c
@@@ -24,7 -24,7 +24,8 @@@
  #include <linux/kallsyms.h>
  #include <linux/memory.h>
  #include <linux/math64.h>
 +#include <linux/fault-inject.h>
+ #include <linux/kmemcheck.h>
  
  /*
   * Lock order:
