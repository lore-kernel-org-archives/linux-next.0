From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Wed, 7 Dec 2016 08:45:14 +0100
Message-ID: <20161207074514.GA10616@gmail.com>
References: <20161207123711.795d97bb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161207123711.795d97bb@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Arnaldo Carvalho de Melo <acme@infradead.org>, Jiri Olsa <jolsa@redhat.com>, Peter Foley <pefoley2@pefoley.com>, Wang Nan <wangnan0@huawei.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org


Cc:-ing Arnaldo, Jiri, Wang Nan and Peter Foley - bug report quoted below.

This bug/race might have been introduced in the latest tooling bits:

  34c4a42791bb Merge tag 'perf-core-for-mingo-20161205' of git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux into perf/core

Which included these build system changes:

triton:~/tip> gll 78987584de42..perf/core
34c4a42791bb Merge tag 'perf-core-for-mingo-20161205' of 
git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux into perf/core
bec60e50af83 perf annotate: Show raw form for jump instruction with indirect target
d4dcadec43de perf tools: Add non config targets
207da4739e3e perf tools: Cleanup build directory before each test
0b4d4b076251 perf tools: Move python/perf.so target into rules area
5c319a67b13d perf tools: Move install-gtk target into rules area
2fedf79b69cf tools build: Move tabs to spaces where suitable
a5ba0a1a5af3 tools build: Make the .cmd file more readable
edd695b032ba perf clang: Compile BPF script using builtin clang support
5e08a76525b8 perf clang: Support compile IR to BPF object and add testcase
e67d52d411c3 perf clang: Update test case to use real BPF script
a9495fe9dc63 perf clang: Allow passing CFLAGS to builtin clang
77dfa84a843c perf clang: Use real file system for #include
00b86691c77c perf clang: Add builtin clang support ant test case
d58ac0bf8d1e perf build: Add clang and llvm compile and linking support
c7fb4f62e2a9 tools build: Add feature detection for clang
cb40d55b595c tools build: Add feature detection for LLVM
2bd42de0e196 perf llvm: Extract helpers in llvm-utils.c
8ad85e9e6fda perf tools: Pass context to perf hook functions
baa1973ebcf6 tools build: Fix objtool build with clang
1cd6472e3f8d tools build: Make fixdep parsing wait for last target

Thanks,

	Ingo


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the tip tree, today's linux-next build (powerpc64le perf)
> failed like this:
> 
>   LINK     /home/sfr/next/perf/fixdep
> /bin/sh: 1: /home/sfr/next/perf//fixdep: Permission denied
> tools/build/Makefile.build:91: recipe for target '/home/sfr/next/perf/pmu-events/jevents.o' failed
> 
> $ ls -l /home/sfr/next/perf/fixdep
> -rwxr-xr-x 1 sfr users 71104 Dec  7 12:26 /home/sfr/next/perf/fixdep
> 
> I am not sure what caused this, but redoing the build succeeded, so I
> have just filed this report and left it for today.
