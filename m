From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the slab tree
Date: Mon, 3 Nov 2008 15:26:10 +1100
Message-ID: <20081103152610.52588248.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44996 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754478AbYKCE0Q (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 2 Nov 2008 23:26:16 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>
Cc: linux-next@vger.kernel.org, Rik van Riel <riel@redhat.com>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Andrew Morton <akpm@linux-foundation.org>, KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>

Hi all,

Today's linux-next merge of the slab tree got a conflict in mm/vmstat.c
between commit 556adecba110bf5f1db6c6b56416cfab5bcab698 ("vmscan: second
chance replacement for anonymous pages") from Linus' tree and commit
9fb8a023ad432b0ca884790a8a05991180ab42b6 ("slub: Trigger defragmentation
from memory reclaim") from the slab tree.

Just context changes.  I fixed it up (see below) and will carry the fix
for a few days (during which time I hope it is fixed in the slab tree).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc mm/vmstat.c
index 022418e,5efc2c5..0000000
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@@ -774,14 -731,14 +774,16 @@@ static void zoneinfo_show_print(struct 
  #endif
  	}
  	seq_printf(m,
+ 		   "\n  slab_defrag_count: %lu"
  		   "\n  all_unreclaimable: %u"
  		   "\n  prev_priority:     %i"
 -		   "\n  start_pfn:         %lu",
 +		   "\n  start_pfn:         %lu"
 +		   "\n  inactive_ratio:    %u",
- 			   zone_is_all_unreclaimable(zone),
+ 			zone->slab_defrag_counter,
+ 			zone_is_all_unreclaimable(zone),
  		   zone->prev_priority,
 -		   zone->zone_start_pfn);
 +		   zone->zone_start_pfn,
 +		   zone->inactive_ratio);
  	seq_putc(m, '\n');
  }
  
