From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the hwpoison tree with Linus' tree
Date: Fri, 8 Oct 2010 14:40:37 +1100
Message-ID: <20101008144037.f487b6d7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42569 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751140Ab0JHDkl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Oct 2010 23:40:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Andi,

Today's linux-next merge of the hwpoison tree got a conflict in
mm/memory-failure.c between commit
0d9ee6a2d4a6e92c49e6fa9469e5731d21ee203e ("HWPOISON: Report correct
address granuality for AO huge page errors") from Linus' tree and commit
3c5ca5455796841ac3cd706a91ba8dada908c375 ("HWPOISON: Report correct
address granuality for AO huge page errors") from the hwpoison tree.

Slightly different versions of the same patch.  I used the version from
Linus' tree (since it was committed later).  The conflict looked like this:

diff --cc mm/memory-failure.c
index 757f6b0,0966b6a..0000000
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@@ -198,7 -203,8 +203,12 @@@ static int kill_proc_ao(struct task_str
  #ifdef __ARCH_SI_TRAPNO
  	si.si_trapno = trapno;
  #endif
++<<<<<<< HEAD
 +	si.si_addr_lsb = compound_order(compound_head(page)) + PAGE_SHIFT;
++=======
+ 	order = PageCompound(page) ? huge_page_order(page) : PAGE_SHIFT;
+ 	si.si_addr_lsb = order;
++>>>>>>> hwpoison/hwpoison
  	/*
  	 * Don't use force here, it's convenient if the signal
  	 * can be temporarily blocked.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
