From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: [PATCH] objtool: Warn if libelf is missing
Date: Thu,  3 Mar 2016 11:39:30 -0600
Message-ID: <8c27fe00face60f42e888ddb3142c97e45223165.1457026550.git.jpoimboe@redhat.com>
References: <20160303143527.GA2348@treble.redhat.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:39459 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754309AbcCCRki (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Mar 2016 12:40:38 -0500
In-Reply-To: <20160303143527.GA2348@treble.redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux@roeck-us.net, Andrew Morton <akpm@linux-foundation.org>, live-patching@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>

With CONFIG_STACK_VALIDATION enabled, if the host system doesn't have
a development version of libelf installed, the build fails with errors
like:

  elf.h:22:18: fatal error: gelf.h: No such file or directory compilation terminated.

Instead of failing to build, instead just print a warning and disable
stack validation.

Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
---
Based on tip/master.

 Makefile               | 13 ++++++++++++-
 scripts/Makefile.build |  2 ++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 750df29..1fd8328 100644
--- a/Makefile
+++ b/Makefile
@@ -998,8 +998,19 @@ prepare0: archprepare FORCE
 # All the preparing..
 prepare: prepare0 prepare-objtool
 
+ifdef CONFIG_STACK_VALIDATION
+  has_libelf := $(shell echo "int main() {}" | $(HOSTCC) -xc -o /dev/null -lelf - &> /dev/null && echo 1 || echo 0)
+  ifeq ($(has_libelf),1)
+    objtool_target := tools/objtool FORCE
+  else
+    $(warning "Cannot use CONFIG_STACK_VALIDATION, please install libelf-dev or elfutils-libelf-devel")
+    SKIP_STACK_VALIDATION := 1
+    export SKIP_STACK_VALIDATION
+  endif
+endif
+
 PHONY += prepare-objtool
-prepare-objtool: $(if $(CONFIG_STACK_VALIDATION), tools/objtool FORCE)
+prepare-objtool: $(objtool_target)
 
 # Generate some files
 # ---------------------------------------------------------------------------
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 130a452..e1bc190 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -242,6 +242,7 @@ cmd_record_mcount =						\
 endif
 
 ifdef CONFIG_STACK_VALIDATION
+ifneq ($(SKIP_STACK_VALIDATION),1)
 
 __objtool_obj := $(objtree)/tools/objtool/objtool
 
@@ -260,6 +261,7 @@ objtool_obj = $(if $(patsubst y%,, \
 	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n), \
 	$(__objtool_obj))
 
+endif # SKIP_STACK_VALIDATION
 endif # CONFIG_STACK_VALIDATION
 
 define rule_cc_o_c
-- 
2.4.3
