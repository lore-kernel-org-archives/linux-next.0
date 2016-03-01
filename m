From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: [PATCH] objtool: Disable stack validation when CROSS_COMPILE is used
Date: Tue, 1 Mar 2016 15:54:51 -0600
Message-ID: <20160301215451.GC4852@treble.redhat.com>
References: <20160301122910.74ff0a92@canb.auug.org.au>
 <20160301070750.GA6636@gmail.com>
 <20160301204001.5594bed3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:44412 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751959AbcCAVyz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Mar 2016 16:54:55 -0500
Content-Disposition: inline
In-Reply-To: <20160301204001.5594bed3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Mar 01, 2016 at 08:40:01PM +1100, Stephen Rothwell wrote:
> Hi Ingo,
> 
> On Tue, 1 Mar 2016 08:07:50 +0100 Ingo Molnar <mingo@kernel.org> wrote:
> >
> > > This build is done with a PowerPC hosted cross compiler with no glibc.  
> > 
> > Ugh, what a rare and weird way to build an x86 kernel, and you made linux-next 
> > dependent on it?
> 
> It is just the fastest hardware I currently have access to (you remember
> who I work for, right? ;-)).  I have always done at least part of the
> linux-next building (daily, or overnight) on PowerPC hardware and this
> is only the 2nd or third time in over 8 years that it has found an
> issue like this.
> 
> > > I assume that some things here need to be built with HOSTCC?  
> > 
> > I suspect that's the culprit.
> 
> Good, hopefully it is not too hard to fix.

Changing it to use the host compiler would probably be an easy fix, but
that would expose a harder bug related to endianness.

objtool uses the kernel x86 decoder (arch/x86/lib/insn.c) which is
endian-ignorant.  If it tries to analyze reverse endian binaries it gets
confused.  And since CONFIG_STACK_VALIDATION causes objtool to analyze
every .o file in the build, it'll spit out a ton of false warnings.

How about the below workaround patch to disable objtool and warn when
CROSS_COMPILE is used?  If anybody complains about lack of cross-compile
support later, we could try to fix it then.


>From a3c65947011a420743f308b698171c4209105d3f Mon Sep 17 00:00:00 2001
Message-Id: <a3c65947011a420743f308b698171c4209105d3f.1456868910.git.jpoimboe@redhat.com>
From: Josh Poimboeuf <jpoimboe@redhat.com>
Date: Tue, 1 Mar 2016 13:35:51 -0600
Subject: [PATCH] objtool: Disable stack validation when CROSS_COMPILE is used

When building with CONFIG_STACK_VALIDATION on a PowerPC host using an
x86 cross-compiler, Stephen Rothwell saw the following objtool build
errors:

    DESCEND  objtool
    CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/builtin-check.o
    CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/special.o
    CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/elf.o
    CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/objtool.o
    MKDIR    /home/sfr/next/x86_64_allmodconfig/tools/objtool/arch/x86/insn/
    CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/libstring.o
  elf.c:22:23: fatal error: sys/types.h: No such file or directory
  compilation terminated.
    CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/exec-cmd.o
    CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/help.o
  builtin-check.c:28:20: fatal error: string.h: No such file or directory
  compilation terminated.
  objtool.c:28:19: fatal error: stdio.h: No such file or directory
  compilation terminated.

The problem is that objtool was compiled with the cross compiler instead
of the host compiler.  But even if that were fixed, we'd still have a
problem with endianness.  objtool's x86 decoder (copied from
arch/x86/lib/insn.c) assumes that the endianness of the host and target
are the same.  When analyzing a little-endian x86 binary on a big-endian
host, it will get confused and spit out a bunch of false positive
warnings during the build.

Eventually we may want to add endian awareness to x86 objtool, but
that's generally a rare edge case and it's not clear if anybody would
use it.  For now, when a cross-compiler is used, just disable
CONFIG_STACK_VALIDATION and emit a warning.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
---
 Makefile               | 12 +++++++++++-
 scripts/Makefile.build |  4 +++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 8cc926f..b59007c 100644
--- a/Makefile
+++ b/Makefile
@@ -998,8 +998,18 @@ prepare0: archprepare FORCE
 # All the preparing..
 prepare: prepare0 prepare-objtool
 
+
+ifdef CONFIG_STACK_VALIDATION
+  ifeq ($(CROSS_COMPILE),)
+    objtool_target := tools/objtool FORCE
+  else
+    $(warning Stack validation is not supported with cross-compilation.  Disabling CONFIG_STACK_VALIDATION!)
+  endif
+endif
+
 PHONY += prepare-objtool
-prepare-objtool: $(if $(CONFIG_STACK_VALIDATION), tools/objtool FORCE)
+prepare-objtool: $(objtool_target)
+
 
 # Generate some files
 # ---------------------------------------------------------------------------
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 130a452..973bb26 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -242,6 +242,7 @@ cmd_record_mcount =						\
 endif
 
 ifdef CONFIG_STACK_VALIDATION
+ifeq ($(CROSS_COMPILE),)
 
 __objtool_obj := $(objtree)/tools/objtool/objtool
 
@@ -260,13 +261,14 @@ objtool_obj = $(if $(patsubst y%,, \
 	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n), \
 	$(__objtool_obj))
 
+endif # CROSS_COMPILE
 endif # CONFIG_STACK_VALIDATION
 
 define rule_cc_o_c
 	$(call echo-cmd,checksrc) $(cmd_checksrc)			  \
 	$(call echo-cmd,cc_o_c) $(cmd_cc_o_c);				  \
 	$(cmd_modversions)						  \
-	$(cmd_objtool)						  \
+	$(cmd_objtool)							  \
 	$(call echo-cmd,record_mcount)					  \
 	$(cmd_record_mcount)						  \
 	scripts/basic/fixdep $(depfile) $@ '$(call make-cmd,cc_o_c)' >    \
-- 
2.4.3
