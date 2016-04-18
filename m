From: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Mon, 18 Apr 2016 10:24:02 -0300
Message-ID: <20160418132402.GA3677@kernel.org>
References: <20160414121418.288bd117@canb.auug.org.au>
 <20160415211542.GF2439@redhat.com>
 <20160415212831.GT9056@kernel.org>
 <20160417121207.GC31336@krava.brq.redhat.com>
 <20160417130405.GD31336@krava.brq.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:51267 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751054AbcDRNYI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Apr 2016 09:24:08 -0400
Content-Disposition: inline
In-Reply-To: <20160417130405.GD31336@krava.brq.redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Olsa <jolsa@redhat.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Em Sun, Apr 17, 2016 at 03:04:05PM +0200, Jiri Olsa escreveu:
> On Sun, Apr 17, 2016 at 02:12:07PM +0200, Jiri Olsa wrote:
> > On Fri, Apr 15, 2016 at 06:28:31PM -0300, Arnaldo Carvalho de Melo wrote:
> > > Em Fri, Apr 15, 2016 at 06:15:42PM -0300, Arnaldo Carvalho de Melo escreveu:
> > > > Em Thu, Apr 14, 2016 at 12:14:18PM +1000, Stephen Rothwell escreveu:
> > > > > Hi all,
> > > > > 
> > > > > After merging the tip tree, today's linux-next build (powerpc64le perf)
> > > > > failed like this:
> > > > > 
> > > > > make[3]: *** No rule to make target '/home/sfr/next/perf/arch/x86/include/generated/asm/syscalls_64.c', needed by '/home/sfr/next/perf/util/syscalltbl.o'.  Stop.
> > > > > 
> > > > > (I build in /home/sfr/next/next with objects in /home/sfr/next/perf.)
> > > > > 
> > > > > Presumably caused by commit
> > > > > 
> > > > >   1b700c997500 ("perf tools: Build syscall table .c header from kernel's syscall_64.tbl")
> > > > > 
> > > > > I have reverted that commit for today (which fixes my build problem but
> > > > > may not be overall correct).
> > > > 
> > > > Right, I'm trying to figure out how to bet fix that, one way would be to
> > > > do:
> > > 
> > > Jiri, I think this is enough, i.e. I think we make sure, just like the
> > > kernel, that the archheaders target in tools/perf/arch/*/Makefile is
> > > called before doing all the other build, no?
> > > 
> > > I.e. when we get to build syscalltbl.o the syscalls_64.c file will be
> > > built already, limited testing seems to agree with this :-)
> > > 
> > > - Arnaldo
> > >  
> > > > diff --git a/tools/perf/util/Build b/tools/perf/util/Build
> > > > index 85a9ab62e23f..7fc4ac304ed6 100644
> > > > --- a/tools/perf/util/Build
> > > > +++ b/tools/perf/util/Build
> > > > @@ -150,7 +150,7 @@ CFLAGS_libstring.o     += -Wno-unused-parameter -DETC_PERFCONFIG="BUILD_STR($(ET
> > > >  CFLAGS_hweight.o       += -Wno-unused-parameter -DETC_PERFCONFIG="BUILD_STR($(ETC_PERFCONFIG_SQ))"
> > > >  CFLAGS_parse-events.o  += -Wno-redundant-decls
> > > >  
> > > > -$(OUTPUT)util/syscalltbl.o: util/syscalltbl.c arch/x86/entry/syscalls/syscall_64.tbl $(OUTPUT)arch/x86/include/generated/asm/syscalls_64.c FORCE
> > > > +$(OUTPUT)util/syscalltbl.o: util/syscalltbl.c FORCE
> > 
> > yep, having arch specific target in generic Build file is wrong
> > I'll have ppc64le available later today, I'll check on that
> 
> it looks ok, you can also now remove the whole syscalltbl.o override

Ok, so I'll add this and your Tested-by, ok?

- Arnaldo
 
> and archheaders needs to be called before the build starts,
> which is the case right now
> 
> thanks,
> jirka
> 
> 
> ---
> diff --git a/tools/perf/util/Build b/tools/perf/util/Build
> index 85a9ab62e23f..90229a88f969 100644
> --- a/tools/perf/util/Build
> +++ b/tools/perf/util/Build
> @@ -150,10 +150,6 @@ CFLAGS_libstring.o     += -Wno-unused-parameter -DETC_PERFCONFIG="BUILD_STR($(ET
>  CFLAGS_hweight.o       += -Wno-unused-parameter -DETC_PERFCONFIG="BUILD_STR($(ETC_PERFCONFIG_SQ))"
>  CFLAGS_parse-events.o  += -Wno-redundant-decls
>  
> -$(OUTPUT)util/syscalltbl.o: util/syscalltbl.c arch/x86/entry/syscalls/syscall_64.tbl $(OUTPUT)arch/x86/include/generated/asm/syscalls_64.c FORCE
> -	$(call rule_mkdir)
> -	$(call if_changed_dep,cc_o_c)
> -
>  $(OUTPUT)util/kallsyms.o: ../lib/symbol/kallsyms.c FORCE
>  	$(call rule_mkdir)
>  	$(call if_changed_dep,cc_o_c)
