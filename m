From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Fri, 17 Aug 2012 04:50:19 -0700
Message-ID: <20120817115019.GJ2438@linux.vnet.ibm.com>
References: <20120816131236.13013e1ec18b1f1074f6dc92@canb.auug.org.au>
 <20120816194651.GK2445@linux.vnet.ibm.com>
 <20120817105633.0aba80ddf7eb9523e04c264d@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120817105633.0aba80ddf7eb9523e04c264d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, Namhyung Kim <namhyung@kernel.org>, "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On Fri, Aug 17, 2012 at 10:56:33AM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> On Thu, 16 Aug 2012 12:46:51 -0700 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
> >
> > On Thu, Aug 16, 2012 at 01:12:36PM +1000, Stephen Rothwell wrote:
> > > 
> > > After merging the tip tree, today's linux-next build (powerpc
> > > ppc64_defconfig) failed like this:
> > > 
> > > drivers/infiniband/hw/ehca/ehca_irq.c: In function 'find_next_online_cpu':
> > > drivers/infiniband/hw/ehca/ehca_irq.c:672:2: error: expected ';' before 'spin_unlock_irqrestore'
> > > 
> > > Caused by commit 81942621bd6b ("infiniband: Ehca: Use hotplug thread
> > > infrastructure").
> > > 
> > > I have used the tip tree from next-20120814 for today.
> > 
> > My first reaction was "we tested that!!!", but I see the conversion
> > from while(1) to do-while.  Does the following cure it?
> 
> Yes, that fixes the build problem.
> 
> However, the same commit is also responsible for all these new warnings:
> 
> drivers/infiniband/hw/ehca/ehca_irq.c: In function 'queue_comp_task':
> drivers/infiniband/hw/ehca/ehca_irq.c:710:9: warning: assignment from incompatible pointer type
> drivers/infiniband/hw/ehca/ehca_irq.c:719:10: warning: assignment from incompatible pointer type
> drivers/infiniband/hw/ehca/ehca_irq.c: In function 'comp_task_park':
> drivers/infiniband/hw/ehca/ehca_irq.c:764:9: warning: assignment from incompatible pointer type
> drivers/infiniband/hw/ehca/ehca_irq.c: In function 'comp_task':
> drivers/infiniband/hw/ehca/ehca_irq.c:803:1: warning: no return statement in function returning non-void
> drivers/infiniband/hw/ehca/ehca_irq.c: At top level:
> drivers/infiniband/hw/ehca/ehca_irq.c:807:2: warning: initialization from incompatible pointer type
> 
> Please address these.

Does the following help?

							Thanx, Paul

------------------------------------------------------------------------

infiniband: ehca: Fix compiler warnings

Fix comp_task() to return void to match smp_hotplug_thread's thread_fn
member, and adjust indirection on the ->cpu_comp_threads per-CPU
member of the ehca_comp_pool structure.

Signed-off-by: Paul E. McKenney <paul.mckenney@linaro.org>

diff --git a/drivers/infiniband/hw/ehca/ehca_irq.c b/drivers/infiniband/hw/ehca/ehca_irq.c
index 83a0095..8615d7c 100644
--- a/drivers/infiniband/hw/ehca/ehca_irq.c
+++ b/drivers/infiniband/hw/ehca/ehca_irq.c
@@ -707,7 +707,7 @@ static void queue_comp_task(struct ehca_cq *__cq)
 	BUG_ON(!cpu_online(cpu_id));
 
 	cct = per_cpu_ptr(pool->cpu_comp_tasks, cpu_id);
-	thread = per_cpu_ptr(pool->cpu_comp_threads, cpu_id);
+	thread = *per_cpu_ptr(pool->cpu_comp_threads, cpu_id);
 	BUG_ON(!cct || !thread);
 
 	spin_lock_irqsave(&cct->task_lock, flags);
@@ -716,7 +716,7 @@ static void queue_comp_task(struct ehca_cq *__cq)
 	if (cq_jobs > 0) {
 		cpu_id = find_next_online_cpu(pool);
 		cct = per_cpu_ptr(pool->cpu_comp_tasks, cpu_id);
-		thread = per_cpu_ptr(pool->cpu_comp_threads, cpu_id);
+		thread = *per_cpu_ptr(pool->cpu_comp_threads, cpu_id);
 		BUG_ON(!cct || !thread);
 	}
 	__queue_comp_task(__cq, cct, thread);
@@ -761,7 +761,7 @@ static void comp_task_park(unsigned int cpu)
 
 	cpu = find_next_online_cpu(pool);
 	target = per_cpu_ptr(pool->cpu_comp_tasks, cpu);
-	thread = per_cpu_ptr(pool->cpu_comp_threads, cpu);
+	thread = *per_cpu_ptr(pool->cpu_comp_threads, cpu);
 	spin_lock_irq(&target->task_lock);
 	list_for_each_entry_safe(cq, tmp, &list, entry) {
 		list_del(&cq->entry);
@@ -788,7 +788,7 @@ static int comp_task_should_run(unsigned int cpu)
 	return cct->cq_jobs;
 }
 
-static int comp_task(unsigned int cpu)
+static void comp_task(unsigned int cpu)
 {
 	struct ehca_cpu_comp_task *cct = this_cpu_ptr(pool->cpu_comp_tasks);
 	int cql_empty;
