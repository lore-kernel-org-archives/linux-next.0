From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tip tree
Date: Mon, 18 Jul 2016 15:15:54 +1000
Message-ID: <20160718151554.1f37c130@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60666 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750931AbcGRFP5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jul 2016 01:15:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, Andy Lutomirski <luto@amacapital.net>, Arnaldo Carvalho de Melo <acme@kernel.org>

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from tools/arch/x86/include/uapi/asm/bitsperlong.h:10:0,
                 from /usr/include/asm-generic/int-ll64.h:11,
                 from /usr/include/powerpc64le-linux-gnu/asm/types.h:27,
                 from tools/include/linux/types.h:9,
                 from tools/include/linux/list.h:4,
                 from elf.h:23,
                 from builtin-check.c:33:
tools/include/asm-generic/bitsperlong.h:13:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
 #error Inconsistent word size. Check asm/bitsperlong.h
  ^
In file included from tools/arch/x86/include/uapi/asm/bitsperlong.h:10:0,
                 from /usr/include/asm-generic/int-ll64.h:11,
                 from /usr/include/powerpc64le-linux-gnu/asm/types.h:27,
                 from tools/include/linux/types.h:9,
                 from tools/include/linux/string.h:5,
                 from ../lib/str_error_r.c:4:
tools/include/asm-generic/bitsperlong.h:13:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
 #error Inconsistent word size. Check asm/bitsperlong.h
  ^
cat: /home/sfr/next/x86_64_allmodconfig/tools/objtool/.str_error_r.o.d: No such file or directory
Build:17: recipe for target '/home/sfr/next/x86_64_allmodconfig/tools/objtool/str_error_r.o' failed
In file included from tools/arch/x86/include/uapi/asm/bitsperlong.h:10:0,
                 from /usr/include/asm-generic/int-ll64.h:11,
                 from /usr/include/powerpc64le-linux-gnu/asm/types.h:27,
                 from tools/include/linux/types.h:9,
                 from tools/include/linux/list.h:4,
                 from elf.h:23,
                 from special.h:22, 
                 from special.c:26: 
tools/include/asm-generic/bitsperlong.h:13:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
 #error Inconsistent word size. Check asm/bitsperlong.h
  ^
In file included from tools/arch/x86/include/uapi/asm/bitsperlong.h:10:0,
                 from /usr/include/asm-generic/int-ll64.h:11,
                 from /usr/include/powerpc64le-linux-gnu/asm/types.h:27,
                 from tools/include/linux/types.h:9,
                 from tools/include/linux/string.h:5,
                 from ../lib/string.c:18:
tools/include/asm-generic/bitsperlong.h:13:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
 #error Inconsistent word size. Check asm/bitsperlong.h
  ^
In file included from tools/arch/x86/include/uapi/asm/bitsperlong.h:10:0,
                 from /usr/include/asm-generic/int-ll64.h:11,
                 from /usr/include/powerpc64le-linux-gnu/asm/types.h:27,
                 from tools/include/linux/types.h:9,
                 from tools/include/linux/list.h:4,
                 from elf.h:23,
                 from elf.c:30:
tools/include/asm-generic/bitsperlong.h:13:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
 #error Inconsistent word size. Check asm/bitsperlong.h
  ^
In file included from tools/arch/x86/include/uapi/asm/bitsperlong.h:10:0,
                 from /usr/include/asm-generic/int-ll64.h:11,
                 from /usr/include/powerpc64le-linux-gnu/asm/types.h:27,
                 from tools/include/linux/types.h:9,
                 from tools/include/linux/list.h:4,
                 from arch/x86/../../elf.h:23,
                 from arch/x86/decode.c:26:
tools/include/asm-generic/bitsperlong.h:13:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
 #error Inconsistent word size. Check asm/bitsperlong.h
  ^
Makefile:42: recipe for target '/home/sfr/next/x86_64_allmodconfig/tools/objtool/objtool-in.o' failed
Makefile:60: recipe for target 'objtool' failed

I have added this patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 18 Jul 2016 14:58:39 +1000
Subject: [PATCH] tools: Simplify __BITS_PER_LONG define

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 tools/include/asm-generic/bitsperlong.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/include/asm-generic/bitsperlong.h b/tools/include/asm-generic/bitsperlong.h
index 45eca517efb3..f46853474fd3 100644
--- a/tools/include/asm-generic/bitsperlong.h
+++ b/tools/include/asm-generic/bitsperlong.h
@@ -10,7 +10,8 @@
 #endif
 
 #if BITS_PER_LONG != __BITS_PER_LONG
-#error Inconsistent word size. Check asm/bitsperlong.h
+#undef __BITS_PER_LONG
+#define __BITS_PER_LONG	BITS_PER_LONG
 #endif
 
 #ifndef BITS_PER_LONG_LONG
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
