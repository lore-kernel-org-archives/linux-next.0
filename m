From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 0/0] ftrace: fix hardirq.h for m68k
Date: Thu, 6 Nov 2008 22:21:48 +0100
Message-ID: <20081106212148.GB24579@elte.hu>
References: <20081106211307.944238362@goodmis.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754855AbYKFVW0@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20081106211307.944238362@goodmis.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org


* Steven Rostedt <rostedt@goodmis.org> wrote:

> Ingo and Stephen,
> 
> The problem that Alexey pointed out should be fixed by this trivial patch.
> 
> The following patches are in:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-2.6-trace.git
> 
>     branch: tip/devel
> 
> Steven Rostedt (1):
>       ftrace: split out hardirq ftrace code into own header

i've pulled that into tip/tracing/ftrace and have pushed out a new 
auto-ftrace-next for Stephen - thanks Steve!

	Ingo
