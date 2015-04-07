From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Tue, 7 Apr 2015 10:48:29 +0200
Message-ID: <20150407084829.GA9577@gmail.com>
References: <20150407171858.2ad46594@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:35868 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751075AbbDGIse (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Apr 2015 04:48:34 -0400
Content-Disposition: inline
In-Reply-To: <20150407171858.2ad46594@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@plumgrid.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the tip tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> kernel/events/core.c: In function 'perf_event_set_bpf_prog':
> kernel/events/core.c:6732:15: error: 'struct bpf_prog_aux' has no member named 'prog_type'
>   if (prog->aux->prog_type != BPF_PROG_TYPE_KPROBE) {
>                ^
> 
> Caused by commit 2541517c32be ("tracing, perf: Implement BPF programs
> attached to kprobes").

Note, this must be some (rarely triggered) aspect of the ppc64 
defconfig that neither x86 randconfigs nor most other arch defconfigs 
expose?

Thanks,

	Ingo
