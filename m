From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Tue, 18 Apr 2017 18:09:03 +1000
Message-ID: <20170418180903.10300fd3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Laura Abbott <labbott@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the akpm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

arch/x86/kernel/kprobes/opt.c: In function 'arch_prepare_optimized_kprobe':
arch/x86/kernel/kprobes/opt.c:357:2: error: implicit declaration of function 'set_memory_rw' [-Werror=implicit-function-declaration]
  set_memory_rw((unsigned long)buf & PAGE_MASK, 1);
  ^
arch/x86/kernel/kprobes/opt.c:380:2: error: implicit declaration of function 'set_memory_ro' [-Werror=implicit-function-declaration]
  set_memory_ro((unsigned long)buf & PAGE_MASK, 1);
  ^
arch/x86/kernel/kprobes/core.c: In function 'arch_copy_kprobe':
arch/x86/kernel/kprobes/core.c:424:2: error: implicit declaration of function 'set_memory_rw' [-Werror=implicit-function-declaration]
  set_memory_rw((unsigned long)p->ainsn.insn & PAGE_MASK, 1);
  ^
arch/x86/kernel/kprobes/core.c:437:2: error: implicit declaration of function 'set_memory_ro' [-Werror=implicit-function-declaration]
  set_memory_ro((unsigned long)p->ainsn.insn & PAGE_MASK, 1);
  ^

Probably caused by commit

  f276e80d1e7b ("treewide: decouple cacheflush.h and set_memory.h")

interacting with commit

  d0381c81c2f7 ("kprobes/x86: Set kprobes pages read-only")

from the tip tree.

I applied this merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 18 Apr 2017 17:59:09 +1000
Subject: [PATCH] kprobes/x86: merge fix for set_memory.h decoupling

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/kernel/kprobes/core.c | 1 +
 arch/x86/kernel/kprobes/opt.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/core.c
index 19e1f2a6d7b0..5b2bbfbb3712 100644
--- a/arch/x86/kernel/kprobes/core.c
+++ b/arch/x86/kernel/kprobes/core.c
@@ -61,6 +61,7 @@
 #include <asm/alternative.h>
 #include <asm/insn.h>
 #include <asm/debugreg.h>
+#include <asm/set_memory.h>
 
 #include "common.h"
 
diff --git a/arch/x86/kernel/kprobes/opt.c b/arch/x86/kernel/kprobes/opt.c
index 9aadff3d0902..901c640d152f 100644
--- a/arch/x86/kernel/kprobes/opt.c
+++ b/arch/x86/kernel/kprobes/opt.c
@@ -37,6 +37,7 @@
 #include <asm/alternative.h>
 #include <asm/insn.h>
 #include <asm/debugreg.h>
+#include <asm/set_memory.h>
 
 #include "common.h"
 
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
