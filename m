From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: linux-next: build warnings after merge of the tip tree
Date: Sat, 4 Nov 2017 06:00:34 +0900
Message-ID: <20171104060034.4aae72a524c428c9fcb98152@kernel.org>
References: <20171102135351.24ee83f9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:55192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750772AbdKCVAh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 3 Nov 2017 17:00:37 -0400
In-Reply-To: <20171102135351.24ee83f9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>

On Thu, 2 Nov 2017 13:53:51 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> produced these warnings:
> 
> net/dccp/probe.c: In function 'dccpprobe_init':
> net/dccp/probe.c:166:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
>   ret = register_jprobe(&dccp_send_probe);
>   ^
> In file included from net/dccp/probe.c:26:0:
> include/linux/kprobes.h:471:32: note: declared here
>  static inline int __deprecated register_jprobe(struct jprobe *p)
>                                 ^
> net/dccp/probe.c:170:4: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
>     ret = register_jprobe(&dccp_send_probe);
>     ^
> In file included from net/dccp/probe.c:26:0:
> include/linux/kprobes.h:471:32: note: declared here
>  static inline int __deprecated register_jprobe(struct jprobe *p)
>                                 ^
> net/dccp/probe.c: In function 'dccpprobe_exit':
> net/dccp/probe.c:190:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
>   unregister_jprobe(&dccp_send_probe);
>   ^
> In file included from net/dccp/probe.c:26:0:
> include/linux/kprobes.h:479:33: note: declared here
>  static inline void __deprecated unregister_jprobe(struct jprobe *p)
>                                  ^
> net/ipv4/tcp_probe.c: In function 'tcpprobe_init':
> net/ipv4/tcp_probe.c:280:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
>   ret = register_jprobe(&tcp_jprobe);
>   ^
> In file included from net/ipv4/tcp_probe.c:24:0:
> include/linux/kprobes.h:471:32: note: declared here
>  static inline int __deprecated register_jprobe(struct jprobe *p)
>                                 ^
> net/ipv4/tcp_probe.c: In function 'tcpprobe_exit':
> net/ipv4/tcp_probe.c:298:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
>   unregister_jprobe(&tcp_jprobe);
>   ^
> In file included from net/ipv4/tcp_probe.c:24:0:
> include/linux/kprobes.h:479:33: note: declared here
>  static inline void __deprecated unregister_jprobe(struct jprobe *p)
>                                  ^
> net/sctp/probe.c: In function 'sctp_setup_jprobe':
> net/sctp/probe.c:189:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
>   int ret = register_jprobe(&sctp_recv_probe);
>   ^
> In file included from net/sctp/probe.c:28:0:
> include/linux/kprobes.h:471:32: note: declared here
>  static inline int __deprecated register_jprobe(struct jprobe *p)
>                                 ^
> net/sctp/probe.c:194:3: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
>    ret = register_jprobe(&sctp_recv_probe);
>    ^
> In file included from net/sctp/probe.c:28:0:
> include/linux/kprobes.h:471:32: note: declared here
>  static inline int __deprecated register_jprobe(struct jprobe *p)
>                                 ^
> net/sctp/probe.c: In function 'sctpprobe_exit':
> net/sctp/probe.c:240:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
>   unregister_jprobe(&sctp_recv_probe);
>   ^
> In file included from net/sctp/probe.c:28:0:
> include/linux/kprobes.h:479:33: note: declared here
>  static inline void __deprecated unregister_jprobe(struct jprobe *p)
>                                  ^
> 
> Introduced by commit
> 
>   590c84593045 ("kprobes: Disable the jprobes APIs")
> 
> These days we normally don't deprecate things, just remove them.  But we
> do that *after* fixing up all the usages in the tree, please.

OK, should I remove __deprecated or revert above patch?
I pinged such users but no response. I can just rewrite it but not sure they can reply.

Thank you,

> 
> -- 
> Cheers,
> Stephen Rothwell


-- 
Masami Hiramatsu <mhiramat@kernel.org>
