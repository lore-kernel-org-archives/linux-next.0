From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the slab tree
Date: Mon, 3 Nov 2008 15:19:11 +1100
Message-ID: <20081103151911.b18d641a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55396 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754461AbYKCETS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 2 Nov 2008 23:19:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>
Cc: linux-next@vger.kernel.org, Rik van Riel <riel@redhat.com>, Lee Schermerhorn <Lee.Schermerhorn@hp.com>, KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, Hugh Dickins <hugh@veritas.com>, Daisuke Nishimura <nishimura@mxp.nes.nec.co.jp>, Andrew Morton <akpm@linux-foundation.org>

Hi all,

Today's linux-next merge of the slab tree got a conflict in mm/vmscan.c
between commit 4f98a2fee8acdb4ac84545df98cccecfd130f8db ("vmscan: split
LRU lists into anon & file sets") from Linus' tree and commit
9fb8a023ad432b0ca884790a8a05991180ab42b6 ("slub: Trigger defragmentation
from memory reclaim") from the slab tree.

Overlapping changes.  I fixed it up (see below) and will carry the fix
for a few days (during which time I hope it will be fixed in the slab
tree).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc mm/vmscan.c
index 3b58602,b72cb36..0000000
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@@ -2095,7 -1932,7 +2144,7 @@@ unsigned long shrink_all_memory(unsigne
  
  			reclaim_state.reclaimed_slab = 0;
  			shrink_slab(sc.nr_scanned, sc.gfp_mask,
- 					global_lru_pages());
 -					count_lru_pages(), NULL);
++					global_lru_pages(), NULL);
  			ret += reclaim_state.reclaimed_slab;
  			if (ret >= nr_pages)
  				goto out;
@@@ -2112,7 -1949,7 +2161,7 @@@
  	if (!ret) {
  		do {
  			reclaim_state.reclaimed_slab = 0;
- 			shrink_slab(nr_pages, sc.gfp_mask, global_lru_pages());
 -			shrink_slab(nr_pages, sc.gfp_mask, count_lru_pages(), NULL);
++			shrink_slab(nr_pages, sc.gfp_mask, global_lru_pages(), NULL);
  			ret += reclaim_state.reclaimed_slab;
  		} while (ret < nr_pages && reclaim_state.reclaimed_slab > 0);
  	}
