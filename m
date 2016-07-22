From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH/RFC] Re: linux-next: build failure after merge of the
 luto-misc tree
Date: Fri, 22 Jul 2016 14:44:17 -0500
Message-ID: <20160722194416.pxbsnyhaqcyoigsj@treble>
References: <20160720092157.7cd8de65@canb.auug.org.au>
 <20160720095333.3034531c@canb.auug.org.au>
 <20160720025202.GB18962@kernel.org>
 <20160721092950.0047531e@canb.auug.org.au>
 <20160721131248.GH18962@kernel.org>
 <20160722092302.5a0a1544@canb.auug.org.au>
 <20160722034118.guckaniobf3f7czc@treble>
 <20160722143739.GI18962@kernel.org>
 <20160722191920.ej62fnspnqurbaa7@treble>
 <20160722193655.GJ18962@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:53131 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751998AbcGVToT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 22 Jul 2016 15:44:19 -0400
Content-Disposition: inline
In-Reply-To: <20160722193655.GJ18962@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andy Lutomirski <luto@amacapital.net>, Arnaldo Carvalho de Melo <acme@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jul 22, 2016 at 04:36:55PM -0300, Arnaldo Carvalho de Melo wrote:
> Em Fri, Jul 22, 2016 at 02:19:20PM -0500, Josh Poimboeuf escreveu:
> > On Fri, Jul 22, 2016 at 11:37:39AM -0300, Arnaldo Carvalho de Melo wrote:
> > > Em Thu, Jul 21, 2016 at 10:41:18PM -0500, Josh Poimboeuf escreveu:
> > > > On Fri, Jul 22, 2016 at 09:23:02AM +1000, Stephen Rothwell wrote:
> > > > > It just looks like objtool was not written with cross compilation in
> > > > > mind?
> > >  
> > > > I don't know yet what the specific problem is, but objtool should work
> > > > fine in a cross-compiled environment.  It needs to be compiled with the
> > > > host (powerpc) compiler, but then it needs to disassemble target (x86)
> > > > files.  It worked fine before the bitsperlong.h files were merged.
> > > 
> > > So, trying to summarize from the various messages in this thread:
> > > 
> > > In Tue, Jul 19, 2016 at 01:26:08PM +1000, Stephen Rothwell wrote:
> > > 
> > > > It produces these errors (from the x86_64 allmodconfig build):
> > > >
> > > > In file included from
> > > > /home/sfr/next/next/tools/arch/x86/include/uapi/asm/bitsperlong.h:10:0,
> > > >                  from /usr/include/asm-generic/int-ll64.h:11,
> > > >                  from /usr/include/powerpc64le-linux-gnu/asm/types.h:27,
> > > >                  from /home/sfr/next/next/tools/include/linux/types.h:9,
> > > >                  from /home/sfr/next/next/tools/include/linux/list.h:4,
> > > >                  from elf.h:23,
> > > >                  from elf.c:30:
> > > > /home/sfr/next/next/tools/include/asm-generic/bitsperlong.h:13:2:
> > > > error: #error Inconsistent word size. Check asm/bitsperlong.h
> > > >  #error Inconsistent word size. Check asm/bitsperlong.h
> > > >   ^
> > > 
> > > So it starts at tools/arch/x86/include/uapi/asm/bitsperlong.h, and as
> > > you mention, this should've instead be using the host headers, i.e.:
> > > 
> > >    tools/arch/powerpc/include/uapi/asm/bitsperlong.h
> > > 
> > > Which it will if it uses HOSTARCH in tools/objtool/Makefile when setting
> > > up the header search path, I have two csets in my perf/core branch that
> > > fixes this, and that are equivalent to the last patch Stephen tried:
> > > 
> > >   $ git log --oneline -2
> > >   87f7dc54366a objtool: Use tools/scripts/Makefile.arch to get ARCH and HOSTARCH
> > >   0eec6770ab60 tools build: Add HOSTARCH Makefile variable
> > >   $ 
> > > 
> > > Ok, so now it uses the right file, see the whole sequence at the end of this
> > > e-mail, but it boils down to:
> > > 
> > > -----------------------------------------------------------------------------
> > > #if defined(__powerpc64__)
> > > # define __BITS_PER_LONG 64
> > > #else
> > > # define __BITS_PER_LONG 32
> > > #endif
> > > 
> > > #ifdef __SIZEOF_LONG__
> > > #define BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
> > > #else
> > > #define BITS_PER_LONG __WORDSIZE
> > > #endif
> > > 
> > > #if BITS_PER_LONG != __BITS_PER_LONG
> > > #error Inconsistent word size. Check asm/bitsperlong.h
> > > #endif
> > > -----------------------------------------------------------------------------
> > > 
> > > Which I think has no problems, right? The last problem reported ty Stephen now is:
> > > 
> > > In Fri, 22 Jul 2016 09:23:02 +1000, Stephen Rothwell wrote:
> > > 
> > > > That gets me this errors from the x86_64 allmodconfig build:
> > > 
> > > > tools/objtool/objtool-in.o: In function `decode_instructions':
> > > > tools/objtool/builtin-check.c:276: undefined reference to `arch_decode_instruction'
> > > 
> > > Should work, since ARCH should be x86 and then tools/objtool/Build will have
> > > this:
> > > 
> > > objtool-y += arch/$(ARCH)/
> > > 
> > > Turned into:
> > > 
> > > objtool-y += arch/x86/
> > > 
> > > Which will build tools/objtool/arch/x86/decode.c, that will provide that
> > > arch_decode_instruction() function :-\
> > > 
> > > I.e. with the two patches I mentioned, that are equivalent to the last patch I
> > > sent to Stephen for testing, we would end up with HOSTARCH=powerpc and
> > > ARCH=x86, no?
> > 
> > Thanks for spelling it out, that helped a lot.
> 
> Glad you liked it, I had to do it for my own sanity :-)
> 
> And something that gave me mixed feelings was an e-mail from the kbuild
> test bot that noticed my perf/core changes and said that the build was
> broken for "make ARCH=x86_64", so I had to reinstate this part:
> 
> ifeq ($(ARCH),x86_64)
> ARCH := x86
> endif
> 
> Because, as you say, 'make ARCH=x86' works :-\ I think it will not be
> needed with your patch, right? I'm checking your patch below right now,

Yeah, that shouldn't be needed with my patch.  I think either would
work, but my patch is more of a permanent solution.

-- 
Josh
