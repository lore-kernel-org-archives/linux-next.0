Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531383B6C05;
	Tue,  7 Jul 2026 07:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783408821; cv=none; b=Tzg2MJQlGZsUFRGXzC+/eYI3mUnTBUr7X1TO4xXcG6WLuQVmBv9ArcZ1gfZlK8aCK42edL/yKMfc3OnyLkPNOTfhTwMhY3V+Q+133FqcNr0JahajOXphU9frTsZSk9CDqTQr/oSzH2AdVc3M+hxm5ObLvpDARMTF+jZzQOzez9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783408821; c=relaxed/simple;
	bh=4MdES63+guZkzHGqeL5ivXmKeg78abWkwtGrzbBkvIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RsajWlja13Q2lignj/pwKgx3JV3UqhvfF6uGluPMPrFXh4CmPUOOQJ6P2Ejy5JZ7OkiCVwXj+LYtVfHM5om/C8JSShCQ03RWp2eNm2d2D00Mq/xB9bLkU8XhuGMr0b6KK4uZFNj/u1H5c5KnhOid7eBJnzFJuPtXJdfwUxpEBhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KaYa+zcA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KaYa+zcA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC42B1F000E9;
	Tue,  7 Jul 2026 07:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783408812;
	bh=wY02ZOOqtNUYu5fUXhQWrnqI9bOepK4rWFAgqLIkiFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KaYa+zcA1PR4dZQUZEz1SlvQ0HV8phLp284n/QGB68SqDnTE+TSk8113ki4/k39Cl
	 fRfoAqpMrfqbhnAo0FT2q20/dFSPGCZLS5XAdCXESEdeYP6jgfykOvOl62a3ZKywGV
	 htuZdzoI9CCFsOPVDmxvBArUeJe5h/i/023VS7Ps5iuzRR3AW0MH3qQaYjUsieTHZ/
	 V4scWSI/uggAaSeQq0Y0emi2O098Fa1aW0id0ChN9tPNYTbrOjunGO72H/tR9mUR6E
	 ZXTDxgtfl4MRhiLTrDURnQ9mrkc92Kf03g4QbgtTIjHb6faYsemOQfV+u8YvorVV/j
	 ZMMKO0b23g7WA==
Date: Tue, 7 Jul 2026 09:20:05 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	peterz@infradead.org, will@kernel.org, longman@redhat.com,
	gregkh@linuxfoundation.org, syzkaller <syzkaller@googlegroups.com>,
	Theodore Tso <tytso@mit.edu>
Subject: [PATCH -v2] lockdep: Enable the printing of held locks of remote
 running tasks and print task CPU
Message-ID: <akyopXs1SeH6rXu4@gmail.com>
References: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net>
 <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>
 <akZxfzEtam8yPXEh@MacBook-0RXW5>
 <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>
 <akoeSIQGwqd9cZwd@gmail.com>
 <2f7513c6-42e1-413b-8bd5-fa5abefe4b99@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f7513c6-42e1-413b-8bd5-fa5abefe4b99@I-love.SAKURA.ne.jp>


* Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp> wrote:

> On 2026/07/05 18:05, Ingo Molnar wrote:
> > TL;DR: it should be fine to print the held locks of running
> > tasks too, as long as we print out a warning when we print
> > such a task, so that users are aware of any racy output.
> > 
> > The (lightly tested) patch below implements this.
> > 
> > Note that this way there's no need to gate this on the Syzkaller
> > config option, and you wouldn't have to carry it in -next either,
> > it's a useful mainline kernel debuggability enhancement in its
> > own right.
> > 
> > Would this work for you?
> 
> Yes, this will be a helpful change. Thank you very much.
> I can drop "locking/lockdep: make lockdep_print_held_locks() always print
> if CONFIG_DEBUG_AID_FOR_SYZBOT=y" change from linux-next tree.
> 
> Please avoid emitting "BUG:" or "WARNING:", for syzkaller stops upon
> encountering these strings. Also, since printk() is a slow operation,
> please reduce number of characters to print where reasonable.
> 
> -		msg_running = " (WARNING: task running)";
> +		msg_running = " (running)";
> 
> If we can safely calculate on which CPU that thread is running (or waiting
> to run), printing CPU number might be also helpful.
> 
> 	char msg_running[14] = "";
> 
> 	if (task_is_running(p)) {
> 		int cpu_id = which_cpu_task_is_on(p); // If possible...
> 
> 		if (cpu_id >= 0)

[ Side note: task_cpu() is never negative and can always be relied on
  for valid tasks to be an int in the possible-CPUs numeric range. ]

> 			scnprintf(msg_running, sizeof(msg_running), "(C%u)", cpu_id);
> 		else
> 			scnprintf(msg_running, sizeof(msg_running), "(running)");
> 	}

Sure, we can print the CPU ID too, in fact we can do something even
better: for locking races it's useful information on which CPU
a task last ran on, right? So I think we should just print the CPU ID
of tasks unconditionally.

The patch below does this, and also streamlines the printout a bit,
into a single statement. The new message variants are:

  [   37.078569] locks held by sleep/7991: 1, on CPU#2:
  [   37.083565] locks held by sleep/7995: 1, on CPU#3:
  [   37.086346] locks held by sleep/7997: 5, last CPU#2:
  [   37.096518] locks held by sleep/8001: 6, last CPU#0
  [   37.056812] locks held by bash/414: 0, last CPU#0

See the patch description and the extended comment in the code
about the details.

I've applied this patch to tip:locking/debug, so it should
show up in -next tomorrow, but it can be iterated some more.

Thanks,

	Ingo

================================>
From: Ingo Molnar <mingo@kernel.org>
Date: Sun, 5 Jul 2026 11:05:17 +0200
Subject: [PATCH] lockdep: Enable the printing of held locks of remote running tasks and print task CPU

Background:
==========

Currently lockdep does not print out the held locks of non-current
tasks that are running on some other CPU, due to the fact that
the held locks array is in flux and may be unreliable to print.

Syzkaller on the other hand found it that the analysis of locking
bugs is easier if we print this information too, because the
more locking information the merrier. In particular races are
bound to have multiple tasks running on different CPUs, and
the exclusion of their held locks information is unnecessarily
limiting.

So while it's still true that printing out their held locks
array is racy, it's not as bad as it seems.

There's 16 internal callers to lockdep_print_held_locks():

 - 14 callers call it with the current task, which should be
   safe out of box.

 - 1 caller, debug_show_all_locks(), calls it with RCU held,
   which should guarantee that 'p' cannot go away under us.

 - 1 caller, debug_show_held_locks(), exposes the internal API
   with the constraint that it should only be called by drivers
   or platform code if the task isn't actively running - we can
   assume that if it nevertheless does, it will be Their Problem™.

As for held locks being changed from under debug_show_held_locks(),
while the task cannot go away, so the held-locks array itself is
safe (although potentially non-stable), AFAICS the worst-case race
can be garbage printed out by print_lock(), not any actual crashes.

In particular:

        unsigned int class_idx = hlock->class_idx;

may be stale (belong to a lock that already got released on another
CPU), but it should still be a valid class index bound by
MAX_LOCKDEP_KEYS, and thus the lock_classes_in_use bitmap use
should be safe.

The other two accesses are ::acquire_ip and ::instance:

       printk(KERN_CONT "%px", hlock->instance);
       print_lock_name(hlock, lock);
       printk(KERN_CONT ", at: %pS\n", (void *)hlock->acquire_ip);

But both are printed out as pointers, so no risk of dereference
of a dangling pointer. We may print a garbage pointer.

Also note that the check itself doesn't protect debug_show_held_locks()
from printing garbage, as there's nothing that keeps a task from
becoming runnable a nanosecond after we've run the task_is_running()
check. In fact I'd argue that it's better to make this function
*more* racy, for the simple robustness reason that we absolutely
do not want it to crash even in the racy case.

TL;DR: it should be fine to print the held locks of running
tasks too, as long as we print out a warning when we print
such a task, so that users are aware of any racy output.

Implementation:
==============

Implement that change.

Also re-flow the function and streamline the printout into
a single statement for all cases, which changes
the 'no locks held by' / '%d lock[s] held by' phrasing that had a
dependency on English spelling of plurals, to a uniform:

	locks held by bash/1234: %d

Which spells correctly for 0, 1 and higher values, and should also
be easier to parse both for humans and for scripts.

Finally, print out the last CPU a task has ran on. This is very
useful information for races and for locking bugs in particular.
This basically extends the 'on CPU#%d' message we print for
running tasks to all tasks we print.

Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Suggested-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>
Cc: Gary Guo <gary@garyguo.net>
Cc: Mark Brown <broonie@kernel.org>
Cc: Theodore Tso <tytso@mit.edu>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Waiman Long <longman@redhat.com>
Link: https://patch.msgid.link/akoeSIQGwqd9cZwd@gmail.com
---
 kernel/locking/lockdep.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 2d4c5bab5af8..ff4bbf14665e 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -787,17 +787,33 @@ static void lockdep_print_held_locks(struct task_struct *p)
 {
 	int i, depth = READ_ONCE(p->lockdep_depth);
 
-	if (!depth)
-		printk("no locks held by %s/%d.\n", p->comm, task_pid_nr(p));
-	else
-		printk("%d lock%s held by %s/%d:\n", depth,
-		       str_plural(depth), p->comm, task_pid_nr(p));
 	/*
-	 * It's not reliable to print a task's held locks if it's not sleeping
-	 * and it's not the current task.
+	 * Note that it's always somewhat unreliable to print held locks
+	 * of a task that is running on another CPU, but we cannot guarantee
+	 * the stability of ->held_locks without actually stopping all active
+	 * remote CPUs, which we absolutely do not want to do because it's
+	 * very intrusive and thus slow.
+	 *
+	 * So we do the next best thing here: we print out the held lock
+	 * array on a best-effort basis, without crashing even if the
+	 * fields are being modified on another CPU. Note the careful
+	 * construction of print_lock() so that it never crashes.
+	 *
+	 * We also print out the CPU the task is or was last running on, with
+	 * the message saying 'on CPU...' if the task is running, and
+	 * 'last CPU' if it's not.
+	 *
+	 * Also note that the task_is_running(p) information is fundamentally
+	 * racy: even if the message says the task is 'on CPU', the task may
+	 * have scheduled out already, or if it says 'last CPU', it may just
+	 * have scheduled in on another CPU. But even with these limitations
+	 * it's still useful debuggining information.
 	 */
-	if (p != current && task_is_running(p))
-		return;
+	printk("locks held by %s/%d: %d, %s CPU#%d%s\n",
+		p->comm, task_pid_nr(p), depth,
+		task_is_running(p) ? "last" : "on", task_cpu(p),
+		depth > 0 ? ":" : "");
+
 	for (i = 0; i < depth; i++) {
 		printk(" #%d: ", i);
 		print_lock(p->held_locks + i);
