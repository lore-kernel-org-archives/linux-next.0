From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Wed, 30 Sep 2015 12:56:40 +1000
Message-ID: <20150930125640.5e3d6c25@canb.auug.org.au>
References: <20150916101245.60235b54@canb.auug.org.au>
	<20150916061652.GB22064@krava.redhat.com>
	<20150917103423.1663c15e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45575 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752256AbbI3C4m (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Sep 2015 22:56:42 -0400
In-Reply-To: <20150917103423.1663c15e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Olsa <jolsa@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>

Hi all,

On Thu, 17 Sep 2015 10:34:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> On Wed, 16 Sep 2015 08:16:52 +0200 Jiri Olsa <jolsa@redhat.com> wrote:
> >
> > On Wed, Sep 16, 2015 at 10:12:45AM +1000, Stephen Rothwell wrote:
> > > 
> > > After merging the tip tree, today's linux-next build (perf) failed
> > > like this:
> > > 
> > > make[3]: *** No rule to make target 'tools/lib/api/fs/debugfs.h', needed by 'tools/perf/arch/common.o'.  Stop.
> > > tools/build/Makefile.build:109: recipe for target 'arch' failed
> > > make[4]: *** No rule to make target 'fs/debugfs.h', needed by 'tools/perf/fs/fs.o'.  Stop.
> > > tools/build/Makefile.build:109: recipe for target 'fs' failed
> > > make[3]: *** No rule to make target 'tools/lib/api/fs/debugfs.h', needed by 'tools/perf/util/abspath.o'.  Stop.
> > > tools/build/Makefile.build:109: recipe for target 'util' failed
> > > Makefile:32: recipe for target 'tools/perf/libapi-in.o' failed
> > > Makefile.perf:417: recipe for target 'tools/perf/libapi.a' failed
> > > Makefile.perf:393: recipe for target 'tools/perf/libperf-in.o' failed
> > > Makefile:68: recipe for target 'all' failed
> > > 
> > > Maybe caused by commit
> > > 
> > >   60a1133a5b39 ("tools lib api fs: Remove debugfs, tracefs and findfs objects")
> > > 
> > > This is an incremental build i.e. I do not do a "make clean" after doing
> > > the build for each tree merge (in case that matters).
> > 
> > it does in this case, removed header files stay in
> > cmd build dependency file (like in .abspath.o.cmd above)
> > and cause build error
> > 
> > build system is not smart enough yet to find out,
> > I was postponning fixing this for some time now,
> > I'll try to get this resolved asap
> 
> OK, for now I will clean out my objdir before doing the perf build
> after the tip tree merge.  It would be nice to have this fixed, though,
> if possible.

I noticed some commits in the tip tree today that seemed as though they
were addressing this problem.  However, I still get a build failure if
I don't clean out the object directory before building tools/perf:

  BUILD:   Doing 'make -j48' parallel build
  GEN      /home/sfr/next/perf/common-cmds.h
  CC       /home/sfr/next/perf/fixdep.o
  LD       /home/sfr/next/perf/fixdep-in.o
  LINK     /home/sfr/next/perf/fixdep
  CC       /home/sfr/next/perf/perf-read-vdso32
  CC       /home/sfr/next/perf/perf-read-vdsox32
make[3]: *** No rule to make target '/home/sfr/next/next/tools/lib/api/fs/debugfs.h', needed by '/home/sfr/next/perf/ui/gtk/browser.o'.  Stop.
/home/sfr/next/next/tools/build/Makefile.build:116: recipe for target 'ui/gtk' failed
make[2]: *** [ui/gtk] Error 2
Makefile.perf:310: recipe for target '/home/sfr/next/perf/gtk-in.o' failed

(/home/sfr/next/perf/ is the object directory)
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
