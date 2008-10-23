From: "=?ISO-8859-1?Q?Fr=E9d=E9ric_Weisbecker?=" <fweisbec@gmail.com>
Subject: Re: [PATCH] tracing: fix a build error on alpha and m68k
Date: Thu, 23 Oct 2008 19:25:10 +0200
Message-ID: <c62985530810231025j69c38776q1244510bd7990c6f@mail.gmail.com>
References: <c62985530810230548t1b569f61g34d1900bb94fde83@mail.gmail.com>
	 <c62985530810230757r411b4e3dj4ecec649cf8cf0b3@mail.gmail.com>
	 <Pine.LNX.4.64.0810231727430.18978@anakin>
	 <4900B414.7090002@gmail.com> <20081023163433.GA3160@x200.localdomain>
	 <20081023163850.GB16591@elte.hu>
	 <c62985530810230951u7ae640d5ya45bed466f030074@mail.gmail.com>
	 <20081023165504.GB25697@elte.hu>
	 <c62985530810231006p726bb237qe288ec80b005d8b0@mail.gmail.com>
	 <alpine.DEB.1.10.0810231311170.1765@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from qb-out-0506.google.com ([72.14.204.228]:20443 "EHLO
	qb-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753581AbYJWRZM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Oct 2008 13:25:12 -0400
Received: by qb-out-0506.google.com with SMTP id f11so379103qba.17
        for <linux-next@vger.kernel.org>; Thu, 23 Oct 2008 10:25:11 -0700 (PDT)
In-Reply-To: <alpine.DEB.1.10.0810231311170.1765@gandalf.stny.rr.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@elte.hu>, Alexey Dobriyan <adobriyan@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

2008/10/23 Steven Rostedt <rostedt@goodmis.org>:
>
> On Thu, 23 Oct 2008, Fr?d?ric Weisbecker wrote:
>>
>> But to let the core trace.c to be built for other types of tracing,
>> the best thing I see is to put some ifdef CONFIG_TRACE_IRQFLAGS on the
>> tracing_cpumask functions and structure, and actually on the creation
>> of this file.
>
> Is there a reason that you use "raw_local_irq_disable" instead of
> local_irq_disable?


I'm not using anything :)
This is about the tracing_cpumask debugfs file implemented in trace.c
It's tracing_cpumask_write function uses the raw_local functions, I
guess because its locking doesn't need to be traced.
And the problem here is that some archs don't implement raw_local
functions and so trace.c doesn't compile with alpha or m68k.
But actually this file is not needed for them.
