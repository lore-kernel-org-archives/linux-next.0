From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: stackprotector tree build failure
Date: Wed, 22 Oct 2008 13:11:24 +1100
Message-ID: <20081022131124.a572b11f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37582 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751074AbYJVCLx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Oct 2008 22:11:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org

Hi all,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

kernel/fork.c: In function 'copy_process':
kernel/fork.c:1026: error: 'struct task_struct' has no member named 'default_timer_slack_ns'
kernel/fork.c:1026: error: 'struct task_struct' has no member named 'timer_slack_ns'

Caused by commit 929c12f25feeec881fd67eaa9b551f98588a2931 ("manual merge
of stackprotector") which introduced the above line.

I applied the following patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 22 Oct 2008 13:09:17 +1100
Subject: [PATCH] stackprotector: fix up bad merge

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/fork.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 194dc04..3bc1f86 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1023,8 +1023,6 @@ static struct task_struct *copy_process(unsigned long clone_flags,
 	p->prev_utime = cputime_zero;
 	p->prev_stime = cputime_zero;
 
-	p->default_timer_slack_ns = current->timer_slack_ns;
-
 #ifdef CONFIG_DETECT_SOFTLOCKUP
 	p->last_switch_count = 0;
 	p->last_switch_timestamp = 0;
-- 
1.5.6.5
