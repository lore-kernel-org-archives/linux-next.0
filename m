From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Wed, 2 Mar 2016 16:40:36 +1100
Message-ID: <20160302164036.37dfb79a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52710 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750851AbcCBFkj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Mar 2016 00:40:39 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, Josh Poimboeuf <jpoimboe@redhat.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got conflicts in:

  arch/x86/boot/Makefile
  arch/x86/boot/compressed/Makefile
  arch/x86/entry/vdso/Makefile
  arch/x86/kernel/Makefile
  arch/x86/realmode/rm/Makefile
  drivers/firmware/efi/libstub/Makefile

between commit:

  c0dd671686b2 ("objtool: Mark non-standard object files and directories")

from the tip tree and commit:

  9b1ad289b5e5 ("kernel: add kcov code coverage")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc arch/x86/boot/Makefile
index 0bf6749522d9,5f93ca072b21..000000000000
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@@ -9,8 -9,13 +9,14 @@@
  # Changed by many, many contributors over the years.
  #
  
 -KASAN_SANITIZE := n
 +KASAN_SANITIZE			:= n
 +OBJECT_FILES_NON_STANDARD	:= y
+ # Kernel does not boot with kcov instrumentation here.
+ # One of the problems observed was insertion of __sanitizer_cov_trace_pc()
+ # callback into middle of per-cpu data enabling code. Thus the callback observed
+ # inconsistent state and crashed. We are interested mostly in syscall coverage,
+ # so boot code is not interesting anyway.
+ KCOV_INSTRUMENT := n
  
  # If you want to preset the SVGA mode, uncomment the next line and
  # set SVGA_MODE to whatever number you want.
diff --cc arch/x86/boot/compressed/Makefile
index 5e1d26e09407,ad9e9fa5bb11..000000000000
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@@ -16,8 -16,9 +16,10 @@@
  #	(see scripts/Makefile.lib size_append)
  #	compressed vmlinux.bin.all + u32 size of vmlinux.bin.all
  
 -KASAN_SANITIZE := n
 +KASAN_SANITIZE			:= n
 +OBJECT_FILES_NON_STANDARD	:= y
+ # Prevents link failures: __sanitizer_cov_trace_pc() is not linked in.
+ KCOV_INSTRUMENT := n
  
  targets := vmlinux vmlinux.bin vmlinux.bin.gz vmlinux.bin.bz2 vmlinux.bin.lzma \
  	vmlinux.bin.xz vmlinux.bin.lzo vmlinux.bin.lz4
diff --cc arch/x86/entry/vdso/Makefile
index f9fb859c98b9,5a1993905ace..000000000000
--- a/arch/x86/entry/vdso/Makefile
+++ b/arch/x86/entry/vdso/Makefile
@@@ -3,9 -3,10 +3,11 @@@
  #
  
  KBUILD_CFLAGS += $(DISABLE_LTO)
 -KASAN_SANITIZE := n
 -UBSAN_SANITIZE := n
 +KASAN_SANITIZE			:= n
 +UBSAN_SANITIZE			:= n
 +OBJECT_FILES_NON_STANDARD	:= y
+ # Prevents link failures: __sanitizer_cov_trace_pc() is not linked in.
+ KCOV_INSTRUMENT := n
  
  VDSO64-$(CONFIG_X86_64)		:= y
  VDSOX32-$(CONFIG_X86_X32_ABI)	:= y
diff --cc arch/x86/kernel/Makefile
index d5fb0871aba3,4648960d1c4c..000000000000
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@@ -16,14 -16,14 +16,19 @@@ CFLAGS_REMOVE_ftrace.o = -p
  CFLAGS_REMOVE_early_printk.o = -pg
  endif
  
 -KASAN_SANITIZE_head$(BITS).o := n
 -KASAN_SANITIZE_dumpstack.o := n
 -KASAN_SANITIZE_dumpstack_$(BITS).o := n
 +KASAN_SANITIZE_head$(BITS).o				:= n
 +KASAN_SANITIZE_dumpstack.o				:= n
 +KASAN_SANITIZE_dumpstack_$(BITS).o			:= n
 +
 +OBJECT_FILES_NON_STANDARD_head_$(BITS).o		:= y
 +OBJECT_FILES_NON_STANDARD_relocate_kernel_$(BITS).o	:= y
 +OBJECT_FILES_NON_STANDARD_mcount_$(BITS).o		:= y
 +OBJECT_FILES_NON_STANDARD_test_nx.o			:= y
+ # If instrumentation of this dir is enabled, boot hangs during first second.
+ # Probably could be more selective here, but note that files related to irqs,
+ # boot, dumpstack/stacktrace, etc are either non-interesting or can lead to
+ # non-deterministic coverage.
+ KCOV_INSTRUMENT := n
  
  CFLAGS_irq.o := -I$(src)/../include/asm/trace
  
diff --cc arch/x86/realmode/rm/Makefile
index 053abe7b0ef7,35129dcdeb71..000000000000
--- a/arch/x86/realmode/rm/Makefile
+++ b/arch/x86/realmode/rm/Makefile
@@@ -6,8 -6,9 +6,10 @@@
  # for more details.
  #
  #
 -KASAN_SANITIZE := n
 +KASAN_SANITIZE			:= n
 +OBJECT_FILES_NON_STANDARD	:= y
+ # Prevents link failures: __sanitizer_cov_trace_pc() is not linked in.
+ KCOV_INSTRUMENT := n
  
  always := realmode.bin realmode.relocs
  
diff --cc drivers/firmware/efi/libstub/Makefile
index a15841eced4e,37cc9e395edb..000000000000
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@@ -23,7 -23,8 +23,9 @@@ KBUILD_CFLAGS			:= $(cflags-y) -DDISABL
  GCOV_PROFILE			:= n
  KASAN_SANITIZE			:= n
  UBSAN_SANITIZE			:= n
 +OBJECT_FILES_NON_STANDARD	:= y
+ # Prevents link failures: __sanitizer_cov_trace_pc() is not linked in.
+ KCOV_INSTRUMENT			:= n
  
  lib-y				:= efi-stub-helper.o
  
