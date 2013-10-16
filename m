From: Thierry Reding <thierry.reding@gmail.com>
Subject: linux-next: manual merge of the tip tree
Date: Wed, 16 Oct 2013 20:51:39 +0200
Message-ID: <1381949500-501-2-git-send-email-treding@nvidia.com>
References: <1381949500-501-1-git-send-email-treding@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1381949500-501-1-git-send-email-treding@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shaohua Li <shli@kernel.org>, NeilBrown <neilb@suse.de>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Today's linux-next merge of the tip tree got a conflict in

	include/linux/wait.h

caused by commits 1ab2460 (wait: add wait_event_cmd()) and fb869b6
(sched/wait: Clean up wait.h details a bit).

I've cleaned it up (see below). Please verify that the resolution looks
good.

Thanks,
Thierry
---
diff --cc include/linux/wait.h
index d9eff54,a2726c7..0395985
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@@ -253,59 -275,9 +275,45 @@@ do {									
  	__ret;								\
  })
  
 +#define __wait_event_cmd(wq, condition, cmd1, cmd2)			\
 +do {									\
 +	DEFINE_WAIT(__wait);						\
 +									\
 +	for (;;) {							\
 +		prepare_to_wait(&wq, &__wait, TASK_UNINTERRUPTIBLE);	\
 +		if (condition)						\
 +			break;						\
 +		cmd1;							\
 +		schedule();						\
 +		cmd2;							\
 +	}								\
 +	finish_wait(&wq, &__wait);					\
 +} while (0)
 +
 +/**
 + * wait_event_cmd - sleep until a condition gets true
 + * @wq: the waitqueue to wait on
 + * @condition: a C expression for the event to wait for
 + * cmd1: the command will be executed before sleep
 + * cmd2: the command will be executed after sleep
 + *
 + * The process is put to sleep (TASK_UNINTERRUPTIBLE) until the
 + * @condition evaluates to true. The @condition is checked each time
 + * the waitqueue @wq is woken up.
 + *
 + * wake_up() has to be called after changing any variable that could
 + * change the result of the wait condition.
 + */
 +#define wait_event_cmd(wq, condition, cmd1, cmd2)			\
 +do {									\
 +	if (condition)							\
 +		break;							\
 +	__wait_event_cmd(wq, condition, cmd1, cmd2);			\
 +} while (0)
 +
- #define __wait_event_interruptible(wq, condition, ret)			\
- do {									\
- 	DEFINE_WAIT(__wait);						\
- 									\
- 	for (;;) {							\
- 		prepare_to_wait(&wq, &__wait, TASK_INTERRUPTIBLE);	\
- 		if (condition)						\
- 			break;						\
- 		if (!signal_pending(current)) {				\
- 			schedule();					\
- 			continue;					\
- 		}							\
- 		ret = -ERESTARTSYS;					\
- 		break;							\
- 	}								\
- 	finish_wait(&wq, &__wait);					\
- } while (0)
+ #define __wait_event_interruptible(wq, condition)			\
+ 	___wait_event(wq, condition, TASK_INTERRUPTIBLE, 0, 0,		\
+ 		      schedule())
  
  /**
   * wait_event_interruptible - sleep until a condition gets true
