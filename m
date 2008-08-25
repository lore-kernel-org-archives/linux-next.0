From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: ftrace tree build failure
Date: Mon, 25 Aug 2008 08:05:29 +0200
Message-ID: <20080825060529.GA14993@elte.hu>
References: <20080825130844.4d3a4399.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:43009 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750734AbYHYGFv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 02:05:51 -0400
Content-Disposition: inline
In-Reply-To: <20080825130844.4d3a4399.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> kernel/trace/ftrace.c: In function 'ftrace_record_ip':
> kernel/trace/ftrace.c:416: error: incompatible type for argument 1 of '_spin_lock_irqsave'
> kernel/trace/ftrace.c:433: error: incompatible type for argument 1 of '_spin_lock_irqsave'
> 
> (This is after I have disabled CONFIG_FTRACE_MCOUNT_RECORD)

hm, how have you disabled it? It's not an interactive option and it's 
always enabled when CONFIG_DYNAMIC_FTRACE is enabled. (that's how that 
build failure never got discovered)

> Introduced by commit 6dad8e07f4c10b17b038e84d29f3ca41c2e55cd0 ("ftrace:
> add necessary locking for ftrace records").  I have applied the following
> patch.

thanks, applied - the fix makes sense.

	Ingo
