From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] compiler-gcc: require gcc 4.8 for powerpc
 __builtin_bswap16()
Date: Mon, 09 May 2016 19:34:53 +1000
Message-ID: <1462786493.5531.1.camel@ellerman.id.au>
References: <20160506145810.04a319d3@canb.auug.org.au>
	 <20160505224429.3b8f3837bcb0281932cfe03f@linux-foundation.org>
	 <20160506160916.3192f615@canb.auug.org.au>
	 <1462517712.8044.2.camel@ellerman.id.au>
	 <20160506142225.rtp2swmdgfzucfjl@treble>
	 <20160509105927.68dfa6d2@canb.auug.org.au>
	 <20160509163302.59f3f6a2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37481 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751189AbcEIJfA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 May 2016 05:35:00 -0400
In-Reply-To: <20160509163302.59f3f6a2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>

On Mon, 2016-05-09 at 16:33 +1000, Stephen Rothwell wrote:
> On Mon, 9 May 2016 10:59:27 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > On Fri, 6 May 2016 09:22:25 -0500 Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> > > 
> > > I've also seen no problems on powerpc with 4.4 and 4.8.  I suspect it's
> > > specific to gcc 4.6.  Stephen, can you confirm this patch fixes it?  
> > 
> > That will obviously fix the problem for us (since it will effectively
> > restore the code to what it was before the other commit for our gcc
> > 4.6.3 builds and we have not seen it in other builds).  I will add this
> > patch to linux-next today.
> > 
> > And since "byteswap: try to avoid __builtin_constant_p gcc bug" is not
> > in Linus' tree, hopefully we can have this fix applied soon.

> > > From: Josh Poimboeuf <jpoimboe@redhat.com>
> > > Subject: [PATCH] compiler-gcc: require gcc 4.8 for powerpc __builtin_bswap16()
> > > 
> > > gcc support for __builtin_bswap16() was supposedly added for powerpc in
> > > gcc 4.6, and was then later added for other architectures in gcc 4.8.
> > > 
> > > However, Stephen Rothwell reported that attempting to use it on powerpc
> > > in gcc 4.6 fails with:
> > > 
> > >   lib/vsprintf.c:160:2: error: initializer element is not constant
> > >   lib/vsprintf.c:160:2: error: (near initialization for 'decpair[0]')
> > >   lib/vsprintf.c:160:2: error: initializer element is not constant
> > >   lib/vsprintf.c:160:2: error: (near initialization for 'decpair[1]')
> > >   lib/vsprintf.c:160:2: error: initializer element is not constant
> > >   lib/vsprintf.c:160:2: error: (near initialization for 'decpair[2]')
> > >   lib/vsprintf.c:160:2: error: initializer element is not constant
> > >   lib/vsprintf.c:160:2: error: (near initialization for 'decpair[3]')
> > >   lib/vsprintf.c:160:2: error: initializer element is not constant
> > > 
> > > I'm not entirely sure what those errors mean, but I don't see them on
> > > gcc 4.8.  So let's consider gcc 4.8 to be the official starting point
> > > for __builtin_bswap16().
> > > 
> > > Fixes: 7322dd755e7d ("byteswap: try to avoid __builtin_constant_p gcc bug")
> > > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> > > ---
> > >  include/linux/compiler-gcc.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
> > > index eeae401..3d5202e 100644
> > > --- a/include/linux/compiler-gcc.h
> > > +++ b/include/linux/compiler-gcc.h
> > > @@ -246,7 +246,7 @@
> > >  #define __HAVE_BUILTIN_BSWAP32__
> > >  #define __HAVE_BUILTIN_BSWAP64__
> > >  #endif
> > > -#if GCC_VERSION >= 40800 || (defined(__powerpc__) && GCC_VERSION >= 40600)
> > > +#if GCC_VERSION >= 40800
> > >  #define __HAVE_BUILTIN_BSWAP16__
> > >  #endif
> > >  #endif /* CONFIG_ARCH_USE_BUILTIN_BSWAP */
> > > -- 
> > > 2.4.11  
> 
> Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>
> 
> Michael, do you want to pass the fix patch on, or will I submit it
> directly to Linus?

I'm happy for you to send it, I haven't actually hit the bug myself.

cheers
