From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] tracing: fix a build error on alpha and m68k
Date: Thu, 23 Oct 2008 18:55:04 +0200
Message-ID: <20081023165504.GB25697@elte.hu>
References: <c62985530810230548t1b569f61g34d1900bb94fde83@mail.gmail.com> <c62985530810230615s3252a54ao6488e763d72dc939@mail.gmail.com> <49008D12.5090204@gmail.com> <Pine.LNX.4.64.0810231635440.18978@anakin> <c62985530810230757r411b4e3dj4ecec649cf8cf0b3@mail.gmail.com> <Pine.LNX.4.64.0810231727430.18978@anakin> <4900B414.7090002@gmail.com> <20081023163433.GA3160@x200.localdomain> <20081023163850.GB16591@elte.hu> <c62985530810230951u7ae640d5ya45bed466f030074@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:48076 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753653AbYJWQzY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Oct 2008 12:55:24 -0400
Content-Disposition: inline
In-Reply-To: <c62985530810230951u7ae640d5ya45bed466f030074@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?iso-8859-1?Q?Fr=E9d=E9ric?= Weisbecker <fweisbec@gmail.com>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>


* Fr=E9d=E9ric Weisbecker <fweisbec@gmail.com> wrote:

> But they should be able to use the tracing for several other tracers.=
=20
> One other problem is that you need CONFIG_TRACE_IRQFLAGS (is that a=20
> lockdep or just trace feature?) to use any tracer since the=20
> tracing_cpumask file is always created for all tracer. This file has=20
> tracing_cpumask_write() as a write operation, and this func uses=20
> raw_local_funcs....
>=20
> Perhaps we should disable the tracing_cpu_mask related things if=20
> TRACE_IRQFLAGS in not configured?

to answer the "is that a lockdep or just trace feature" question:

trace-irqflags was first written by me for the (crude) ftrace-precursor=
=20
latency tracer code in -rt, years ago. Then i reused it (and changed it=
=20
alot) for upstream lockdep, two years ago. Then ftrace came in this yea=
r=20
and reused it.

so it's rather symbiotic ;-)

So ... the tracers that rely on irqflags-tracing should definitely be=20
limited to architectures that provide TRACE_IRQFLAGS. The core trace.c=20
itself should probably not be restricted ... (and it should definitely=20
build)

	Ingo
