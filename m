From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the xen-tip tree
Date: Thu, 31 Aug 2017 15:22:40 +1000
Message-ID: <20170831152240.125004d5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the xen-tip tree, today's linux-next build (x86_64
allmodconfig) failed like this:

arch/x86/xen/xen-asm_64.o: In function `xen_trace_page_fault':
(.text+0x174): undefined reference to `trace_page_fault'

Caused by commit

  ad5b8c4ba323 ("xen: get rid of paravirt op adjust_exception_frame")

interacting with commit

  11a7ffb01703 ("x86/traps: Simplify pagefault tracing logic")

from the tip tree.

I am not sure how to fix up this, so I have just applied the following
patch for today.  A better solution would be appreciated.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 31 Aug 2017 15:06:10 +1000
Subject: [PATCH] xen: fix for "x86/traps: Simplify pagefault tracing logic"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/xen/enlighten_pv.c | 2 +-
 arch/x86/xen/xen-asm_64.S   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index b18d9b9f84c2..6ea983a9016d 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -618,7 +618,7 @@ static struct {
 	{ alignment_check, xen_alignment_check, false },
 	{ simd_coprocessor_error, xen_simd_coprocessor_error, false },
 #ifdef CONFIG_TRACING
-	{ trace_page_fault, xen_trace_page_fault, false },
+//	{ trace_page_fault, xen_trace_page_fault, false },
 #endif
 };
 
diff --git a/arch/x86/xen/xen-asm_64.S b/arch/x86/xen/xen-asm_64.S
index 4ebac091a0e8..1c7a3df3e5a5 100644
--- a/arch/x86/xen/xen-asm_64.S
+++ b/arch/x86/xen/xen-asm_64.S
@@ -52,7 +52,7 @@ xen_pv_trap simd_coprocessor_error
 xen_pv_trap entry_INT80_compat
 #endif
 #ifdef CONFIG_TRACING
-xen_pv_trap trace_page_fault
+/* xen_pv_trap trace_page_fault */
 #endif
 xen_pv_trap hypervisor_callback
 
-- 
2.13.2

-- 
Cheers,
Stephen Rothwell
