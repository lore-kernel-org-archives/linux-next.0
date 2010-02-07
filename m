From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] sched: Fix unused variable warning on UP (was: Re:
	linux-next: tip tree build warning)
Date: Sun, 7 Feb 2010 20:57:14 +0100
Message-ID: <10f740e81002071157p11b78784i8091d4790c29f30d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ww0-f46.google.com ([74.125.82.46]:42865 "EHLO
	mail-ww0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753274Ab0BGT5Q (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 7 Feb 2010 14:57:16 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Mon, Feb 1, 2010 at 08:12, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next build (powerpc allnoconfig) produced this warning:
>
> kernel/sched.c: In function 'wake_up_new_task':
> kernel/sched.c:2631: warning: unused variable 'cpu'
>
> Introduced by commit fabf318e5e4bda0aca2b0d617b191884fda62703 ("sched:
> Fix fork vs hotplug vs cpuset namespaces").

And now we have it in 2.6.33-rc7, too...
Patch below (FWIW, compile-tested on m68k with CONFIG_SMP=n only).

---
>From cbf4f334632ade9c5ed9b88728ec82af074e4ace Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 7 Feb 2010 20:47:30 +0100
Subject: [PATCH] sched: Fix unused variable warning on UP

Fix warning

| kernel/sched.c:2650: warning: unused variable 'cpu'

if CONFIG_SMP is not set.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 kernel/sched.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/kernel/sched.c b/kernel/sched.c
index 3a8fb30..c47561e 100644
--- a/kernel/sched.c
+++ b/kernel/sched.c
@@ -2647,9 +2647,10 @@ void wake_up_new_task(struct task_struct *p,
unsigned long clone_flags)
 {
 	unsigned long flags;
 	struct rq *rq;
-	int cpu = get_cpu();

 #ifdef CONFIG_SMP
+	int cpu = get_cpu();
+
 	/*
 	 * Fork balancing, do it here and not earlier because:
 	 *  - cpus_allowed can change in the fork path
-- 
1.6.0.4

-- 
Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
