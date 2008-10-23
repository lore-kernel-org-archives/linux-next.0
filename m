From: Paul Mundt <lethal@linux-sh.org>
Subject: [PATCH -next] ftrace: rename FTRACE to FUNCTION_TRACER more successfully.
Date: Thu, 23 Oct 2008 14:46:14 +0900
Message-ID: <20081023054614.GA21690@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mta23.gyao.ne.jp ([125.63.38.249]:59966 "EHLO mx.gate01.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752357AbYJWFql (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Oct 2008 01:46:41 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <srostedt@redhat.com>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org

The ftrace tree has conveniently renamed this out from underneath us, as
the ftrace people appear to have been unsuccessful in their endeavour to
grep linux-next or wait for the merge window to close before making the
rather dubious decision that renaming config options was a good idea.

Signed-off-by: Paul Mundt <lethal@linux-sh.org>

---

 arch/sh/Kconfig                     |    2 +-
 arch/sh/boot/compressed/Makefile_32 |    2 +-
 arch/sh/kernel/entry-common.S       |    4 ++--
 arch/sh/kernel/sh_ksyms_32.c        |    2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index cb2c87d..01079d2 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -24,7 +24,7 @@ config SUPERH32
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
 	select HAVE_ARCH_TRACEHOOK
-	select HAVE_FTRACE
+	select HAVE_FUNCTION_TRACER
 
 config SUPERH64
 	def_bool y if CPU_SH5
diff --git a/arch/sh/boot/compressed/Makefile_32 b/arch/sh/boot/compressed/Makefile_32
index 301e6d5..7d63290 100644
--- a/arch/sh/boot/compressed/Makefile_32
+++ b/arch/sh/boot/compressed/Makefile_32
@@ -23,7 +23,7 @@ IMAGE_OFFSET	:= $(shell /bin/bash -c 'printf "0x%08x" \
 
 LIBGCC	:= $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
 
-ifeq ($(CONFIG_FTRACE),y)
+ifeq ($(CONFIG_FUNCTION_TRACER),y)
 ORIG_CFLAGS := $(KBUILD_CFLAGS)
 KBUILD_CFLAGS = $(subst -pg, , $(ORIG_CFLAGS))
 endif
diff --git a/arch/sh/kernel/entry-common.S b/arch/sh/kernel/entry-common.S
index 1a5cf9d..eedc1eb 100644
--- a/arch/sh/kernel/entry-common.S
+++ b/arch/sh/kernel/entry-common.S
@@ -372,7 +372,7 @@ syscall_exit:
 7:	.long	do_syscall_trace_enter
 8:	.long	do_syscall_trace_leave
 
-#ifdef CONFIG_FTRACE
+#ifdef CONFIG_FUNCTION_TRACER
 	.align 2
 	.globl	_mcount
 	.type	_mcount,@function
@@ -414,4 +414,4 @@ skip_trace:
 ftrace_stub:
 	rts
 	 nop
-#endif /* CONFIG_FTRACE */
+#endif /* CONFIG_FUNCTION_TRACER */
diff --git a/arch/sh/kernel/sh_ksyms_32.c b/arch/sh/kernel/sh_ksyms_32.c
index d366a74..93f3edd 100644
--- a/arch/sh/kernel/sh_ksyms_32.c
+++ b/arch/sh/kernel/sh_ksyms_32.c
@@ -133,7 +133,7 @@ EXPORT_SYMBOL(flush_dcache_page);
 EXPORT_SYMBOL(clear_user_page);
 #endif
 
-#ifdef CONFIG_FTRACE
+#ifdef CONFIG_FUNCTION_TRACER
 EXPORT_SYMBOL(mcount);
 #endif
 EXPORT_SYMBOL(csum_partial);
