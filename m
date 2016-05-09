From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] compiler-gcc: require gcc 4.8 for powerpc __builtin_bswap16()
Date: Mon, 09 May 2016 12:16:11 +0200
Message-ID: <75773040.xkfFJb3GoQ@wuerfel>
References: <20160506145810.04a319d3@canb.auug.org.au> <20160509163302.59f3f6a2@canb.auug.org.au> <1462786493.5531.1.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:58770 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750927AbcEIKQ1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 May 2016 06:16:27 -0400
In-Reply-To: <1462786493.5531.1.camel@ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Josh Poimboeuf <jpoimboe@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>

On Monday 09 May 2016 19:34:53 Michael Ellerman wrote:
> On Mon, 2016-05-09 at 16:33 +1000, Stephen Rothwell wrote:
> > On Mon, 9 May 2016 10:59:27 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > On Fri, 6 May 2016 09:22:25 -0500 Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> > > > diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
> > > > index eeae401..3d5202e 100644
> > > > --- a/include/linux/compiler-gcc.h
> > > > +++ b/include/linux/compiler-gcc.h
> > > > @@ -246,7 +246,7 @@
> > > >  #define __HAVE_BUILTIN_BSWAP32__
> > > >  #define __HAVE_BUILTIN_BSWAP64__
> > > >  #endif
> > > > -#if GCC_VERSION >= 40800 || (defined(__powerpc__) && GCC_VERSION >= 40600)
> > > > +#if GCC_VERSION >= 40800
> > > >  #define __HAVE_BUILTIN_BSWAP16__
> > > >  #endif
> > > >  #endif /* CONFIG_ARCH_USE_BUILTIN_BSWAP */
> > 
> > Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>

Acked-by: Arnd Bergmann <arnd@arndb.de>

> > Michael, do you want to pass the fix patch on, or will I submit it
> > directly to Linus?
> 
> I'm happy for you to send it, I haven't actually hit the bug myself.

I found the commit in gcc-4.8 that replaced the powerpc-specific implementation
of __builtin_bswap16 with an architecture-independent one. Apparently the
powerpc version (gcc-4.6 and 4.7) just mapped to the lhbrx/sthbrx instructions,
so it ended up not being a constant, though the intent of the patch was
mainly to add support for the builtin to x86.

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52624 has the patch that went
into gcc-4.8 and more information.

	Arnd
