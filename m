From: Johannes Weiner <hannes@cmpxchg.org>
Subject: [patch] mm: memcg: make sure memory.events is uptodate when waking
 pollers fix
Date: Fri, 6 Apr 2018 11:54:41 -0400
Message-ID: <20180406155441.GA20806@cmpxchg.org>
References: <20180406145330.4d166464@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180406145330.4d166464@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Apr 06, 2018 at 02:53:30PM +1000, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> mm/memcontrol.c: In function 'memory_events_show':
> mm/memcontrol.c:5453:23: warning: array subscript is above array bounds [-Warray-bounds]
>       atomic_long_read(&memcg->memory_events[OOM_KILL]));
>                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   725844c87a0d ("mm: memcg: make sure memory.events is uptodate when waking pollers")

Ah, silly, I missed that warning. The below fixes it.

Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
---

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 04ea2b104ee2..9bac6dc26e09 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5199,8 +5199,7 @@ static int memory_events_show(struct seq_file *m, void *v)
 		   atomic_long_read(&memcg->memory_events[MEMCG_MAX]));
 	seq_printf(m, "oom %lu\n",
 		   atomic_long_read(&memcg->memory_events[MEMCG_OOM]));
-	seq_printf(m, "oom_kill %lu\n",
-		   atomic_long_read(&memcg->memory_events[OOM_KILL]));
+	seq_printf(m, "oom_kill %lu\n", memcg_sum_events(memcg, OOM_KILL));
 
 	return 0;
 }
