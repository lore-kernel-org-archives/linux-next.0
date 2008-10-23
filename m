From: "=?ISO-8859-1?Q?Fr=E9d=E9ric_Weisbecker?=" <fweisbec@gmail.com>
Subject: Re: [PATCH] tracing: fix a build error on alpha and m68k
Date: Thu, 23 Oct 2008 19:06:44 +0200
Message-ID: <c62985530810231006p726bb237qe288ec80b005d8b0@mail.gmail.com>
References: <c62985530810230548t1b569f61g34d1900bb94fde83@mail.gmail.com>
	 <49008D12.5090204@gmail.com>
	 <Pine.LNX.4.64.0810231635440.18978@anakin>
	 <c62985530810230757r411b4e3dj4ecec649cf8cf0b3@mail.gmail.com>
	 <Pine.LNX.4.64.0810231727430.18978@anakin>
	 <4900B414.7090002@gmail.com> <20081023163433.GA3160@x200.localdomain>
	 <20081023163850.GB16591@elte.hu>
	 <c62985530810230951u7ae640d5ya45bed466f030074@mail.gmail.com>
	 <20081023165504.GB25697@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gv-out-0910.google.com ([216.239.58.188]:35899 "EHLO
	gv-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753188AbYJWRGq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Oct 2008 13:06:46 -0400
Received: by gv-out-0910.google.com with SMTP id e6so33791gvc.37
        for <linux-next@vger.kernel.org>; Thu, 23 Oct 2008 10:06:44 -0700 (PDT)
In-Reply-To: <20081023165504.GB25697@elte.hu>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>

2008/10/23 Ingo Molnar <mingo@elte.hu>:
> to answer the "is that a lockdep or just trace feature" question:
>
> trace-irqflags was first written by me for the (crude) ftrace-precursor
> latency tracer code in -rt, years ago. Then i reused it (and changed it
> alot) for upstream lockdep, two years ago. Then ftrace came in this year
> and reused it.
>
> so it's rather symbiotic ;-)
>
> So ... the tracers that rely on irqflags-tracing should definitely be
> limited to architectures that provide TRACE_IRQFLAGS. The core trace.c
> itself should probably not be restricted ... (and it should definitely
> build)
>
>        Ingo
>

Ok, so perhaps it needs a kind of disambiguation between CONFIG_TRACE_IRQFLAGS
and CONFIG_TRACE_IRQFLAGS_SUPPORT :)

So, if those arch may not support irqflags, I should forget about
including linux/irqflags.h

But to let the core trace.c to be built for other types of tracing,
the best thing I see is to put some ifdef CONFIG_TRACE_IRQFLAGS on the
tracing_cpumask functions and structure, and actually on the creation
of this file.

No bad feelings about this solution?
