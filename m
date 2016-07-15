From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: build failure after merge of the luto-misc tree
Date: Fri, 15 Jul 2016 09:22:43 +0200
Message-ID: <20160715072243.GP30154@twins.programming.kicks-ass.net>
References: <20160715170654.0b09a8bc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160715170654.0b09a8bc@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andy Lutomirski <luto@amacapital.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>
List-Id: linux-next.vger.kernel.org

On Fri, Jul 15, 2016 at 05:06:54PM +1000, Stephen Rothwell wrote:
> interacting with commit
> 
>   2a00f026a15d ("tools: Fix up BITS_PER_LONG setting")
> 
> from the tip tree.

Yuck.. that thing is horrid :/

What's wrong with so?

And if you really want to retain CONFIG_64BIT (because other headers
might want it, and they currently do not) then do something like:

#ifdef __LP64__
#define CONFIG_64BIT
#else
#define CONFIG_32BIT
#endif

All GCC versions I checked have __CHAR_BIT__ and __SIZEOF_LONG__.

(and I checked most everything from 4.4 - 6.1)


diff --git a/tools/include/asm-generic/bitsperlong.h b/tools/include/asm-generic/bitsperlong.h
index cfd661c6fc17..4b4c91b0f042 100644
--- a/tools/include/asm-generic/bitsperlong.h
+++ b/tools/include/asm-generic/bitsperlong.h
@@ -3,37 +3,6 @@
 
 #include <uapi/asm-generic/bitsperlong.h>
 
-/*
- * In the kernel, where this file comes from, we can rely on CONFIG_64BIT,
- * here we have to make amends with what the various compilers provides us
- * to figure out if we're on a 64-bit machine...
- */
-#ifdef __SIZEOF_LONG__
-# if __SIZEOF_LONG__ == 8
-#  define CONFIG_64BIT
-# endif
-#else
-# ifdef __WORDSIZE
-#  if __WORDSIZE == 64
-#   define CONFIG_64BIT
-#  endif
-# else
-#  error Failed to determine BITS_PER_LONG value
-# endif
-#endif
-
-#ifdef CONFIG_64BIT
-#define BITS_PER_LONG 64
-#else
-#define BITS_PER_LONG 32
-#endif /* CONFIG_64BIT */
-
-#if BITS_PER_LONG != __BITS_PER_LONG
-#error Inconsistent word size. Check asm/bitsperlong.h
-#endif
-
-#ifndef BITS_PER_LONG_LONG
-#define BITS_PER_LONG_LONG 64
-#endif
+#define BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
 
 #endif /* __ASM_GENERIC_BITS_PER_LONG */
