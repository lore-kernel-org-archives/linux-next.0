From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree
Date: Wed, 20 Aug 2008 16:40:54 +1000
Message-ID: <20080820164054.c8bbb0d2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43258 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750972AbYHTGlG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Aug 2008 02:41:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Christoph Lameter <cl@linux-foundation.org>

Hi all,

Today's linux-next merge of the kmemcheck tree got a trivial conflict in
mm/slub.c between commit e63352fa06fb8c476e56e51323d80f2e7baee67f
("kmemtrace: SLUB hooks") from the slab tree and commit
18fd427debcf37c06917b55295df682fd05fee76 ("slub: add hooks for
kmemcheck") from the kmemcheck tree.

Just overlapping additions of includes.  I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc mm/slub.c
index 141a590,5d15933..0000000
--- a/mm/slub.c
+++ b/mm/slub.c
@@@ -23,7 -23,7 +23,8 @@@
  #include <linux/kallsyms.h>
  #include <linux/memory.h>
  #include <linux/math64.h>
 +#include <linux/kmemtrace.h>
+ #include <linux/kmemcheck.h>
  
  /*
   * Lock order:
