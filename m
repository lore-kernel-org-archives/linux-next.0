From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH v2] perf: Fix unexported generic
	perf_arch_fetch_caller_regs
Date: Tue, 16 Mar 2010 00:54:52 +0100
Message-ID: <20100315235450.GB8849@nowhere>
References: <1268686806-7286-1-git-send-regression-fweisbec@gmail.com> <1268691442-8300-1-git-send-regression-fweisbec@gmail.com> <20100316093355.071fde51.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f219.google.com ([209.85.220.219]:44383 "EHLO
	mail-fx0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965803Ab0COXyu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Mar 2010 19:54:50 -0400
Content-Disposition: inline
In-Reply-To: <20100316093355.071fde51.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@elte.hu>, LKML <linux-kernel@vger.kernel.org>, " H . Peter Anvin " <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Linux Next <linux-next@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Xiao Guangrong <xiaoguangrong@cn.fujitsu.com>, Paul Mackerras <paulus@samba.org>

On Tue, Mar 16, 2010 at 09:33:55AM +1100, Stephen Rothwell wrote:
> Hi Frederic,
> 
> On Mon, 15 Mar 2010 23:17:22 +0100 Frederic Weisbecker <fweisbec@gmail.com> wrote:
> >
> > perf_arch_fetch_caller_regs() is exported for the overriden x86
> > version, but not for the generic weak version.
> > As a general rule, weak functions should have their symbol exported
>                                           ^
> "not"


Ooh, right.


 
> > in the same file they are defined.
> > 
> > So let's export it on trace_event_perf.c as it is used by trace
> > events only.
> 
> Otherwise, looks good (though I haven't tested it).



I've tested with some trace event built as module and it looks
fine so far.

Thanks.
