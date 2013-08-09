From: Tejun Heo <tj@kernel.org>
Subject: [HEADSUP] conflicts between cgroup/for-3.12 and memcg
Date: Thu, 8 Aug 2013 20:34:02 -0400
Message-ID: <20130809003402.GC13427@mtj.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
Sender: owner-linux-mm@kvack.org
To: sfr@canb.auug.org.au, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@suse.cz>, Balbir Singh <bsingharora@gmail.com>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, cgroups@vger.kernel.org, linux-mm@kvack.org
List-Id: linux-next.vger.kernel.org

Hello, Stephen, Andrew.

I just applied rather invasive API update to cgroup/for-3.12, which
led to conflicts in two files - include/net/netprio_cgroup.h and
mm/memcontrol.c.  The former is trivial context conflict and the two
changes conflicting are independent.  The latter contains several
conflicts and unfortunately isn't trivial, especially the iterator
update and the memcg patches should probably be rebased.

I can hold back pushing for-3.12 into for-next until the memcg patches
are rebased.  Would that work?

Thanks.

-- 
tejun

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
