From: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: kdump regression compared to v2.6.35
Date: Mon, 30 Aug 2010 19:31:44 +0200
Message-ID: <4C7BEB00.9060801@kernel.org>
References: <1331313838.1541221283181038073.JavaMail.root@zmail06.collab.prod.int.phx2.redhat.com>
	<4C7BDE6E.8030107@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kexec-bounces+glkk-kexec=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <4C7BDE6E.8030107-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kexec>,
	<mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kexec/>
List-Post: <mailto:kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kexec>,
	<mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: kexec-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Errors-To: kexec-bounces+glkk-kexec=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: caiqian-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kexec <kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Please try this one instead.  Thanks.

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index a2dccfc..75cdbc2 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -1224,6 +1224,8 @@ __acquires(&gcwq->lock)
 {
 	struct global_cwq *gcwq = worker->gcwq;
 	struct task_struct *task = worker->task;
+	static unsigned int cnt;
+	int rc;

 	while (true) {
 		/*
@@ -1232,8 +1234,11 @@ __acquires(&gcwq->lock)
 		 * it races with cpu hotunplug operation.  Verify
 		 * against GCWQ_DISASSOCIATED.
 		 */
-		if (!(gcwq->flags & GCWQ_DISASSOCIATED))
-			set_cpus_allowed_ptr(task, get_cpu_mask(gcwq->cpu));
+		if (!(gcwq->flags & GCWQ_DISASSOCIATED)) {
+			rc = set_cpus_allowed_ptr(task, get_cpu_mask(gcwq->cpu));
+			if (rc && ++cnt < 10)
+				printk("XXX set_cpus_allowed_ptr() failed w/ %d\n", rc);
+		}

 		spin_lock_irq(&gcwq->lock);
 		if (gcwq->flags & GCWQ_DISASSOCIATED)
@@ -1985,13 +1990,16 @@ repeat:
 		struct cpu_workqueue_struct *cwq = get_cwq(tcpu, wq);
 		struct global_cwq *gcwq = cwq->gcwq;
 		struct work_struct *work, *n;
+		bool bound;

 		__set_current_state(TASK_RUNNING);
 		mayday_clear_cpu(cpu, wq->mayday_mask);

 		/* migrate to the target cpu if possible */
 		rescuer->gcwq = gcwq;
-		worker_maybe_bind_and_lock(rescuer);
+		printk("XXX %s: rescuer dispatching to cpu%u\n", wq->name, gcwq->cpu);
+		bound = worker_maybe_bind_and_lock(rescuer);
+		printk("XXX %s: rescuer done binding, bound=%d\n", wq->name, bound);

 		/*
 		 * Slurp in all works issued via this workqueue and
@@ -3558,8 +3566,7 @@ static int __init init_workqueues(void)
 		spin_lock_init(&gcwq->lock);
 		INIT_LIST_HEAD(&gcwq->worklist);
 		gcwq->cpu = cpu;
-		if (cpu == WORK_CPU_UNBOUND)
-			gcwq->flags |= GCWQ_DISASSOCIATED;
+		gcwq->flags |= GCWQ_DISASSOCIATED;

 		INIT_LIST_HEAD(&gcwq->idle_list);
 		for (i = 0; i < BUSY_WORKER_HASH_SIZE; i++)
@@ -3583,6 +3590,8 @@ static int __init init_workqueues(void)
 		struct global_cwq *gcwq = get_gcwq(cpu);
 		struct worker *worker;

+		if (cpu != WORK_CPU_UNBOUND)
+			gcwq->flags &= ~GCWQ_DISASSOCIATED;
 		worker = create_worker(gcwq, true);
 		BUG_ON(!worker);
 		spin_lock_irq(&gcwq->lock);
