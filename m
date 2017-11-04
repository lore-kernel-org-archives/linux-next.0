From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: linux-next: build warnings after merge of the tip tree
Date: Sat, 4 Nov 2017 21:16:05 +0900
Message-ID: <20171104211605.ce02abd1ea46c248105617bf@kernel.org>
References: <20171102135351.24ee83f9@canb.auug.org.au>
        <20171104060034.4aae72a524c428c9fcb98152@kernel.org>
        <20171104080134.7i6vv2avlxqdvvz3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:40008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752362AbdKDMQJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 4 Nov 2017 08:16:09 -0400
In-Reply-To: <20171104080134.7i6vv2avlxqdvvz3@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, 4 Nov 2017 09:01:34 +0100
Ingo Molnar <mingo@kernel.org> wrote:

> 
> * Masami Hiramatsu <mhiramat@kernel.org> wrote:
> 
> > > net/sctp/probe.c: In function 'sctpprobe_exit':
> > > net/sctp/probe.c:240:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
> > >   unregister_jprobe(&sctp_recv_probe);
> > >   ^
> > > In file included from net/sctp/probe.c:28:0:
> > > include/linux/kprobes.h:479:33: note: declared here
> > >  static inline void __deprecated unregister_jprobe(struct jprobe *p)
> > >                                  ^
> > > 
> > > Introduced by commit
> > > 
> > >   590c84593045 ("kprobes: Disable the jprobes APIs")
> > > 
> > > These days we normally don't deprecate things, just remove them.  But we
> > > do that *after* fixing up all the usages in the tree, please.
> > 
> > OK, should I remove __deprecated or revert above patch?
> > I pinged such users but no response. I can just rewrite it but not sure they can reply.
> 
> Ideal would be to just fix all these places: convert code where the facility 
> appears to be actively used, remove code where it looks unused. If maintainers 
> don't reply, I can apply them to a separate branch in -tip.

Thanks, that will help me.

> 
> For example I'm pretty sure we can just remove the jprobes usage in SCTP.

Actually TCP and DCCP jprobes usages are similar to that SCTP usage 
(maybe derived from TCP one). For those usages, we can not replace
it with kprobe/ftrace because it depends on the arguments of target funcs.
For such use-cases, we have 3 options;
 - Remove entirely feature if possible (like no more used).
 - Replace it with trace-events, and handle the event from kernel as sched tracer does.
 - Just introduce trace-events, remove usage, and trace it via ftrace or perf.

At a glance, all network probes are just used for printing out the event,
so we can just introduce trace-events and remove usage. I will try it.

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
