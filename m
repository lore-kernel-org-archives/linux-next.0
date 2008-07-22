From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tests tree
Date: Tue, 22 Jul 2008 13:56:42 +1000
Message-ID: <20080722135642.c54172c9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60301 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755871AbYGVD4p (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Jul 2008 23:56:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
Cc: linux-next@vger.kernel.org

Hi Ananth,

Today's linux-next merge of the tests tree got conflicts in
lib/Kconfig.debug against Linus' tree.

I have been carrying the fix to these conflicts for a while but no that
they are in Linus' tree, you should rebase/merge your tree against his
and carefully check/test the results.

My current fixup patch to your tests/Kconfig is below.  It may not be
complete.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --git a/tests/Kconfig b/tests/Kconfig
index fc7e0bd..2432161 100644
--- a/tests/Kconfig
+++ b/tests/Kconfig
@@ -21,16 +21,34 @@ config DEBUG_LOCKING_API_SELFTESTS
 config RCU_TORTURE_TEST
 	tristate "torture tests for RCU"
 	depends on DEBUG_KERNEL
-	depends on m
 	default n
 	help
 	  This option provides a kernel module that runs torture tests
 	  on the RCU infrastructure.  The kernel module may be built
 	  after the fact on the running kernel to be tested, if desired.
 
+	  Say Y here if you want RCU torture tests to be built into
+	  the kernel.
 	  Say M if you want the RCU torture tests to build as a module.
 	  Say N if you are unsure.
 
+config RCU_TORTURE_TEST_RUNNABLE
+	bool "torture tests for RCU runnable by default"
+	depends on RCU_TORTURE_TEST = y
+	default n
+	help
+	  This option provides a way to build the RCU torture tests
+	  directly into the kernel without them starting up at boot
+	  time.  You can use /proc/sys/kernel/rcutorture_runnable
+	  to manually override this setting.  This /proc file is
+	  available only when the RCU torture tests have been built
+	  into the kernel.
+
+	  Say Y here if you want the RCU torture tests to start during
+	  boot (you probably don't).
+	  Say N here if you want the RCU torture tests to start only
+	  after being manually enabled via /proc.
+
 config RT_MUTEX_TESTER
 	bool "Built-in scriptable tester for rt-mutexes"
 	depends on DEBUG_KERNEL && RT_MUTEXES
@@ -75,6 +93,9 @@ config BACKTRACE_SELF_TEST
 	  for distributions or general kernels, but only for kernel
 	  developers working on architecture code.
 
+	  Note that if you want to also test saved backtraces, you will
+	  have to enable STACKTRACE as well.
+
 	  Say N if you are unsure.
 
 endif # KERNEL_TESTS
