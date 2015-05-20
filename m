From: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
Subject: Re: linux-next: Tree for May 18 (mm/memory-failure.c)
Date: Wed, 20 May 2015 05:36:15 +0000
Message-ID: <20150520053614.GA6236@hori1.linux.bs1.fc.nec.co.jp>
References: <20150518185226.23154d47@canb.auug.org.au>
 <555A0327.9060709@infradead.org>
 <20150519024933.GA1614@hori1.linux.bs1.fc.nec.co.jp>
 <20150519094636.67c9a4a3@gandalf.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from TYO202.gate.nec.co.jp ([210.143.35.52]:54654 "EHLO
	tyo202.gate.nec.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750920AbbETFvy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 May 2015 01:51:54 -0400
In-Reply-To: <20150519094636.67c9a4a3@gandalf.local.home>
Content-Language: ja-JP
Content-ID: <56B25FA28FD4A84F86BB48F7605F9912@gisp.nec.co.jp>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Jim Davis <jim.epost@gmail.com>, Chen Gong <gong.chen@linux.intel.com>

On Tue, May 19, 2015 at 09:46:36AM -0400, Steven Rostedt wrote:
...
> > diff --git a/include/ras/ras_event.h b/include/ras/ras_event.h
> > index 1443d79e4fe6..43054c0fcf65 100644
> > --- a/include/ras/ras_event.h
> > +++ b/include/ras/ras_event.h
> > @@ -1,6 +1,8 @@
> >  #undef TRACE_SYSTEM
> >  #define TRACE_SYSTEM ras
> >  #define TRACE_INCLUDE_FILE ras_event
> > +#undef TRACE_INCLUDE_PATH
> > +#define TRACE_INCLUDE_PATH ../../include/ras
> 
> Note, ideally, you want:
> 
> #define TRACE_INCLUDE_PATH .

OK, so we had better move include/ras/ras_event.h under include/trace/events.
I'll do this in a separate work.

> and change the Makefile to have:
> 
> CFLAGS_ras.o := -I$(src)

It seems that if we do both of these, I hit the following error:

    CC      drivers/ras/ras.o
  In file included from include/trace/events/ras_event.h:327,
                   from drivers/ras/ras.c:13:
  include/trace/define_trace.h:83:43: error: ./ras_event.h: No such file or directory

, so I guess it's enough to do either.

> ...
> 
> 
> >  
> >  #if !defined(_TRACE_HW_EVENT_MC_H) || defined(TRACE_HEADER_MULTI_READ)
> >  #define _TRACE_HW_EVENT_MC_H
> > diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> > index 8cbe23ac1056..e88e14d87571 100644
> > --- a/mm/memory-failure.c
> > +++ b/mm/memory-failure.c
> > @@ -57,6 +57,7 @@
> >  #include <linux/mm_inline.h>
> >  #include <linux/kfifo.h>
> >  #include "internal.h"
> > +#define CREATE_TRACE_POINTS
> >  #include "ras/ras_event.h"
> 
> Um, you can only define CREATE_TRACE_POINTS for a single instance.
> Otherwise you will be making duplicate functions with the same name and
> same variables.
> 
> That is, you must either pick CREATE_TRACE_POINTS for ras_event.h in
> mm/memory-failure.c or drivers/ras/ras.c. Not both.

OK, so it seems that the root cause of the original error is a wrong
dependency among CONFIGs.
CONFIG_RAS should depend on CONFIG_MEMORY_FAILURE, but that is not true
(CONFIG_RAS=n and CONFIG_MEMORY_FAILURE=y in Randy's .config.)
This problem is visible when CONFIG_X86_64=n and CONFIG_SPARSEMEM=n (and all
other dependencies of CONFIG_RAS from ACPI_EXTLOG/PCIEAER/EDAC are false).
I'll fix such dependency.

Thanks,
Naoya Horiguchi