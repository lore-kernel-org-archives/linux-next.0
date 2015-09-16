From: Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Wed, 16 Sep 2015 11:17:05 -0300
Message-ID: <20150916141705.GD2346@redhat.com>
References: <20150916101245.60235b54@canb.auug.org.au>
 <20150916061652.GB22064@krava.redhat.com>
 <20150916063817.GC22064@krava.redhat.com>
 <20150916173025.7913543a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150916173025.7913543a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Olsa <jolsa@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>
List-Id: linux-next.vger.kernel.org

Em Wed, Sep 16, 2015 at 05:30:25PM +1000, Stephen Rothwell escreveu:
> Hi Jiri,
> 
> On Wed, 16 Sep 2015 08:38:17 +0200 Jiri Olsa <jolsa@redhat.com> wrote:
> >
> > > > Also, building perf seems to ignore O=<dir> on the make invocation.
> > > > Is that expected?
> > > 
> > > hum, not sure about this one.. I'm not using it, but we have
> > > tests for this and I thought we're ok.. I'll check
> > 
> > seems to work on latest Arnaldo's perf/core,
> > what command line failed for you?
> > 
> > [jolsa@krava perf]$ make O=/tmp/krava/
> > ...
> > [jolsa@krava perf]$ ll /tmp/krava/perf
> > -rwxrwxr-x. 1 jolsa jolsa 12669704 Sep 16 08:36 /tmp/krava/perf
> 
> Thanks for the hint.  I was using a relative path and starting in the
> top of the kernel tree, so:

> $ cd kernel
> $ mkdir ../perf
> $ make -s -C tools/perf JOBS=24 O=../perf
> 
> put everything in toos/perf (no suprise really)
> 
> I will change my script to use an absolute path (which I checked does
> work fine).  Sorry for the noise.

Nice workaround, but I guess relative paths should be supported as well,
right? :)

- Arnaldo
