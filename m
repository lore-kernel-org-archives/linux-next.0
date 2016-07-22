From: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [PATCH/RFC] Re: linux-next: build failure after merge of the
 luto-misc tree
Date: Fri, 22 Jul 2016 11:37:39 -0300
Message-ID: <20160722143739.GI18962@kernel.org>
References: <20160719132608.1aa2692a@canb.auug.org.au>
 <20160719125443.GL2207@kernel.org>
 <20160719174551.GM2207@kernel.org>
 <20160720092157.7cd8de65@canb.auug.org.au>
 <20160720095333.3034531c@canb.auug.org.au>
 <20160720025202.GB18962@kernel.org>
 <20160721092950.0047531e@canb.auug.org.au>
 <20160721131248.GH18962@kernel.org>
 <20160722092302.5a0a1544@canb.auug.org.au>
 <20160722034118.guckaniobf3f7czc@treble>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:37222 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751327AbcGVOhp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 22 Jul 2016 10:37:45 -0400
Content-Disposition: inline
In-Reply-To: <20160722034118.guckaniobf3f7czc@treble>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andy Lutomirski <luto@amacapital.net>, Arnaldo Carvalho de Melo <acme@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Em Thu, Jul 21, 2016 at 10:41:18PM -0500, Josh Poimboeuf escreveu:
> On Fri, Jul 22, 2016 at 09:23:02AM +1000, Stephen Rothwell wrote:
> > It just looks like objtool was not written with cross compilation in
> > mind?
 
> I don't know yet what the specific problem is, but objtool should work
> fine in a cross-compiled environment.  It needs to be compiled with the
> host (powerpc) compiler, but then it needs to disassemble target (x86)
> files.  It worked fine before the bitsperlong.h files were merged.

So, trying to summarize from the various messages in this thread:

In Tue, Jul 19, 2016 at 01:26:08PM +1000, Stephen Rothwell wrote:

> It produces these errors (from the x86_64 allmodconfig build):
>
> In file included from
> /home/sfr/next/next/tools/arch/x86/include/uapi/asm/bitsperlong.h:10:0,
>                  from /usr/include/asm-generic/int-ll64.h:11,
>                  from /usr/include/powerpc64le-linux-gnu/asm/types.h:27,
>                  from /home/sfr/next/next/tools/include/linux/types.h:9,
>                  from /home/sfr/next/next/tools/include/linux/list.h:4,
>                  from elf.h:23,
>                  from elf.c:30:
> /home/sfr/next/next/tools/include/asm-generic/bitsperlong.h:13:2:
> error: #error Inconsistent word size. Check asm/bitsperlong.h
>  #error Inconsistent word size. Check asm/bitsperlong.h
>   ^

So it starts at tools/arch/x86/include/uapi/asm/bitsperlong.h, and as
you mention, this should've instead be using the host headers, i.e.:

   tools/arch/powerpc/include/uapi/asm/bitsperlong.h

Which it will if it uses HOSTARCH in tools/objtool/Makefile when setting
up the header search path, I have two csets in my perf/core branch that
fixes this, and that are equivalent to the last patch Stephen tried:

  $ git log --oneline -2
  87f7dc54366a objtool: Use tools/scripts/Makefile.arch to get ARCH and HOSTARCH
  0eec6770ab60 tools build: Add HOSTARCH Makefile variable
  $ 

Ok, so now it uses the right file, see the whole sequence at the end of this
e-mail, but it boils down to:

-----------------------------------------------------------------------------
#if defined(__powerpc64__)
# define __BITS_PER_LONG 64
#else
# define __BITS_PER_LONG 32
#endif

#ifdef __SIZEOF_LONG__
#define BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
#else
#define BITS_PER_LONG __WORDSIZE
#endif

#if BITS_PER_LONG != __BITS_PER_LONG
#error Inconsistent word size. Check asm/bitsperlong.h
#endif
-----------------------------------------------------------------------------

Which I think has no problems, right? The last problem reported ty Stephen now is:

In Fri, 22 Jul 2016 09:23:02 +1000, Stephen Rothwell wrote:

> That gets me this errors from the x86_64 allmodconfig build:

> tools/objtool/objtool-in.o: In function `decode_instructions':
> tools/objtool/builtin-check.c:276: undefined reference to `arch_decode_instruction'

Should work, since ARCH should be x86 and then tools/objtool/Build will have
this:

objtool-y += arch/$(ARCH)/

Turned into:

objtool-y += arch/x86/

Which will build tools/objtool/arch/x86/decode.c, that will provide that
arch_decode_instruction() function :-\

I.e. with the two patches I mentioned, that are equivalent to the last patch I
sent to Stephen for testing, we would end up with HOSTARCH=powerpc and
ARCH=x86, no?

- Arnaldo

Full sequence:

[acme@jouet linux]$ cat tools/arch/powerpc/include/uapi/asm/bitsperlong.h 
#ifndef __ASM_POWERPC_BITSPERLONG_H
#define __ASM_POWERPC_BITSPERLONG_H

#if defined(__powerpc64__)
# define __BITS_PER_LONG 64
#else
# define __BITS_PER_LONG 32
#endif

#include <asm-generic/bitsperlong.h>

#endif /* __ASM_POWERPC_BITSPERLONG_H */
[acme@jouet linux]$

It, like the kernel, where these files come from, has:

[acme@jouet linux]$ cat tools/include/asm-generic/bitsperlong.h 
#ifndef __ASM_GENERIC_BITS_PER_LONG
#define __ASM_GENERIC_BITS_PER_LONG

#include <uapi/asm-generic/bitsperlong.h>

#ifdef __SIZEOF_LONG__
#define BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
#else
#define BITS_PER_LONG __WORDSIZE
#endif

#if BITS_PER_LONG != __BITS_PER_LONG
#error Inconsistent word size. Check asm/bitsperlong.h
#endif

#endif /* __ASM_GENERIC_BITS_PER_LONG */
[acme@jouet linux]$

And finally:

[acme@jouet linux]$ cat tools/include/uapi/asm-generic/bitsperlong.h 
#ifndef _UAPI__ASM_GENERIC_BITS_PER_LONG
#define _UAPI__ASM_GENERIC_BITS_PER_LONG

/*
 * There seems to be no way of detecting this automatically from user
 * space, so 64 bit architectures should override this in their
 * bitsperlong.h. In particular, an architecture that supports
 * both 32 and 64 bit user space must not rely on CONFIG_64BIT
 * to decide it, but rather check a compiler provided macro.
 */
#ifndef __BITS_PER_LONG
#define __BITS_PER_LONG 32
#endif

#endif /* _UAPI__ASM_GENERIC_BITS_PER_LONG */
[acme@jouet linux]$ 
