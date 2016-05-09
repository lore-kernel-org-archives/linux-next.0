From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] compiler-gcc: require gcc 4.8 for powerpc
 __builtin_bswap16()
Date: Mon, 9 May 2016 20:36:16 +1000
Message-ID: <20160509203616.2c5a6ebc@canb.auug.org.au>
References: <20160506145810.04a319d3@canb.auug.org.au>
	<20160509163302.59f3f6a2@canb.auug.org.au>
	<1462786493.5531.1.camel@ellerman.id.au>
	<75773040.xkfFJb3GoQ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49641 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751432AbcEIKgT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 May 2016 06:36:19 -0400
In-Reply-To: <75773040.xkfFJb3GoQ@wuerfel>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>, Josh Poimboeuf <jpoimboe@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sedat Dilek <sedat.dilek@gmail.com>

From: Josh Poimboeuf <jpoimboe@redhat.com>
Date: Fri, 6 May 2016 09:22:25 -0500

gcc support for __builtin_bswap16() was supposedly added for powerpc in
gcc 4.6, and was then later added for other architectures in gcc 4.8.

However, Stephen Rothwell reported that attempting to use it on powerpc
in gcc 4.6 fails with:

  lib/vsprintf.c:160:2: error: initializer element is not constant
  lib/vsprintf.c:160:2: error: (near initialization for 'decpair[0]')
  lib/vsprintf.c:160:2: error: initializer element is not constant
  lib/vsprintf.c:160:2: error: (near initialization for 'decpair[1]')
  lib/vsprintf.c:160:2: error: initializer element is not constant
  lib/vsprintf.c:160:2: error: (near initialization for 'decpair[2]')
  lib/vsprintf.c:160:2: error: initializer element is not constant
  lib/vsprintf.c:160:2: error: (near initialization for 'decpair[3]')
  lib/vsprintf.c:160:2: error: initializer element is not constant

I'm not entirely sure what those errors mean, but I don't see them on
gcc 4.8.  So let's consider gcc 4.8 to be the official starting point
for __builtin_bswap16().

Arnd Bergmann adds:

"I found the commit in gcc-4.8 that replaced the powerpc-specific
implementation of __builtin_bswap16 with an architecture-independent
one. Apparently the powerpc version (gcc-4.6 and 4.7) just mapped to
the lhbrx/sthbrx instructions, so it ended up not being a constant,
though the intent of the patch was mainly to add support for the
builtin to x86.

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52624 has the patch that went
into gcc-4.8 and more information."

Fixes: 7322dd755e7d ("byteswap: try to avoid __builtin_constant_p gcc bug")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/compiler-gcc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
index eeae401..3d5202e 100644
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@ -246,7 +246,7 @@
 #define __HAVE_BUILTIN_BSWAP32__
 #define __HAVE_BUILTIN_BSWAP64__
 #endif
-#if GCC_VERSION >= 40800 || (defined(__powerpc__) && GCC_VERSION >= 40600)
+#if GCC_VERSION >= 40800
 #define __HAVE_BUILTIN_BSWAP16__
 #endif
 #endif /* CONFIG_ARCH_USE_BUILTIN_BSWAP */
-- 
2.4.11

-- 
Cheers,
Stephen Rothwell
