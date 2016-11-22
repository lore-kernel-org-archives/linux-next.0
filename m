From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 22 Nov 2016 21:04:10 +1100
Message-ID: <20161122210410.5eca9fc2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Waiman Long <longman@redhat.com>, Davidlohr Bueso <dave@stgolabs.net>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

ipc/sem.c: In function 'freeary':
ipc/sem.c:1125:2: error: implicit declaration of function 'WAKE_Q' [-Werror=implicit-function-declaration]
  WAKE_Q(wake_q);
  ^
ipc/sem.c:1125:9: error: 'wake_q' undeclared (first use in this function)
  WAKE_Q(wake_q);
         ^
ipc/sem.c:1125:9: note: each undeclared identifier is reported only once for each function it appears in
ipc/sem.c: In function 'semctl_setval':
ipc/sem.c:1305:9: error: 'wake_q' undeclared (first use in this function)
  WAKE_Q(wake_q);
         ^
ipc/sem.c: In function 'semctl_main':
ipc/sem.c:1375:9: error: 'wake_q' undeclared (first use in this function)
  WAKE_Q(wake_q);
         ^
ipc/sem.c: In function 'SYSC_semtimedop':
ipc/sem.c:1931:10: error: 'wake_q' undeclared (first use in this function)
   WAKE_Q(wake_q);
          ^
ipc/sem.c: In function 'exit_sem':
ipc/sem.c:2115:10: error: 'wake_q' undeclared (first use in this function)
   WAKE_Q(wake_q);
          ^

Caused by commit

  fa8ecccee99f ("ipc/sem: rework task wakeups")

interacting with commit

  194a6b5b9cb6 ("sched/wake_q: Rename WAKE_Q to DEFINE_WAKE_Q")

from the tip tree.

I applied this merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 22 Nov 2016 20:34:47 +1100
Subject: [PATCH] ipc/sem: merge fix for WAKE_Q to DEFINE_WAKE_Q rename

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 ipc/sem.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/ipc/sem.c b/ipc/sem.c
index ca4aa23c622b..77c011e90414 100644
--- a/ipc/sem.c
+++ b/ipc/sem.c
@@ -1122,7 +1122,7 @@ static void freeary(struct ipc_namespace *ns, struct kern_ipc_perm *ipcp)
 	struct sem_queue *q, *tq;
 	struct sem_array *sma = container_of(ipcp, struct sem_array, sem_perm);
 	int i;
-	WAKE_Q(wake_q);
+	DEFINE_WAKE_Q(wake_q);
 
 	/* Free the existing undo structures for this semaphore set.  */
 	ipc_assert_locked_object(&sma->sem_perm);
@@ -1302,7 +1302,7 @@ static int semctl_setval(struct ipc_namespace *ns, int semid, int semnum,
 	struct sem_array *sma;
 	struct sem *curr;
 	int err, val;
-	WAKE_Q(wake_q);
+	DEFINE_WAKE_Q(wake_q);
 
 #if defined(CONFIG_64BIT) && defined(__BIG_ENDIAN)
 	/* big-endian 64bit */
@@ -1372,7 +1372,7 @@ static int semctl_main(struct ipc_namespace *ns, int semid, int semnum,
 	int err, nsems;
 	ushort fast_sem_io[SEMMSL_FAST];
 	ushort *sem_io = fast_sem_io;
-	WAKE_Q(wake_q);
+	DEFINE_WAKE_Q(wake_q);
 
 	rcu_read_lock();
 	sma = sem_obtain_object_check(ns, semid);
@@ -1928,7 +1928,7 @@ SYSCALL_DEFINE4(semtimedop, int, semid, struct sembuf __user *, tsops,
 
 	error = perform_atomic_semop(sma, &queue);
 	if (error == 0) { /* non-blocking succesfull path */
-		WAKE_Q(wake_q);
+		DEFINE_WAKE_Q(wake_q);
 
 		/*
 		 * If the operation was successful, then do
@@ -2112,7 +2112,7 @@ void exit_sem(struct task_struct *tsk)
 		struct sem_array *sma;
 		struct sem_undo *un;
 		int semid, i;
-		WAKE_Q(wake_q);
+		DEFINE_WAKE_Q(wake_q);
 
 		cond_resched();
 
-- 
2.10.2

-- 
Cheers,
Stephen Rothwell
