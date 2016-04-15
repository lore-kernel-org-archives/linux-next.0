From: Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Fri, 15 Apr 2016 18:15:42 -0300
Message-ID: <20160415211542.GF2439@redhat.com>
References: <20160414121418.288bd117@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160414121418.288bd117@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Olsa <jolsa@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, acme@kernel.org
List-Id: linux-next.vger.kernel.org

Em Thu, Apr 14, 2016 at 12:14:18PM +1000, Stephen Rothwell escreveu:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (powerpc64le perf)
> failed like this:
> 
> make[3]: *** No rule to make target '/home/sfr/next/perf/arch/x86/include/generated/asm/syscalls_64.c', needed by '/home/sfr/next/perf/util/syscalltbl.o'.  Stop.
> 
> (I build in /home/sfr/next/next with objects in /home/sfr/next/perf.)
> 
> Presumably caused by commit
> 
>   1b700c997500 ("perf tools: Build syscall table .c header from kernel's syscall_64.tbl")
> 
> I have reverted that commit for today (which fixes my build problem but
> may not be overall correct).

Right, I'm trying to figure out how to bet fix that, one way would be to
do:

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 85a9ab62e23f..7fc4ac304ed6 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -150,7 +150,7 @@ CFLAGS_libstring.o     += -Wno-unused-parameter -DETC_PERFCONFIG="BUILD_STR($(ET
 CFLAGS_hweight.o       += -Wno-unused-parameter -DETC_PERFCONFIG="BUILD_STR($(ETC_PERFCONFIG_SQ))"
 CFLAGS_parse-events.o  += -Wno-redundant-decls
 
-$(OUTPUT)util/syscalltbl.o: util/syscalltbl.c arch/x86/entry/syscalls/syscall_64.tbl $(OUTPUT)arch/x86/include/generated/asm/syscalls_64.c FORCE
+$(OUTPUT)util/syscalltbl.o: util/syscalltbl.c FORCE
 	$(call rule_mkdir)
 	$(call if_changed_dep,cc_o_c)
 

--------------------------------------------

Now trying to figure out how to, just for x86 to add a dep for those
files, but a arch specific thing shouldn't be in tools/perf/util/Build
anyway...

In the end I want this syscalltbl.c thing to know about all arches,
to remove the dependency on audit-libs as the way to map syscall ID to
name and vice-versa.

So I'll need all arches to generate that
arch/$(ARCH)/include/generated/asm/syscalls_64.c file, etc. Doing that
by copying from the kernel the files where such info is kept and having
a diff check as part of the perf build process, so that we can get
notified when it drifts while not tying tools/perf/  to anything outside
that can end up breaking the tools/ build when changes happen outside.

- Arnaldo
