From: Jiri Olsa <jolsa@redhat.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Wed, 16 Sep 2015 08:38:17 +0200
Message-ID: <20150916063817.GC22064@krava.redhat.com>
References: <20150916101245.60235b54@canb.auug.org.au>
 <20150916061652.GB22064@krava.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:44804 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751904AbbIPGiX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Sep 2015 02:38:23 -0400
Content-Disposition: inline
In-Reply-To: <20150916061652.GB22064@krava.redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>

On Wed, Sep 16, 2015 at 08:16:52AM +0200, Jiri Olsa wrote:
> On Wed, Sep 16, 2015 at 10:12:45AM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the tip tree, today's linux-next build (perf) failed
> > like this:
> > 
> > make[3]: *** No rule to make target 'tools/lib/api/fs/debugfs.h', needed by 'tools/perf/arch/common.o'.  Stop.
> > tools/build/Makefile.build:109: recipe for target 'arch' failed
> > make[4]: *** No rule to make target 'fs/debugfs.h', needed by 'tools/perf/fs/fs.o'.  Stop.
> > tools/build/Makefile.build:109: recipe for target 'fs' failed
> > make[3]: *** No rule to make target 'tools/lib/api/fs/debugfs.h', needed by 'tools/perf/util/abspath.o'.  Stop.
> > tools/build/Makefile.build:109: recipe for target 'util' failed
> > Makefile:32: recipe for target 'tools/perf/libapi-in.o' failed
> > Makefile.perf:417: recipe for target 'tools/perf/libapi.a' failed
> > Makefile.perf:393: recipe for target 'tools/perf/libperf-in.o' failed
> > Makefile:68: recipe for target 'all' failed
> > 
> > Maybe caused by commit
> > 
> >   60a1133a5b39 ("tools lib api fs: Remove debugfs, tracefs and findfs objects")
> > 
> > This is an incremental build i.e. I do not do a "make clean" after doing
> > the build for each tree merge (in case that matters).
> 
> it does in this case, removed header files stay in
> cmd build dependency file (like in .abspath.o.cmd above)
> and cause build error
> 
> build system is not smart enough yet to find out,
> I was postponning fixing this for some time now,
> I'll try to get this resolved asap
> 
> > 
> > I have used the tip tree from next-20150915 for today.
> > 
> > Also, building perf seems to ignore O=<dir> on the make invocation.
> > Is that expected?
> 
> hum, not sure about this one.. I'm not using it, but we have
> tests for this and I thought we're ok.. I'll check

seems to work on latest Arnaldo's perf/core,
what command line failed for you?

[jolsa@krava perf]$ make O=/tmp/krava/
...
[jolsa@krava perf]$ ll /tmp/krava/perf
-rwxrwxr-x. 1 jolsa jolsa 12669704 Sep 16 08:36 /tmp/krava/perf


jirka
