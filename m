From: Johannes Weiner <hannes@cmpxchg.org>
Subject: Re: mmotm 2018-09-12-16-40 uploaded (psi)
Date: Wed, 12 Sep 2018 21:42:22 -0400
Message-ID: <20180913014222.GA2370@cmpxchg.org>
References: <20180912234039.Xa5RS%akpm@linux-foundation.org>
 <a9bef471-ac93-2983-618b-ffee65f01e0b@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a9bef471-ac93-2983-618b-ffee65f01e0b@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: akpm@linux-foundation.org, broonie@kernel.org, mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Randy,

Thanks for the report.

On Wed, Sep 12, 2018 at 05:45:08PM -0700, Randy Dunlap wrote:
> Multiple build errors when CONFIG_SMP is not set: (this is on i386 fwiw)
> 
> in the psi (pressure) patches, I guess:
> 
> In file included from ../kernel/sched/sched.h:1367:0,
>                  from ../kernel/sched/core.c:8:
> ../kernel/sched/stats.h: In function 'psi_task_tick':
> ../kernel/sched/stats.h:135:33: error: 'struct rq' has no member named 'cpu'
>    psi_memstall_tick(rq->curr, rq->cpu);

This needs to use the SMP/UP config-aware accessor.

Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
---

diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
index 2e07d8f59b3e..4904c4677000 100644
--- a/kernel/sched/stats.h
+++ b/kernel/sched/stats.h
@@ -132,7 +132,7 @@ static inline void psi_task_tick(struct rq *rq)
 		return;
 
 	if (unlikely(rq->curr->flags & PF_MEMSTALL))
-		psi_memstall_tick(rq->curr, rq->cpu);
+		psi_memstall_tick(rq->curr, cpu_of(rq));
 }
 #else /* CONFIG_PSI */
 static inline void psi_enqueue(struct task_struct *p, bool wakeup) {}
