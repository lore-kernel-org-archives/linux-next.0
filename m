From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH/RFC] Re: linux-next: build failure after merge of the
 luto-misc tree
Date: Sat, 23 Jul 2016 15:08:45 +1000
Message-ID: <20160723150845.3af8e452@canb.auug.org.au>
References: <20160720095333.3034531c@canb.auug.org.au>
	<20160720025202.GB18962@kernel.org>
	<20160721092950.0047531e@canb.auug.org.au>
	<20160721131248.GH18962@kernel.org>
	<20160722092302.5a0a1544@canb.auug.org.au>
	<20160722034118.guckaniobf3f7czc@treble>
	<20160722143739.GI18962@kernel.org>
	<20160722191920.ej62fnspnqurbaa7@treble>
	<20160722193655.GJ18962@kernel.org>
	<20160722194416.pxbsnyhaqcyoigsj@treble>
	<20160722195734.GK18962@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36967 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750724AbcGWFIv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 23 Jul 2016 01:08:51 -0400
In-Reply-To: <20160722195734.GK18962@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Andy Lutomirski <luto@amacapital.net>, Arnaldo Carvalho de Melo <acme@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Arnaldo,

On Fri, 22 Jul 2016 16:57:34 -0300 Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
>
> Em Fri, Jul 22, 2016 at 02:44:17PM -0500, Josh Poimboeuf escreveu:
> > On Fri, Jul 22, 2016 at 04:36:55PM -0300, Arnaldo Carvalho de Melo wrote:  
> > > Em Fri, Jul 22, 2016 at 02:19:20PM -0500, Josh Poimboeuf escreveu:  
> > > > On Fri, Jul 22, 2016 at 11:37:39AM -0300, Arnaldo Carvalho de Melo wrote:  
> > > > > I.e. with the two patches I mentioned, that are equivalent to the last patch I
> > > > > sent to Stephen for testing, we would end up with HOSTARCH=powerpc and
> > > > > ARCH=x86, no?  
> 
> > > > Thanks for spelling it out, that helped a lot.  
> 
> > > Glad you liked it, I had to do it for my own sanity :-)  
> 
> > > And something that gave me mixed feelings was an e-mail from the kbuild
> > > test bot that noticed my perf/core changes and said that the build was
> > > broken for "make ARCH=x86_64", so I had to reinstate this part:  
> 
> > > ifeq ($(ARCH),x86_64)
> > > ARCH := x86
> > > endif  
> 
> > > Because, as you say, 'make ARCH=x86' works :-\ I think it will not be
> > > needed with your patch, right? I'm checking your patch below right now,  
> 
> > Yeah, that shouldn't be needed with my patch.  I think either would
> > work, but my patch is more of a permanent solution.  
> 
> Sure, I left it there because then we don't have bisection broke at that
> fix I made, i.e. 'make ARCH=x86_64' works at that point too.
> 
> I applied your patch and will push it to Ingo, now we must cross our
> fingers so that Stephen doesn't come back to us once more telling it is
> still broken :o)

Unfortunately, this is what I get when I just build perf/core:

  DESCEND  objtool
  CC       /home/sfr/next/x86_64_allmodconfig/tools/objtool/builtin-check.o
  LD       /home/sfr/next/x86_64_allmodconfig/tools/objtool/objtool-in.o
Warning: objtool: x86 instruction decoder differs from kernel
  LINK     /home/sfr/next/x86_64_allmodconfig/tools/objtool/objtool
In file included from /home/sfr/next/next/arch/x86/include/uapi/asm/bitsperlong.h:10:0,
                 from /home/sfr/next/next/include/uapi/asm-generic/int-ll64.h:11,
                 from /home/sfr/next/next/include/uapi/asm-generic/types.h:6,
                 from /home/sfr/next/next/arch/x86/include/uapi/asm/types.h:4,
                 from /home/sfr/next/next/tools/include/linux/types.h:9,
                 from /home/sfr/next/next/include/uapi/linux/elf.h:4,
                 from /home/sfr/next/next/arch/x86/entry/vdso/vdso2c.c:66:
/home/sfr/next/next/tools/include/asm-generic/bitsperlong.h:13:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
 #error Inconsistent word size. Check asm/bitsperlong.h
  ^

The be clear: this is a ppc64le hosted, x86_64 target cross build.

I than added the following patch, and the build finishes successfully.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Sat, 23 Jul 2016 14:35:40 +1000
Subject: [PATCH] x86: make the vdso2c compiler use the host architecture
 headers

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/entry/vdso/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
index 253b72eaade6..25e88c030c47 100644
--- a/arch/x86/entry/vdso/Makefile
+++ b/arch/x86/entry/vdso/Makefile
@@ -55,7 +55,7 @@ VDSO_LDFLAGS_vdso.lds = -m64 -Wl,-soname=linux-vdso.so.1 \
 $(obj)/vdso64.so.dbg: $(src)/vdso.lds $(vobjs) FORCE
 	$(call if_changed,vdso)
 
-HOST_EXTRACFLAGS += -I$(srctree)/tools/include -I$(srctree)/include/uapi -I$(srctree)/arch/x86/include/uapi
+HOST_EXTRACFLAGS += -I$(srctree)/tools/include -I$(srctree)/include/uapi -I$(srctree)/arch/$(SUBARCH)/include/uapi
 hostprogs-y			+= vdso2c
 
 quiet_cmd_vdso2c = VDSO2C  $@
-- 
2.8.1

There may be a more correct way to do this ...
-- 
Cheers,
Stephen Rothwell
