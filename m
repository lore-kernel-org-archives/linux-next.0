From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] x86 mrst: fix build error when X86_MRST is not enabled
Date: Thu, 29 Sep 2011 13:35:16 -0700
Message-ID: <4E84D684.107@xenotime.net>
References: <20110929165730.661cf28c9bb27b8a85432cd2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110929165730.661cf28c9bb27b8a85432cd2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, x86 maintainers <x86@kernel.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <rdunlap@xenotime.net>

Fix build when CONFIG_X86_INTEL_MID is enabled but
CONFIG_X86_MRST is not enabled.  Fixes this build error:

rtc.c:(.init.text+0x2fbb): undefined reference to `__mrst_cpu_chip'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---
 arch/x86/include/asm/mrst.h |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- next-2011-0929.orig/arch/x86/include/asm/mrst.h
+++ next-2011-0929/arch/x86/include/asm/mrst.h
@@ -32,18 +32,18 @@ enum mrst_cpu_type {
 
 extern enum mrst_cpu_type __mrst_cpu_chip;
 
-#ifdef CONFIG_X86_INTEL_MID
+#ifdef CONFIG_X86_MRST
 
 static inline enum mrst_cpu_type mrst_identify_cpu(void)
 {
 	return __mrst_cpu_chip;
 }
 
-#else /* !CONFIG_X86_INTEL_MID */
+#else /* !CONFIG_X86_MRST */
 
 #define mrst_identify_cpu()    (0)
 
-#endif /* !CONFIG_X86_INTEL_MID */
+#endif /* !CONFIG_X86_MRST */
 
 enum mrst_timer_options {
 	MRST_TIMER_DEFAULT,
