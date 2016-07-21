From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH/RFC] Re: linux-next: build failure after merge of the
 luto-misc tree
Date: Fri, 22 Jul 2016 09:23:02 +1000
Message-ID: <20160722092302.5a0a1544@canb.auug.org.au>
References: <20160718234132.GI2207@kernel.org>
	<20160719102629.0a12a1a1@canb.auug.org.au>
	<20160719003906.GJ2207@kernel.org>
	<20160719132608.1aa2692a@canb.auug.org.au>
	<20160719125443.GL2207@kernel.org>
	<20160719174551.GM2207@kernel.org>
	<20160720092157.7cd8de65@canb.auug.org.au>
	<20160720095333.3034531c@canb.auug.org.au>
	<20160720025202.GB18962@kernel.org>
	<20160721092950.0047531e@canb.auug.org.au>
	<20160721131248.GH18962@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52688 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751427AbcGUXXG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Jul 2016 19:23:06 -0400
In-Reply-To: <20160721131248.GH18962@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Andy Lutomirski <luto@amacapital.net>, Arnaldo Carvalho de Melo <acme@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Arnaldo,

On Thu, 21 Jul 2016 10:12:48 -0300 Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
>
> Em Thu, Jul 21, 2016 at 09:29:50AM +1000, Stephen Rothwell escreveu:
> > Hi Arnaldo,
> > 
> > On Tue, 19 Jul 2016 23:52:02 -0300 Arnaldo Carvalho de Melo <acme@kernel.org> wrote:  
> > >
> > > Humm, it seems that the compiler used is not the cross one, but the
> > > native, check if, say, __powerpc__ is defined.  
> > 
> > Yes, __powerpc__ is defined (unsuprisingly).  
> 
> Maybe this one?
> 
> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> index 1f75b0a046cc..3500fcf7bd47 100644
> --- a/tools/objtool/Makefile
> +++ b/tools/objtool/Makefile
> @@ -1,10 +1,14 @@
>  include ../scripts/Makefile.include
>  
> +HOSTARCH=$(shell uname -m | sed -e s/i.86/x86/ -e s/x86_64/x86/ \
> +                                -e s/sun4u/sparc64/ \
> +                                -e s/arm.*/arm/ -e s/sa110/arm/ \
> +                                -e s/s390x/s390/ -e s/parisc64/parisc/ \
> +                                -e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
> +                                -e s/sh[234].*/sh/ -e s/aarch64.*/arm64/ )
> +
>  ifndef ($(ARCH))
> -ARCH ?= $(shell uname -m)
> -ifeq ($(ARCH),x86_64)
> -ARCH := x86
> -endif
> +ARCH ?= $(HOSTARCH)
>  endif
>  
>  # always use the host compiler
> @@ -26,7 +30,7 @@ OBJTOOL_IN := $(OBJTOOL)-in.o
>  
>  all: $(OBJTOOL)
>  
> -INCLUDES := -I$(srctree)/tools/include -I$(srctree)/tools/arch/$(ARCH)/include/uapi
> +INCLUDES := -I$(srctree)/tools/include -I$(srctree)/tools/arch/$(HOSTARCH)/include/uapi
>  CFLAGS   += -Wall -Werror $(EXTRA_WARNINGS) -fomit-frame-pointer -O2 -g $(INCLUDES)
>  LDFLAGS  += -lelf $(LIBSUBCMD)
>  

That gets me this errors from the x86_64 allmodconfig build:

tools/objtool/objtool-in.o: In function `decode_instructions':
tools/objtool/builtin-check.c:276: undefined reference to `arch_decode_instruction'

It just looks like objtool was not written with cross compilation in
mind?  It seems to build and run OK when you remove the test that
checks that BITS_PER_LONG and __BITS_PER_LONG are the same, but I have
no idea if it getting the desired results.
-- 
Cheers,
Stephen Rothwell
