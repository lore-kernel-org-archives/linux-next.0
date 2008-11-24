From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the ftrace tree
Date: Mon, 24 Nov 2008 03:11:34 +0100
Message-ID: <20081124021134.GA23669@elte.hu>
References: <20081124111112.fa876dce.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:54178 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751585AbYKXCL4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 23 Nov 2008 21:11:56 -0500
Content-Disposition: inline
In-Reply-To: <20081124111112.fa876dce.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Steven Rostedt <srostedt@redhat.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the ftrace tree got a conflict in
> kernel/trace/ftrace.c between commits
> 820432783190b4096499e38a4a4d7095c511913d ("ftrace: make filtered
> functions effective on setting") and
> 32464779a1b8c15e9aa9aa0306b2f735080df9d8 ("ftrace: fix dyn ftrace filter
> selection") from Linus' tree and commit ftrace_startup ("ftrace: add
> quick function trace stop") from the ftrace tree.
> 
> I fixed it up (see below - which may not be correct) but it needs to be
> fixed in the ftrace tree.

hm, latest tip/auto-ftrace-next has no merge commit with -git. But i 
reintegrated it about an hour before you sent this mail - maybe you've 
got the old branch still?

	Ingo
