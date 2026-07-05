Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE93C433E71;
	Sun,  5 Jul 2026 09:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783242319; cv=none; b=qHEUw5wT8651nAJpd/maDbsviyiesSAf/1T38NwjbIqQZ0S4XAc97ISOok6epiqmGbo1Fn8LbcuxT+KEDyINmqiDQuEJ5rOW2WzbZu0XmVfPRd8rChNkdG8Rp18BRO8AnfRuKAycbHSwDKOB4ANXVc9arG2ueixF5em5kLjhglk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783242319; c=relaxed/simple;
	bh=pNuDos5I5fLSDW9XCXqnE+oIoJcIOW5RDeYzfMUGYBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KuNcKD20Fruu1vCRnSSUHNkaFqlhtO9n4AfNixuXwYwcxgM/YIEJqU021UucgwqkCpr+6Yz5HaYb0czYV50dPdDCQWKXnHuc+ezBs1dnhBT3L+86/ckBy39dQ02/TkZLRORoOC8Fyi0MkkwR/H/l0fXyIZYuFPssuPmODVa6sVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lINBg5Yf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lINBg5Yf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813DD1F000E9;
	Sun,  5 Jul 2026 09:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783242317;
	bh=Q1uwX2CCH23j61cxsQUqisGndP6n0wqEUns1uFOJEOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lINBg5YfKlYX7guENSzE/n2B07IIAlKB0NVOqZYvAFMVGOMQNks7B9t4XmnQ/ZnEP
	 ffDvWj8NrE0ML1T2eMYUhLXFCXW5GLznLIyGFTibPNvn2ZWpiA+GZ0k4qOYCRDqaMD
	 5DM5rjHdqRCH1fuTxIy5bOu7YomSr2ajBwEJk/LdwXJr0z6WnDoY1Fc0ZiffEFZzk8
	 RGp8o9i/cNK2kZAetwq73/YS6/ttFoeV0bLcohpgJG43tg+oHb8j+x256gFdvKB+hy
	 P4Ukm0FeSafW8bAIoQoTmuLsnjoIY6RYlpk5DmyAitdQVE6iGxHs9UWF0sG4Bbj7Bh
	 ZFTPIzbC915sg==
Date: Sun, 5 Jul 2026 11:05:12 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	peterz@infradead.org, will@kernel.org, longman@redhat.com,
	gregkh@linuxfoundation.org
Subject: [PATCH] lockdep: Enable the printing of held locks of running
 non-current tasks  (was: Policy regarding linux-next only changes)
Message-ID: <akoeSIQGwqd9cZwd@gmail.com>
References: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net>
 <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>
 <akZxfzEtam8yPXEh@MacBook-0RXW5>
 <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>


* Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp> wrote:

> On 2026/07/02 23:11, Boqun Feng wrote:
> >>> While testing lockdep changes on linux-next, I found there is a commit
> >>> ca65ccfdc5b3 ("locking/lockdep: make lockdep_print_held_locks() always print if
> >>> CONFIG_DEBUG_AID_FOR_SYZBOT=y") applied to lockdep. Checking the history it
> >>> looks like this commit has been in linux-next for quite a while (at least 2
> >>> months); there were no emails on LKML about this commit at all.

Yeah, so while it's still true that printing out their held locks
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

The (lightly tested) patch below implements this.

Note that this way there's no need to gate this on the Syzkaller
config option, and you wouldn't have to carry it in -next either,
it's a useful mainline kernel debuggability enhancement in its
own right.

Would this work for you?

Thanks,

	Ingo

=================>
From: Ingo Molnar <mingo@kernel.org>
Date: Sun, 5 Jul 2026 10:38:06 +0200
Subject: [PATCH] lockdep: Enable the printing of held locks of running non-current tasks

Currently lockdep does not print out the held locks of non-current
tasks that are running (on some other CPU), due to the fact that
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

This commit implements that change.

For running tasks, the printout adds a warning about the
fact that the task is running and that the held locks array
is in flux:

  5 locks held by bash/1234 (WARNING: task running):
  ...

Note that while re-flowing the function this change also
micro-optimizes the common !depth case, which unnecessarily
ran through the runnability check and the (zero-steps) loop.

Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 kernel/locking/lockdep.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 2d4c5bab5af8..4b193bdc8552 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -786,18 +786,23 @@ static void print_lock(struct held_lock *hlock)
 static void lockdep_print_held_locks(struct task_struct *p)
 {
 	int i, depth = READ_ONCE(p->lockdep_depth);
+	const char *msg_running = "";
 
-	if (!depth)
+	if (!depth) {
 		printk("no locks held by %s/%d.\n", p->comm, task_pid_nr(p));
-	else
-		printk("%d lock%s held by %s/%d:\n", depth,
-		       str_plural(depth), p->comm, task_pid_nr(p));
+		return;
+	}
+
 	/*
-	 * It's not reliable to print a task's held locks if it's not sleeping
-	 * and it's not the current task.
+	 * It's not reliable to print a task's held locks if it's not
+	 * sleeping and it's not the current task:
 	 */
 	if (p != current && task_is_running(p))
-		return;
+		msg_running = " (WARNING: task running)";
+
+	printk("%d lock%s held by %s/%d%s:\n", depth,
+	       str_plural(depth), p->comm, task_pid_nr(p), msg_running);
+
 	for (i = 0; i < depth; i++) {
 		printk(" #%d: ", i);
 		print_lock(p->held_locks + i);
