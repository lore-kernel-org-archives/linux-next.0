From: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Wed, 7 Dec 2016 11:49:35 -0300
Message-ID: <20161207144935.GH8257@kernel.org>
References: <20161207123711.795d97bb@canb.auug.org.au>
 <20161207074514.GA10616@gmail.com>
 <20161207081215.GA13808@krava>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161207081215.GA13808@krava>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Olsa <jolsa@redhat.com>
Cc: Ingo Molnar <mingo@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Arnaldo Carvalho de Melo <acme@infradead.org>, Peter Foley <pefoley2@pefoley.com>, Wang Nan <wangnan0@huawei.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Em Wed, Dec 07, 2016 at 09:12:15AM +0100, Jiri Olsa escreveu:
> On Wed, Dec 07, 2016 at 08:45:14AM +0100, Ingo Molnar wrote:
> 
> SNIP
> 
> > * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > > Hi all,
> > > 
> > > After merging the tip tree, today's linux-next build (powerpc64le perf)
> > > failed like this:
> > > 
> > >   LINK     /home/sfr/next/perf/fixdep
> > > /bin/sh: 1: /home/sfr/next/perf//fixdep: Permission denied
> > > tools/build/Makefile.build:91: recipe for target '/home/sfr/next/perf/pmu-events/jevents.o' failed
> > > 
> > > $ ls -l /home/sfr/next/perf/fixdep
> > > -rwxr-xr-x 1 sfr users 71104 Dec  7 12:26 /home/sfr/next/perf/fixdep
> > > 
> > > I am not sure what caused this, but redoing the build succeeded, so I
> > > have just filed this report and left it for today.
> 
> this seems to be the rare race issue caused by missing fixdep dependency,
> caused probably by recompiling of fixdep because of its change in the merge
> 
> Arnaldo already carries a fix for this in his latest perf/core, where
> we moved the fixdep compilation on top of everything to kill any future
> race due to missing fixdep dependency

I'll push it today, will stop processing other stuff now and prepare a
pull request,

- Arnaldo
 
> thanks,
> jirka
