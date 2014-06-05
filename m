From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: linux-next: build warning after merge of the ftrace tree
Date: Thu, 5 Jun 2014 08:20:12 +0800
Message-ID: <20140605002012.GA10446@localhost>
References: <20140604160921.4f4e69c4@canb.auug.org.au>
 <20140604122612.366e2874@gandalf.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140604122612.366e2874@gandalf.local.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, Jun 04, 2014 at 12:26:12PM -0400, Steven Rostedt wrote:
> On Wed, 4 Jun 2014 16:09:21 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi Steven,
> > 
> > After merging the ftrace tree, today's linux-next build (x86_64 allmodconfig)
> > produced this warning:
> > 
> > kernel/trace/trace_benchmark.c: In function 'trace_do_benchmark':
> > kernel/trace/trace_benchmark.c:38:6: warning: unused variable 'seedsq' [-Wunused-variable]
> >   u64 seedsq;
> >       ^
> > 
> > Introduced by commit 81dc9f0ef21e ("tracing: Add tracepoint benchmark tracepoint").
> 
> Hmm, I don't know why my tests missed this. I do a allmodconfig looking
> for new warning messages too. Oh, but I do need to add this config to my
> regular testing config :-/
> 
> I'm surprised Wu's bot didn't report it either.

Steven, it was reported, here is the email archive:

https://lists.01.org/pipermail/kbuild-all/2014-May/004749.html

Thanks,
Fengguang
