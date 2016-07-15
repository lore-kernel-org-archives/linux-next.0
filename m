From: Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: [PATCH/RFC] Re: linux-next: build failure after merge of the
 luto-misc tree
Date: Fri, 15 Jul 2016 12:43:26 -0300
Message-ID: <20160715154326.GC2523@redhat.com>
References: <20160715170654.0b09a8bc@canb.auug.org.au>
 <20160715072243.GP30154@twins.programming.kicks-ass.net>
 <20160715073119.GR30927@twins.programming.kicks-ass.net>
 <20160715150903.GA2523@redhat.com>
 <20160715152436.GB2523@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160715152436.GB2523@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andy Lutomirski <luto@amacapital.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>
List-Id: linux-next.vger.kernel.org

Em Fri, Jul 15, 2016 at 12:24:36PM -0300, Arnaldo Carvalho de Melo escreveu:
> Em Fri, Jul 15, 2016 at 12:09:03PM -0300, Arnaldo Carvalho de Melo escreveu:
> > Em Fri, Jul 15, 2016 at 09:31:19AM +0200, Peter Zijlstra escreveu:
> > > On Fri, Jul 15, 2016 at 09:22:43AM +0200, Peter Zijlstra wrote:
> > > > All GCC versions I checked have __CHAR_BIT__ and __SIZEOF_LONG__.

> > > > (and I checked most everything from 4.4 - 6.1)

> > > clang-3.8 also defines all three of those, and I don't consider that a
> > > usable compiler as it doesn't even build a kernel.

> > I was trying to have that file as close to the kernel as possible, but
> > I'll try building with your patch in my test rig, lets see if one of the
> > dozens of distros/releases barf at that...

> Seems ok, but I'll reinstate this:

> #if BITS_PER_LONG != __BITS_PER_LONG
> #error Inconsistent word size. Check asm/bitsperlong.h
> #endif

> And now I'm rerunning these tests, that without the above check

Ok, same results, it works, queuing this one, ack? Stephen, does it work
for you?

commit a08cc3e6f7bb965672a3ff60f98d0dbbc5334ee7
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Fri Jul 15 12:38:18 2016 -0300

    tools: Simplify BITS_PER_LONG define
    
    Do it using (__CHAR_BIT__ * __SIZEOF_LONG__), simpler, works everywhere,
    reduces the complexity by ditching CONFIG_64BIT, that was being
    synthesized from yet another set of defines, which proved fragile,
    breaking the build on linux-next for no obvious reasons.
    
    Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
    Signed-off-by: Peter Zijlstra <peterz@infradead.org>
    Tested-by: Arnaldo Carvalho de Melo <acme@redhat.com>
    Cc: Andy Lutomirski <luto@amacapital.net>,
    Cc: H. Peter Anvin <hpa@zytor.com>
    Cc: Thomas Gleixner <tglx@linutronix.de>
    Link: http://lkml.kernel.org/r/20160715072243.GP30154@twins.programming.kicks-ass.net
    Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

diff --git a/tools/include/asm-generic/bitsperlong.h b/tools/include/asm-generic/bitsperlong.h
index cfd661c6fc17..4c7a9ab42424 100644
--- a/tools/include/asm-generic/bitsperlong.h
+++ b/tools/include/asm-generic/bitsperlong.h
@@ -3,30 +3,7 @@
 
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
+#define BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
 
 #if BITS_PER_LONG != __BITS_PER_LONG
 #error Inconsistent word size. Check asm/bitsperlong.h
