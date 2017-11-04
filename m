From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: build warnings after merge of the tip tree
Date: Sat, 4 Nov 2017 09:01:34 +0100
Message-ID: <20171104080134.7i6vv2avlxqdvvz3@gmail.com>
References: <20171102135351.24ee83f9@canb.auug.org.au>
 <20171104060034.4aae72a524c428c9fcb98152@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wr0-f169.google.com ([209.85.128.169]:46320 "EHLO
        mail-wr0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751559AbdKDIBi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 4 Nov 2017 04:01:38 -0400
Content-Disposition: inline
In-Reply-To: <20171104060034.4aae72a524c428c9fcb98152@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


* Masami Hiramatsu <mhiramat@kernel.org> wrote:

> > net/sctp/probe.c: In function 'sctpprobe_exit':
> > net/sctp/probe.c:240:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
> >   unregister_jprobe(&sctp_recv_probe);
> >   ^
> > In file included from net/sctp/probe.c:28:0:
> > include/linux/kprobes.h:479:33: note: declared here
> >  static inline void __deprecated unregister_jprobe(struct jprobe *p)
> >                                  ^
> > 
> > Introduced by commit
> > 
> >   590c84593045 ("kprobes: Disable the jprobes APIs")
> > 
> > These days we normally don't deprecate things, just remove them.  But we
> > do that *after* fixing up all the usages in the tree, please.
> 
> OK, should I remove __deprecated or revert above patch?
> I pinged such users but no response. I can just rewrite it but not sure they can reply.

Ideal would be to just fix all these places: convert code where the facility 
appears to be actively used, remove code where it looks unused. If maintainers 
don't reply, I can apply them to a separate branch in -tip.

For example I'm pretty sure we can just remove the jprobes usage in SCTP.

Thanks,

	Ingo
