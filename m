From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: linux-next: build failure after merge of the final tree (tip
	tree related)
Date: Wed, 23 Jun 2010 18:55:25 +0200
Message-ID: <20100623165523.GG5242@nowhere>
References: <20100624023117.219953e4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100624023117.219953e4.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Paul Mundt <lethal@linux-sh.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,


On Thu, Jun 24, 2010 at 02:31:17AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (sh allnoconfig -
> in fact, all the sh configs) failed like this:
> 
> cc1: warnings being treated as errors
> In file included from include/linux/ftrace_event.h:8,
>                  from include/trace/syscall.h:6,
>                  from include/linux/syscalls.h:75,
>                  from arch/sh/kernel/sys_sh32.c:9:
> include/linux/perf_event.h:937: error: 'struct regs' declared inside parameter list
> include/linux/perf_event.h:937: error: its scope is only this definition or declaration, which is probably not what you want
> include/linux/perf_event.h: In function 'perf_fetch_caller_regs':
> include/linux/perf_event.h:952: error: passing argument 1 of 'perf_arch_fetch_caller_regs' from incompatible pointer type
> 
> This started after next-20100618.
> 
> Caused by commit b0f82b81fe6bbcf78d478071f33e44554726bc81 ("perf: Drop
> the skip argument from perf_arch_fetch_regs_caller") which contained a
> typo in the type of the first argument to perf_arch_fetch_caller_regs()
> in the case that the architecture did not define
> perf_arch_fetch_caller_regs.


There is a pending fix:

From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
[PATCH] perf: Fix argument of perf_arch_fetch_caller_regs

I'm going to send a pull request to Ingo so that gets fixed soon.

Thanks.
