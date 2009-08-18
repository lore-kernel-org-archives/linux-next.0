From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [GIT PULL] tracing: Syscalls trace events + perf support
Date: Tue, 18 Aug 2009 09:32:11 +0200
Message-ID: <20090818073211.GA26670@elte.hu>
References: <1250016545-6601-1-git-send-email-fweisbec@gmail.com> <20090812091133.GA21655@elte.hu> <20090818004654.GA4402@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:55398 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751026AbZHRHcn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 18 Aug 2009 03:32:43 -0400
Content-Disposition: inline
In-Reply-To: <20090818004654.GA4402@linux-sh.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mundt <lethal@linux-sh.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Jason Baron <jbaron@redhat.com>, Frederic Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.o>


* Paul Mundt <lethal@linux-sh.org> wrote:

> [ Adding to Cc everyone that now has a broken tree thanks to this .. ]
> 
> On Wed, Aug 12, 2009 at 11:11:33AM +0200, Ingo Molnar wrote:
> > * Frederic Weisbecker <fweisbec@gmail.com> wrote:
> > > This pull request integrate one cleanup/fix for ftrace and an 
> > > update for syscall tracing: the migration from old-style tracer to 
> > > individual tracepoints/trace_events and the support for perf 
> > > counter.
> > > 
> > > I've tested it with success either with ftrace (every syscall 
> > > tracepoints enabled at the same time without problems) and with 
> > > perfcounter.
> > > 
> > > May be one drawback: it creates so much trace events that the 
> > > ftrace selftests can take some time :-)
> > 
> > Pulled, thanks a lot!
> 
> And this has now subsequently broken every single SH and S390 
> configuration, [...]

I test SH cross-builds regularly. I just checked the SH defconfig 
and it builds just fine here:

$ make -j32 CROSS_COMPILE=sh3-linux- ARCH=sh vmlinux

...
  CC      init/version.o
  LD      init/built-in.o
  LD      .tmp_vmlinux1
  KSYM    .tmp_kallsyms1.S
  AS      .tmp_kallsyms1.o
  LD      .tmp_vmlinux2
  KSYM    .tmp_kallsyms2.S
  AS      .tmp_kallsyms2.o
  LD      vmlinux
  SYSMAP  System.map
  SYSMAP  .tmp_System.map

 phoenix:~/linux/linux> head .config 
 #
 # Automatically generated make config: don't edit
 # Linux kernel version: 2.6.31-rc6
 # Tue Aug 18 09:24:28 2009
 #
 CONFIG_SUPERH=y
 CONFIG_SUPERH32=y
 # CONFIG_SUPERH64 is not set
 CONFIG_ARCH_DEFCONFIG="arch/sh/configs/shx3_defconfig"

AFAICS SH does not even have any syscall tracing added upstream. 
Apparently you added them in the SH tree and then they got 
integrated in linux-next, and the integrated end result broke?

Mind putting those bits into a separate Git branch and sending them 
to the tracing tree too so that we can make sure it's properly 
integrated and tested and that any changes to the generic facility 
are propagated to SH too?

Thanks,

	Ingo
