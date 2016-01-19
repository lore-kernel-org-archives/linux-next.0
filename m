From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with Linus' tree
Date: Tue, 19 Jan 2016 13:36:45 +1100
Message-ID: <20160119133645.5918cd34@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41192 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756797AbcASCgr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jan 2016 21:36:47 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, "David S. Miller" <davem@davemloft.net>, Johannes Weiner <hannes@cmpxchg.org>

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  include/net/tcp_memcontrol.h

between commit:

  cdb00777ffad ("tcp_memcontrol: Forward declare cgroup_subsys and mem_cgroup stucts")

from Linus' tree and commit:

  "mm: memcontrol: drop unused @css argument in memcg_init_kmem"

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/net/tcp_memcontrol.h
index 01ff7c6efada,dc2da2f8c8b2..000000000000
--- a/include/net/tcp_memcontrol.h
+++ b/include/net/tcp_memcontrol.h
@@@ -1,9 -1,7 +1,9 @@@
  #ifndef _TCP_MEMCG_H
  #define _TCP_MEMCG_H
  
- struct cgroup_subsys;
 +struct mem_cgroup;
 +
- int tcp_init_cgroup(struct mem_cgroup *memcg, struct cgroup_subsys *ss);
+ int tcp_init_cgroup(struct mem_cgroup *memcg);
  void tcp_destroy_cgroup(struct mem_cgroup *memcg);
+ 
  #endif /* _TCP_MEMCG_H */
