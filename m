From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: [PATCH] compiler-gcc: require gcc 4.8 for powerpc __builtin_bswap16()
Date: Fri, 6 May 2016 09:22:25 -0500
Message-ID: <20160506142225.rtp2swmdgfzucfjl@treble>
References: <20160506145810.04a319d3@canb.auug.org.au>
 <20160505224429.3b8f3837bcb0281932cfe03f@linux-foundation.org>
 <20160506160916.3192f615@canb.auug.org.au>
 <1462517712.8044.2.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:40493 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757007AbcEFOW3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 May 2016 10:22:29 -0400
Content-Disposition: inline
In-Reply-To: <1462517712.8044.2.camel@ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>

On Fri, May 06, 2016 at 04:55:12PM +1000, Michael Ellerman wrote:
> On Fri, 2016-05-06 at 16:09 +1000, Stephen Rothwell wrote:
> > Hi Andrew,
> > 
> > On Thu, 5 May 2016 22:44:29 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
> > > 
> > > On Fri, 6 May 2016 14:58:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > 
> > > > After merging the akpm-current tree, today's linux-next build (and a
> > > > few earlier ones) (powerpc allnoconfig (and many others)) failed like
> > > > this:
> > > > 
> > > > lib/vsprintf.c:160:2: error: initializer element is not constant
> > > > lib/vsprintf.c:160:2: error: (near initialization for 'decpair[0]')
> > > > lib/vsprintf.c:160:2: error: initializer element is not constant
> > > > lib/vsprintf.c:160:2: error: (near initialization for 'decpair[1]')
> > > > lib/vsprintf.c:160:2: error: initializer element is not constant
> > > > lib/vsprintf.c:160:2: error: (near initialization for 'decpair[2]')
> > > > lib/vsprintf.c:160:2: error: initializer element is not constant
> > > > lib/vsprintf.c:160:2: error: (near initialization for 'decpair[3]')
> > > > lib/vsprintf.c:160:2: error: initializer element is not constant
> > > > 
> > > > and more ... basically any big endian build of code using __swabxx
> > > > or cpu_to_lexx in initailisers (in the above case cpu_to_le16()).
> > > > 
> > > > Caused (presumably) by commit
> > > > 
> > > >   eeee46ed3cda ("byteswap: try to avoid __builtin_constant_p gcc bug")
> > > > 
> > > > This is a buyild using gcc 4.6.3.
> > > > 
> > > > I have revreted that commit for today to see if it fixes the overnight
> > > > builds.  
> > > 
> > > hm, it works for me.  powerpc allnoconfig, after setting CONFIG_PPC64=y.
> > 
> > Interesting ...  mine also works with gcc 5.2.0. I do 32 and 64 bit
> > allnoconfig powerpc builds before I release linux-next and they work,
> > but the 32 bit one fails overnight when gcc 4.6.3 is used :-( (we don't
> > do a 64 bit allnoconfig overnight as it requires playing with the
> > generated .config).  Basically all the powerpc builds were failing with
> > gcc 4.6.3 since next-20160502.
> 
> There's a powerpc-5.3 compiler in kisskb now, I've been testing it for a while
> and it seems OK, you can start using that as well of or instead if you like for
> linux-next builds.

I've also seen no problems on powerpc with 4.4 and 4.8.  I suspect it's
specific to gcc 4.6.  Stephen, can you confirm this patch fixes it?

----

From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: [PATCH] compiler-gcc: require gcc 4.8 for powerpc __builtin_bswap16()

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

Fixes: 7322dd755e7d ("byteswap: try to avoid __builtin_constant_p gcc bug")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
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
