From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next:  build warning
Date: Fri, 26 Sep 2008 21:17:34 -0400 (EDT)
Message-ID: <alpine.DEB.1.10.0809262117070.29360@gandalf.stny.rr.com>
References: <20080919071758.b4ddf90d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.124]:38386 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750886AbYI0BRh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 26 Sep 2008 21:17:37 -0400
In-Reply-To: <20080919071758.b4ddf90d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>


On Fri, 19 Sep 2008, Stephen Rothwell wrote:

> Hi all,
> 
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
> 
> In file included from kernel/trace/trace_stack.c:6:
> include/linux/stacktrace.h:13: warning: 'struct task_struct' declared inside parameter list
> include/linux/stacktrace.h:13: warning: its scope is only this definition or declaration, which is probably not what you want
> 
> I just noticed this in passing.

Ah, I've seen this too. If it is not already fixed, I'll have to send Ingo 
a patch.

Thanks,

-- Steve
