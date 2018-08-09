From: Joerg Roedel <jroedel@suse.de>
Subject: [PATCH] x86, relocs: Add __end_rodata_aligned to S_REL
Date: Thu, 9 Aug 2018 11:44:49 +0200
Message-ID: <20180809094449.ddmnrkz7qkvo3j2x@suse.de>
References: <20180809092420.094e8722@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180809092420.094e8722@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

This new symbol needs to be in the workaround-list for buggy
binutils, otherwise the build with gcc-4.6 fails.

Fixes: 39d668e04eda ('x86/mm/pti: Make pti_clone_kernel_text() compile on 32 bit')
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/tools/relocs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
index 220e97841e49..3a6c8ebc8032 100644
--- a/arch/x86/tools/relocs.c
+++ b/arch/x86/tools/relocs.c
@@ -67,6 +67,7 @@ static const char * const sym_regex_kernel[S_NSYMTYPES] = {
 	"__tracedata_(start|end)|"
 	"__(start|stop)_notes|"
 	"__end_rodata|"
+	"__end_rodata_aligned|"
 	"__initramfs_start|"
 	"(jiffies|jiffies_64)|"
 #if ELF_BITS == 64
-- 
2.16.4
