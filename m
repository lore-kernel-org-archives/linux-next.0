From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [PATCH -next] sched/wait: fix
 __wait_event_interruptible_lock_irq_timeout()
Date: Thu, 31 Oct 2013 12:48:14 +0100
Message-ID: <20131031114814.GB5551@osiris>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp11.uk.ibm.com ([195.75.94.107]:57115 "EHLO
	e06smtp11.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751734Ab3JaLte (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 31 Oct 2013 07:49:34 -0400
Received: from /spool/local
	by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Thu, 31 Oct 2013 11:49:33 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id E4EA92190068
	for <linux-next@vger.kernel.org>; Thu, 31 Oct 2013 11:49:30 +0000 (GMT)
Received: from d06av12.portsmouth.uk.ibm.com (d06av12.portsmouth.uk.ibm.com [9.149.37.247])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id r9VBm38d59244618
	for <linux-next@vger.kernel.org>; Thu, 31 Oct 2013 11:48:03 GMT
Received: from d06av12.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av12.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id r9VBmE7Y023637
	for <linux-next@vger.kernel.org>; Thu, 31 Oct 2013 05:48:15 -0600
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org

__wait_event_interruptible_lock_irq_timeout() needs the timeout parameter
passed instead of "ret".
This magically compiled since the only user has a local ret variable.
Luckily we got a build warning:

  CC      drivers/s390/scsi/zfcp_qdio.o
drivers/s390/scsi/zfcp_qdio.c: In function 'zfcp_qdio_sbal_get':
include/linux/wait.h:780:15: warning: 'ret' may be used uninitialized
         __ret = schedule_timeout(__ret);   \
               ^
drivers/s390/scsi/zfcp_qdio.c:245:7: note: 'ret' was declared here
  long ret;
       ^
Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---
 include/linux/wait.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/wait.h b/include/linux/wait.h
index fcc968087f05..d3d033ec5313 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -775,7 +775,7 @@ do {									\
 #define __wait_event_interruptible_lock_irq_timeout(wq, condition,	\
 						    lock, timeout)	\
 	___wait_event(wq, ___wait_cond_timeout(condition),		\
-		      TASK_INTERRUPTIBLE, 0, ret,			\
+		      TASK_INTERRUPTIBLE, 0, timeout,			\
 		      spin_unlock_irq(&lock);				\
 		      __ret = schedule_timeout(__ret);			\
 		      spin_lock_irq(&lock));
-- 
1.8.3.4
