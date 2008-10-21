From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree
Date: Tue, 21 Oct 2008 16:15:05 +1100
Message-ID: <20081021161505.29ee7cc9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51223 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751321AbYJUFe7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Oct 2008 01:34:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>

Hi all,

Today's linux-next merge of the kmemcheck tree got a conflict in
include/linux/mm_types.h between commit
52d4b9ac0b985168009c2a57098324e67bae171f ("memcg: allocate all
page_cgroup at boot") from Linus' tree and commit
385e31b9eae0528bada07d16a189f3f40df23961 ("kmemcheck: add the kmemcheck
core") from the kmemcheck tree.

Just changed context.  I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/linux/mm_types.h
index fe82547,bca924a..0000000
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@@ -94,6 -94,13 +94,10 @@@ struct page 
  	void *virtual;			/* Kernel virtual address (NULL if
  					   not kmapped, ie. highmem) */
  #endif /* WANT_PAGE_VIRTUAL */
 -#ifdef CONFIG_CGROUP_MEM_RES_CTLR
 -	unsigned long page_cgroup;
 -#endif
+ 
+ #ifdef CONFIG_KMEMCHECK
+ 	void *shadow;
+ #endif
  };
  
  /*
