From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the hwpoison tree with Linus' tree
Date: Wed, 16 Dec 2009 16:21:03 +1100
Message-ID: <20091216162103.c423880d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60065 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752821AbZLPFVI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Dec 2009 00:21:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wu Fengguang <fengguang.wu@intel.com>, Hugh Dickins <hugh.dickins@tiscali.co.uk>, Andrew Morton <akpm@linux-foundation.org>

Hi Andi,

Today's linux-next merge of the hwpoison tree got a conflict in
mm/memcontrol.c between commit 407f9c8b0889ced1dbe2f9157e4e60c61329d5c9
("ksm: mem cgroup charge swapin copy") from Linus' tree and commit
eacbcea706766709f5c3bbbca208c04558a8d72f ("memcg: rename and export
try_get_mem_cgroup_from_page()") from the hwpoison tree.

Just context changes.  I fixed it up (see below) and can carry the fix
for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc mm/memcontrol.c
index e0c2066,4e51af7..0000000
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@@ -1737,13 -1739,12 +1739,13 @@@ int mem_cgroup_try_charge_swapin(struc
  		goto charge_cur_mm;
  	/*
  	 * A racing thread's fault, or swapoff, may have already updated
 -	 * the pte, and even removed page from swap cache: return success
 -	 * to go on to do_swap_page()'s pte_same() test, which should fail.
 +	 * the pte, and even removed page from swap cache: in those cases
 +	 * do_swap_page()'s pte_same() test will fail; but there's also a
 +	 * KSM case which does need to charge the page.
  	 */
  	if (!PageSwapCache(page))
 -		return 0;
 +		goto charge_cur_mm;
- 	mem = try_get_mem_cgroup_from_swapcache(page);
+ 	mem = try_get_mem_cgroup_from_page(page);
  	if (!mem)
  		goto charge_cur_mm;
  	*ptr = mem;
