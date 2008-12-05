From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: "aio: make the lookup_ioctx() lockless" causes s390 build bug
Date: Fri, 5 Dec 2008 23:06:35 +0100
Message-ID: <20081205220634.GR18255@kernel.dk>
References: <20081205164155.GC4491@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([93.163.65.50]:25320 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753076AbYLEWGm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 5 Dec 2008 17:06:42 -0500
Content-Disposition: inline
In-Reply-To: <20081205164155.GC4491@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Fri, Dec 05 2008, Heiko Carstens wrote:
> Hi Jens,
> 
> your patch "aio: make the lookup_ioctx() lockless" in linux-next
> causes this build bug on s390:
> 
> arch/s390/mm/pgtable.c: In function 's390_enable_sie':
> arch/s390/mm/pgtable.c:266: error: invalid operands to binary || (have 'int' and 'struct hlist_head')
> arch/s390/mm/pgtable.c:282: error: invalid operands to binary || (have 'int' and 'struct hlist_head')
> make[1]: *** [arch/s390/mm/pgtable.o] Error 1
> make: *** [arch/s390/mm] Error 2
> 
> Could you please fix that? Thanks! ;)

Something like this?

diff --git a/arch/s390/mm/pgtable.c b/arch/s390/mm/pgtable.c
index ef3635b..0767827 100644
--- a/arch/s390/mm/pgtable.c
+++ b/arch/s390/mm/pgtable.c
@@ -263,7 +263,7 @@ int s390_enable_sie(void)
 	/* lets check if we are allowed to replace the mm */
 	task_lock(tsk);
 	if (!tsk->mm || atomic_read(&tsk->mm->mm_users) > 1 ||
-	    tsk->mm != tsk->active_mm || tsk->mm->ioctx_list) {
+	    tsk->mm != tsk->active_mm || !hlist_empty(&tsk->mm->ioctx_list)) {
 		task_unlock(tsk);
 		return -EINVAL;
 	}
@@ -279,7 +279,7 @@ int s390_enable_sie(void)
 	/* Now lets check again if something happened */
 	task_lock(tsk);
 	if (!tsk->mm || atomic_read(&tsk->mm->mm_users) > 1 ||
-	    tsk->mm != tsk->active_mm || tsk->mm->ioctx_list) {
+	    tsk->mm != tsk->active_mm || !hlist_empty(&tsk->mm->ioctx_list)) {
 		mmput(mm);
 		task_unlock(tsk);
 		return -EINVAL;

-- 
Jens Axboe
