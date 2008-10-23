From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] tracing: fix a build error on alpha and m68k
Date: Thu, 23 Oct 2008 13:12:12 -0400 (EDT)
Message-ID: <alpine.DEB.1.10.0810231311170.1765@gandalf.stny.rr.com>
References: <c62985530810230548t1b569f61g34d1900bb94fde83@mail.gmail.com>  <49008D12.5090204@gmail.com>  <Pine.LNX.4.64.0810231635440.18978@anakin>  <c62985530810230757r411b4e3dj4ecec649cf8cf0b3@mail.gmail.com>  <Pine.LNX.4.64.0810231727430.18978@anakin>
 <4900B414.7090002@gmail.com> <20081023163433.GA3160@x200.localdomain>  <20081023163850.GB16591@elte.hu>  <c62985530810230951u7ae640d5ya45bed466f030074@mail.gmail.com>  <20081023165504.GB25697@elte.hu>
 <c62985530810231006p726bb237qe288ec80b005d8b0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.123]:47425 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752605AbYJWRMO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Oct 2008 13:12:14 -0400
In-Reply-To: <c62985530810231006p726bb237qe288ec80b005d8b0@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?ISO-8859-15?Q?Fr=E9d=E9ric_Weisbecker?= <fweisbec@gmail.com>
Cc: Ingo Molnar <mingo@elte.hu>, Alexey Dobriyan <adobriyan@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


On Thu, 23 Oct 2008, Fr?d?ric Weisbecker wrote:
> 
> But to let the core trace.c to be built for other types of tracing,
> the best thing I see is to put some ifdef CONFIG_TRACE_IRQFLAGS on the
> tracing_cpumask functions and structure, and actually on the creation
> of this file.

Is there a reason that you use "raw_local_irq_disable" instead of 
local_irq_disable?

-- Steve
