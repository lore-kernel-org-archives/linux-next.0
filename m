From: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH 1/2] ipc/sem.c: Fix complex_count vs. simple op race
Date: Mon, 20 Jun 2016 17:30:15 -0700
Message-ID: <20160621003015.GA15593@linux-80c1.suse>
References: <20160615152318.164b1ebd@canb.auug.org.au>
 <1466280142-19741-1-git-send-email-manfred@colorfullife.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1466280142-19741-1-git-send-email-manfred@colorfullife.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Manfred Spraul <manfred@colorfullife.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, 1vier1@web.de, felixh@informatik.uni-bremen.de, stable@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Sat, 18 Jun 2016, Manfred Spraul wrote:

>diff --git a/include/linux/sem.h b/include/linux/sem.h
>index 976ce3a..d0efd6e 100644
>--- a/include/linux/sem.h
>+++ b/include/linux/sem.h
>@@ -21,6 +21,7 @@ struct sem_array {
> 	struct list_head	list_id;	/* undo requests on this array */
> 	int			sem_nsems;	/* no. of semaphores in array */
> 	int			complex_count;	/* pending complex operations */

I see this patch also takes care of complex_count needing READ/WRITE_ONCE
as you change that to always be done with the big sem_perm lock.

>+	bool			complex_mode;	/* no parallel simple ops */

But I'm wondering about races with this one. Doesn't complex_mode need
acquire/release semantics?

> };
>

[...]

> /*
>- * Wait until all currently ongoing simple ops have completed.
>+ * Enter the mode suitable for non-simple operations:
>  * Caller must own sem_perm.lock.
>- * New simple ops cannot start, because simple ops first check
>- * that sem_perm.lock is free.
>- * that a) sem_perm.lock is free and b) complex_count is 0.
>  */
>-static void sem_wait_array(struct sem_array *sma)
>+static void complexmode_enter(struct sem_array *sma)
> {
> 	int i;
> 	struct sem *sem;
>
>-	if (sma->complex_count)  {
>-		/* The thread that increased sma->complex_count waited on
>-		 * all sem->lock locks. Thus we don't need to wait again.
>-		 */
>+	if (sma->complex_mode)  {
>+		/* We are already in complex_mode. Nothing to do */

This complex_mode load is serialized because both complexmode_enter() and
_tryleave(), which are the main calls that modify the variable, are serialized
by sem_perm lock, right?

> 		return;
> 	}

Btw, I like that this logic is much simpler, just by reading the comments :)

>+	WRITE_ONCE(sma->complex_mode, true);
>+
>+	/* We need a full barrier:
>+	 * The write to complex_mode must be visible
>+	 * before we read the first sem->lock spinlock state.
>+	 */
>+	smp_mb();
>
> 	for (i = 0; i < sma->sem_nsems; i++) {
> 		sem = sma->sem_base + i;
>@@ -285,6 +294,29 @@ static void sem_wait_array(struct sem_array *sma)
> }
>
> /*
>+ * Try to leave the mode that disallows simple operations:
>+ * Caller must own sem_perm.lock.
>+ */
>+static void complexmode_tryleave(struct sem_array *sma)
>+{
>+	if (sma->complex_count)  {
>+		/* Complex ops are sleeping.
>+		 * We must stay in complex mode
>+		 */
>+		return;
>+	}
>+	/*
>+	 * Immediately after setting complex_mode to false,
>+	 * a simple op can start. Thus: all memory writes
>+	 * performed by the current operation must be visible
>+	 * before we set complex_mode to false.
>+	 */
>+	smp_wmb();
>+
>+	WRITE_ONCE(sma->complex_mode, false);

smp_store_release()? See below.

>+}
>+
>+/*
>  * If the request contains only one semaphore operation, and there are
>  * no complex transactions pending, lock only the semaphore involved.
>  * Otherwise, lock the entire semaphore array, since we either have
>@@ -300,56 +332,38 @@ static inline int sem_lock(struct sem_array *sma, struct sembuf *sops,
> 		/* Complex operation - acquire a full lock */
> 		ipc_lock_object(&sma->sem_perm);
>
>-		/* And wait until all simple ops that are processed
>-		 * right now have dropped their locks.
>-		 */
>-		sem_wait_array(sma);
>+		/* Prevent parallel simple ops */
>+		complexmode_enter(sma);
> 		return -1;
> 	}
>
> 	/*
> 	 * Only one semaphore affected - try to optimize locking.
>-	 * The rules are:
>-	 * - optimized locking is possible if no complex operation
>-	 *   is either enqueued or processed right now.
>-	 * - The test for enqueued complex ops is simple:
>-	 *      sma->complex_count != 0
>-	 * - Testing for complex ops that are processed right now is
>-	 *   a bit more difficult. Complex ops acquire the full lock
>-	 *   and first wait that the running simple ops have completed.
>-	 *   (see above)
>-	 *   Thus: If we own a simple lock and the global lock is free
>-	 *	and complex_count is now 0, then it will stay 0 and
>-	 *	thus just locking sem->lock is sufficient.
>+	 * Optimized locking is possible if no complex operation
>+	 * is either enqueued or processed right now.
>+	 *
>+	 * Both facts are tracked by complex_mode.
> 	 */
> 	sem = sma->sem_base + sops->sem_num;
>
>-	if (sma->complex_count == 0) {
>+	/*
>+	 * Initial check for complex_mode. Just an optimization,
>+	 * no locking.
>+	 */
>+	if (!READ_ONCE(sma->complex_mode)) {

We have no lock (which is the whole point), I think we need stronger
guarantees here to avoid racing with another thread that holds sem_perm
lock and is entering complexmode for the first time or vice versa with
tryleave(). An smp_load_acquire here would pair with the suggested
smp_store_release calls.

Thanks,
Davidlohr
