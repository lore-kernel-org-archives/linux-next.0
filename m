From: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [PATCH/RFC] Re: linux-next: build failure after merge of the
 luto-misc tree
Date: Fri, 22 Jul 2016 16:36:55 -0300
Message-ID: <20160722193655.GJ18962@kernel.org>
References: <20160719174551.GM2207@kernel.org>
 <20160720092157.7cd8de65@canb.auug.org.au>
 <20160720095333.3034531c@canb.auug.org.au>
 <20160720025202.GB18962@kernel.org>
 <20160721092950.0047531e@canb.auug.org.au>
 <20160721131248.GH18962@kernel.org>
 <20160722092302.5a0a1544@canb.auug.org.au>
 <20160722034118.guckaniobf3f7czc@treble>
 <20160722143739.GI18962@kernel.org>
 <20160722191920.ej62fnspnqurbaa7@treble>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160722191920.ej62fnspnqurbaa7@treble>
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andy Lutomirski <luto@amacapital.net>, Arnaldo Carvalho de Melo <acme@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Em Fri, Jul 22, 2016 at 02:19:20PM -0500, Josh Poimboeuf escreveu:
> On Fri, Jul 22, 2016 at 11:37:39AM -0300, Arnaldo Carvalho de Melo wrote:
> > Em Thu, Jul 21, 2016 at 10:41:18PM -0500, Josh Poimboeuf escreveu:
> > > On Fri, Jul 22, 2016 at 09:23:02AM +1000, Stephen Rothwell wrote:
> > > > It just looks like objtool was not written with cross compilation in
> > > > mind?
> >  
> > > I don't know yet what the specific problem is, but objtool should work
> > > fine in a cross-compiled environment.  It needs to be compiled with the
> > > host (powerpc) compiler, but then it needs to disassemble target (x86)
> > > files.  It worked fine before the bitsperlong.h files were merged.
> > 
> > So, trying to summarize from the various messages in this thread:
> > 
> > In Tue, Jul 19, 2016 at 01:26:08PM +1000, Stephen Rothwell wrote:
> > 
> > > It produces these errors (from the x86_64 allmodconfig build):
> > >
> > > In file included from
> > > /home/sfr/next/next/tools/arch/x86/include/uapi/asm/bitsperlong.h:10:0,
> > >                  from /usr/include/asm-generic/int-ll64.h:11,
> > >                  from /usr/include/powerpc64le-linux-gnu/asm/types.h:27,
> > >                  from /home/sfr/next/next/tools/include/linux/types.h:9,
> > >                  from /home/sfr/next/next/tools/include/linux/list.h:4,
> > >                  from elf.h:23,
> > >                  from elf.c:30:
> > > /home/sfr/next/next/tools/include/asm-generic/bitsperlong.h:13:2:
> > > error: #error Inconsistent word size. Check asm/bitsperlong.h
> > >  #error Inconsistent word size. Check asm/bitsperlong.h
> > >   ^
> > 
> > So it starts at tools/arch/x86/include/uapi/asm/bitsperlong.h, and as
> > you mention, this should've instead be using the host headers, i.e.:
> > 
> >    tools/arch/powerpc/include/uapi/asm/bitsperlong.h
> > 
> > Which it will if it uses HOSTARCH in tools/objtool/Makefile when setting
> > up the header search path, I have two csets in my perf/core branch that
> > fixes this, and that are equivalent to the last patch Stephen tried:
> > 
> >   $ git log --oneline -2
> >   87f7dc54366a objtool: Use tools/scripts/Makefile.arch to get ARCH and HOSTARCH
> >   0eec6770ab60 tools build: Add HOSTARCH Makefile variable
> >   $ 
> > 
> > Ok, so now it uses the right file, see the whole sequence at the end of this
> > e-mail, but it boils down to:
> > 
> > -----------------------------------------------------------------------------
> > #if defined(__powerpc64__)
> > # define __BITS_PER_LONG 64
> > #else
> > # define __BITS_PER_LONG 32
> > #endif
> > 
> > #ifdef __SIZEOF_LONG__
> > #define BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
> > #else
> > #define BITS_PER_LONG __WORDSIZE
> > #endif
> > 
> > #if BITS_PER_LONG != __BITS_PER_LONG
> > #error Inconsistent word size. Check asm/bitsperlong.h
> > #endif
> > -----------------------------------------------------------------------------
> > 
> > Which I think has no problems, right? The last problem reported ty Stephen now is:
> > 
> > In Fri, 22 Jul 2016 09:23:02 +1000, Stephen Rothwell wrote:
> > 
> > > That gets me this errors from the x86_64 allmodconfig build:
> > 
> > > tools/objtool/objtool-in.o: In function `decode_instructions':
> > > tools/objtool/builtin-check.c:276: undefined reference to `arch_decode_instruction'
> > 
> > Should work, since ARCH should be x86 and then tools/objtool/Build will have
> > this:
> > 
> > objtool-y += arch/$(ARCH)/
> > 
> > Turned into:
> > 
> > objtool-y += arch/x86/
> > 
> > Which will build tools/objtool/arch/x86/decode.c, that will provide that
> > arch_decode_instruction() function :-\
> > 
> > I.e. with the two patches I mentioned, that are equivalent to the last patch I
> > sent to Stephen for testing, we would end up with HOSTARCH=powerpc and
> > ARCH=x86, no?
> 
> Thanks for spelling it out, that helped a lot.

Glad you liked it, I had to do it for my own sanity :-)

And something that gave me mixed feelings was an e-mail from the kbuild
test bot that noticed my perf/core changes and said that the build was
broken for "make ARCH=x86_64", so I had to reinstate this part:

ifeq ($(ARCH),x86_64)
ARCH := x86
endif

Because, as you say, 'make ARCH=x86' works :-\ I think it will not be
needed with your patch, right? I'm checking your patch below right now,

- Arnaldo
 
> I'm guessing Stephen is setting ARCH=x86_64 on the command-line rather
> than ARCH=x86.  How about the following patch?  Stephen, can you confirm
> this fixes it?  This is on top of Arnaldo's other two fixes here:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git perf/core
> 
> From: Josh Poimboeuf <jpoimboe@redhat.com>
> Subject: [PATCH] tools build: fix objtool build with ARCH=x86_64
> 
> The objtool build fails in a cross-compiled environment on a non-x86
> host with "ARCH=x86_64":
> 
>   tools/objtool/objtool-in.o: In function `decode_instructions':
>   tools/objtool/builtin-check.c:276: undefined reference to `arch_decode_instruction'
> 
> We could override the ARCH environment variable and change it back to
> x86, similar to what the objtool Makefile was doing before; but it's
> tricky to override environment variables consistently.
> 
> Instead, take a similar approach used by the Linux top-level Makefile
> and introduce a SRCARCH Makefile variable which evaluates to "x86" when
> ARCH is either "x86_64" or "x86".
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> ---
>  tools/objtool/Build         |  2 +-
>  tools/objtool/Makefile      |  2 +-
>  tools/scripts/Makefile.arch | 32 ++++++++++++++++++++++++++++++++
>  3 files changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/objtool/Build b/tools/objtool/Build
> index 2457916..d6cdece 100644
> --- a/tools/objtool/Build
> +++ b/tools/objtool/Build
> @@ -1,4 +1,4 @@
> -objtool-y += arch/$(ARCH)/
> +objtool-y += arch/$(SRCARCH)/
>  objtool-y += builtin-check.o
>  objtool-y += elf.o
>  objtool-y += special.o
> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> index c9ad80a..577f2d4 100644
> --- a/tools/objtool/Makefile
> +++ b/tools/objtool/Makefile
> @@ -29,7 +29,7 @@ elfshdr := $(shell echo '\#include <libelf.h>' | $(CC) $(CFLAGS) -x c -E - | gre
>  CFLAGS += $(if $(elfshdr),,-DLIBELF_USE_DEPRECATED)
>  
>  AWK = awk
> -export srctree OUTPUT CFLAGS ARCH AWK
> +export srctree OUTPUT CFLAGS SRCARCH AWK
>  include $(srctree)/tools/build/Makefile.include
>  
>  $(OBJTOOL_IN): fixdep FORCE
> diff --git a/tools/scripts/Makefile.arch b/tools/scripts/Makefile.arch
> index 887321c..ad85b92 100644
> --- a/tools/scripts/Makefile.arch
> +++ b/tools/scripts/Makefile.arch
> @@ -5,10 +5,42 @@ HOSTARCH := $(shell uname -m | sed -e s/i.86/x86/ -e s/x86_64/x86/ \
>                                    -e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
>                                    -e s/sh[234].*/sh/ -e s/aarch64.*/arm64/ \
>                                    -e s/tile.*/tile/ )
> +
>  ifndef ARCH
>  ARCH := $(HOSTARCH)
>  endif
>  
> +SRCARCH := $(ARCH)
> +
> +# Additional ARCH settings for x86
> +ifeq ($(ARCH),i386)
> +        SRCARCH := x86
> +endif
> +ifeq ($(ARCH),x86_64)
> +        SRCARCH := x86
> +endif
> +
> +# Additional ARCH settings for sparc
> +ifeq ($(ARCH),sparc32)
> +       SRCARCH := sparc
> +endif
> +ifeq ($(ARCH),sparc64)
> +       SRCARCH := sparc
> +endif
> +
> +# Additional ARCH settings for sh
> +ifeq ($(ARCH),sh64)
> +       SRCARCH := sh
> +endif
> +
> +# Additional ARCH settings for tile
> +ifeq ($(ARCH),tilepro)
> +       SRCARCH := tile
> +endif
> +ifeq ($(ARCH),tilegx)
> +       SRCARCH := tile
> +endif
> +
>  LP64 := $(shell echo __LP64__ | ${CC} ${CFLAGS} -E -x c - | tail -n 1)
>  ifeq ($(LP64), 1)
>    IS_64_BIT := 1
