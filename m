From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] tracing: fix a build error on alpha and m68k
Date: Thu, 23 Oct 2008 13:14:13 -0400 (EDT)
Message-ID: <alpine.DEB.1.10.0810231312480.1765@gandalf.stny.rr.com>
References: <20081023213637.eff9b414.sfr@canb.auug.org.au> <20081023121145.GB27984@x200.localdomain> <c62985530810230548t1b569f61g34d1900bb94fde83@mail.gmail.com> <c62985530810230615s3252a54ao6488e763d72dc939@mail.gmail.com> <49008D12.5090204@gmail.com>
 <Pine.LNX.4.64.0810231635440.18978@anakin> <c62985530810230757r411b4e3dj4ecec649cf8cf0b3@mail.gmail.com> <Pine.LNX.4.64.0810231727430.18978@anakin> <4900B414.7090002@gmail.com> <20081023163433.GA3160@x200.localdomain>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.123]:59509 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752991AbYJWROP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Oct 2008 13:14:15 -0400
In-Reply-To: <20081023163433.GA3160@x200.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Ingo Molnar <mingo@elte.hu>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


On Thu, 23 Oct 2008, Alexey Dobriyan wrote:
> > 
> > kernel/trace/trace.c: In function 'tracing_generic_entry_update':
> > kernel/trace/trace.c:658: error: implicit declaration of function 'irqs_disabled_flags'

This error concerns me more. We depend on this in the generic tracers.
Should we just add a stub function here when TRACE_IRQFLAGS is not 
supported?

-- Steve
