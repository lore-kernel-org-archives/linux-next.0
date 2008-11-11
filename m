From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 0/2] ftrace updates for 2.6.28
Date: Tue, 11 Nov 2008 09:23:47 +0100
Message-ID: <20081111082347.GB29901@elte.hu>
References: <20081111025808.946638585@goodmis.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:37159 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752481AbYKKIYJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 11 Nov 2008 03:24:09 -0500
Content-Disposition: inline
In-Reply-To: <20081111025808.946638585@goodmis.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>


* Steven Rostedt <rostedt@goodmis.org> wrote:

> The following patches are in:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-2.6-trace.git
> 
>     branch: devel
> 
> Steven Rostedt (2):
>       ftrace: disable tracing on resize
>       ring-buffer: prevent infinite looping on time stamping
> 
> ----
>  kernel/trace/ring_buffer.c |    2 +-
>  kernel/trace/trace.c       |   17 ++++++++++++++++-
>  2 files changed, 17 insertions(+), 2 deletions(-)

pulled into tip/tracing/urgent, thanks Steve!

> The following patches are needed for 2.6.28. The first one solves a 
> bug where the resizing of the buffer array was not protected against 
> modifications by ftrace.
> 
> The second patch solves an issue tha Thomas Gleixner was seeing 
> where the tracer would detect the infinite recursion too easily by 
> tracing the timer code. This patch prevents the loop from happening 
> and still does not lose any trace entries.
> 
> The changes caused by these patches are low in risk, but I would 
> still like to put them through linux-next before passing them off to 
> Linus.
> 
> Note, these changes are based against Linus's mainline and not tip. 
> Also note that the branch in this tree is "devel" and not 
> "tip/devel".

that's OK. I resolved the (trivial) conflict with pending changes in 
tip/tracing/ftrace and pushed out a new ftrace integration branch 
towards linux-next.

	Ingo
