From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Date: Fri, 27 May 2016 12:53:15 -0700
Message-ID: <20160527125315.236cb2957320aea0641dc6d5@linux-foundation.org>
References: <20160527130710.04d4d859@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:43847 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753205AbcE0TxQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 27 May 2016 15:53:16 -0400
In-Reply-To: <20160527130710.04d4d859@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.com>

On Fri, 27 May 2016 13:07:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> mm/oom_kill.c: In function '__oom_reap_task':
> mm/oom_kill.c:537:2: warning: 'mm' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   mmput_async(mm);
>   ^
> 
> Introduced by commit
> 
>   df1e2f56632d ("oom_reaper: close race with exiting task")
> 
> This is real - the first "goto unlock_oom" is before "mm" has been
> assigned.

Yup, thanks.

From: Andrew Morton <akpm@linux-foundation.org>
Subject: oom_reaper-close-race-with-exiting-task-fix

fix use of unused `mm', Per Stephen

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 mm/oom_kill.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff -puN mm/oom_kill.c~oom_reaper-close-race-with-exiting-task-fix mm/oom_kill.c
--- a/mm/oom_kill.c~oom_reaper-close-race-with-exiting-task-fix
+++ a/mm/oom_kill.c
@@ -443,7 +443,7 @@ static bool __oom_reap_task(struct task_
 {
 	struct mmu_gather tlb;
 	struct vm_area_struct *vma;
-	struct mm_struct *mm;
+	struct mm_struct *mm = NULL;
 	struct task_struct *p;
 	struct zap_details details = {.check_swap_entries = true,
 				      .ignore_dirty = true};
@@ -534,7 +534,8 @@ unlock_oom:
 	 * different context because we shouldn't risk we get stuck there and
 	 * put the oom_reaper out of the way.
 	 */
-	mmput_async(mm);
+	if (mm)
+		mmput_async(mm);
 	return ret;
 }
 
_
