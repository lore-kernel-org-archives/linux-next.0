From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] fork and exit: need to include iocontext.h
Date: Mon, 30 Jun 2008 10:54:58 -0700
Message-ID: <20080630105458.7c95e195.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from agminet01.oracle.com ([141.146.126.228]:16881 "EHLO
	agminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751673AbYF3R5G (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 30 Jun 2008 13:57:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: lkml <linux-kernel@vger.kernel.org>, mingo <mingo@redhat.com>, tglx <tglx@linutronix.de>, hpa <hpa@zytor.com>, akpm <akpm@linux-foundation.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix fork and exit build errors: they need to include iocontext.h:

linux-next-20080630/kernel/fork.c: In function 'copy_process':
linux-next-20080630/kernel/fork.c:1237: error: implicit declaration of function 'put_io_context'
linux-next-20080630/kernel/exit.c: In function 'do_exit':
linux-next-20080630/kernel/exit.c:992: error: implicit declaration of function 'exit_io_context'


Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 kernel/exit.c |    1 +
 kernel/fork.c |    1 +
 2 files changed, 2 insertions(+)

--- linux-next-20080630.orig/kernel/fork.c
+++ linux-next-20080630/kernel/fork.c
@@ -23,6 +23,7 @@
 #include <linux/sem.h>
 #include <linux/file.h>
 #include <linux/fdtable.h>
+#include <linux/iocontext.h>
 #include <linux/key.h>
 #include <linux/binfmts.h>
 #include <linux/mman.h>
--- linux-next-20080630.orig/kernel/exit.c
+++ linux-next-20080630/kernel/exit.c
@@ -13,6 +13,7 @@
 #include <linux/personality.h>
 #include <linux/tty.h>
 #include <linux/mnt_namespace.h>
+#include <linux/iocontext.h>
 #include <linux/key.h>
 #include <linux/security.h>
 #include <linux/cpu.h>


---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
