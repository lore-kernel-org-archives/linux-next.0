From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -mmotm] kernel: fix synchro-test.c printk format warrnings
Date: Sun, 14 Oct 2012 18:24:09 -0700
Message-ID: <507B65B9.4080603@xenotime.net>
References: <20121011231551.641101E0048@wpzn4.hot.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy11-pub.bluehost.com ([173.254.64.10]:55330 "HELO
	oproxy11-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752555Ab2JOBYR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 14 Oct 2012 21:24:17 -0400
In-Reply-To: <20121011231551.641101E0048@wpzn4.hot.corp.google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, David Howells <dhowells@redhat.com>

From: Randy Dunlap <rdunlap@xenotime.net>

Fix printk format warnings in kernel/synchro-test.c.
Fixes warnings on i386 and on x86_64.

kernel/synchro-test.c:432:4: warning: format '%u' expects type 'unsigned int', but argument 5 has type 'long unsigned int'
kernel/synchro-test.c:437:4: warning: format '%u' expects type 'unsigned int', but argument 5 has type 'long unsigned int'
kernel/synchro-test.c:442:4: warning: format '%u' expects type 'unsigned int', but argument 5 has type 'long unsigned int'
kernel/synchro-test.c:447:4: warning: format '%u' expects type 'unsigned int', but argument 5 has type 'long unsigned int'
kernel/synchro-test.c:452:4: warning: format '%u' expects type 'unsigned int', but argument 5 has type 'long unsigned int'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---
 kernel/synchro-test.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

--- mmotm-2012-1011-1614.orig/kernel/synchro-test.c
+++ mmotm-2012-1011-1614/kernel/synchro-test.c
@@ -429,27 +429,27 @@ static int __init do_tests(void)
 	for (loop = 0; loop < MAX_THREADS; loop++) {
 		if (loop < nummx) {
 			init_completion(&mx_comp[loop]);
-			kthread_run(mutexer, (void *) loop, "Mutex%u", loop);
+			kthread_run(mutexer, (void *) loop, "Mutex%lu", loop);
 		}
 
 		if (loop < numsm) {
 			init_completion(&sm_comp[loop]);
-			kthread_run(semaphorer, (void *) loop, "Sem%u", loop);
+			kthread_run(semaphorer, (void *) loop, "Sem%lu", loop);
 		}
 
 		if (loop < numrd) {
 			init_completion(&rd_comp[loop]);
-			kthread_run(reader, (void *) loop, "Read%u", loop);
+			kthread_run(reader, (void *) loop, "Read%lu", loop);
 		}
 
 		if (loop < numwr) {
 			init_completion(&wr_comp[loop]);
-			kthread_run(writer, (void *) loop, "Write%u", loop);
+			kthread_run(writer, (void *) loop, "Write%lu", loop);
 		}
 
 		if (loop < numdg) {
 			init_completion(&dg_comp[loop]);
-			kthread_run(downgrader, (void *) loop, "Down%u", loop);
+			kthread_run(downgrader, (void *) loop, "Down%lu", loop);
 		}
 	}
 
