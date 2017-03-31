From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the tip tree
Date: Fri, 31 Mar 2017 16:44:51 +1100
Message-ID: <20170331164451.519d1d7e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andi Kleen <ak@linux.intel.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  kernel/sched/fair.c

between commit:

  0ccb977f4c80 ("sched/fair: Explicitly generate __update_load_avg() instances")

from the tip tree and patch:

   "kernel/sched/fair.c: uninline __update_load_avg()"

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc kernel/sched/fair.c
index 359dbc05a3b4,28a2bd8bfb67..000000000000
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@@ -2929,11 -2848,14 +2929,11 @@@ accumulate_sum(u64 delta, int cpu, stru
   *   load_avg = u_0` + y*(u_0 + u_1*y + u_2*y^2 + ... )
   *            = u_0 + u_1*y + u_2*y^2 + ... [re-labeling u_i --> u_{i+1}]
   */
- static __always_inline int
+ static int
 -__update_load_avg(u64 now, int cpu, struct sched_avg *sa,
 +___update_load_avg(u64 now, int cpu, struct sched_avg *sa,
  		  unsigned long weight, int running, struct cfs_rq *cfs_rq)
  {
 -	u64 delta, scaled_delta, periods;
 -	u32 contrib;
 -	unsigned int delta_w, scaled_delta_w, decayed = 0;
 -	unsigned long scale_freq, scale_cpu;
 +	u64 delta;
  
  	delta = now - sa->last_update_time;
  	/*
