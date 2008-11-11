From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 0/2] ftrace updates for 2.6.28
Date: Mon, 10 Nov 2008 22:27:01 -0500 (EST)
Message-ID: <alpine.DEB.1.10.0811102225470.12447@gandalf.stny.rr.com>
References: <20081111025808.946638585@goodmis.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:34903 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754164AbYKKD1F (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 10 Nov 2008 22:27:05 -0500
In-Reply-To: <20081111025808.946638585@goodmis.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>


On Mon, 10 Nov 2008, Steven Rostedt wrote:
> 
> The following patches are in:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-2.6-trace.git
> 
>     branch: devel
> 
> 
> Steven Rostedt (2):
>       ftrace: disable tracing on resize
>       ring-buffer: prevent infinite looping on time stamping
> 

Ingo,

I just pushed these two patches to tip/devel after solving a conflict with 
the first one.

-- Steve
