From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the luto-misc tree
Date: Fri, 15 Jul 2016 17:06:54 +1000
Message-ID: <20160715170654.0b09a8bc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47827 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752503AbcGOHG6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Jul 2016 03:06:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>

Hi Andy,

After merging the luto-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from arch/x86/include/uapi/asm/bitsperlong.h:10:0,
                 from include/uapi/asm-generic/int-ll64.h:11,
                 from include/uapi/asm-generic/types.h:6,  
                 from arch/x86/include/uapi/asm/types.h:4,
                 from tools/include/linux/types.h:9,
                 from include/uapi/linux/elf.h:4,
                 from arch/x86/entry/vdso/vdso2c.c:66:
tools/include/asm-generic/bitsperlong.h:32:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
 #error Inconsistent word size. Check asm/bitsperlong.h
  ^

Caused by commit

  6436d4c1a83c ("x86/vdso: Fail the build if the vdso image has no dynamic section")

interacting with commit

  2a00f026a15d ("tools: Fix up BITS_PER_LONG setting")

from the tip tree.

I am not sure why 6436d4c1a83c does this ... maybe it just causes
arch/x86/entry/vdso/vdso2c.c to be rebuilt?

I applied this partial revert of the latter commit:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 15 Jul 2016 16:58:25 +1000
Subject: [PATCH] tools: partial revert of 2a00f026a15d "tools: Fix up
 BITS_PER_LONG setting"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 tools/include/asm-generic/bitsperlong.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/include/asm-generic/bitsperlong.h b/tools/include/asm-generic/bitsperlong.h
index cfd661c6fc17..cb047bd03b69 100644
--- a/tools/include/asm-generic/bitsperlong.h
+++ b/tools/include/asm-generic/bitsperlong.h
@@ -28,7 +28,11 @@
 #define BITS_PER_LONG 32
 #endif /* CONFIG_64BIT */
 
-#if BITS_PER_LONG != __BITS_PER_LONG
+/*
+ * FIXME: The check currently breaks x86-64 build, so it's
+ * temporarily disabled. Please fix x86-64 and reenable
+ */
+#if 0 && BITS_PER_LONG != __BITS_PER_LONG
 #error Inconsistent word size. Check asm/bitsperlong.h
 #endif
 
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
