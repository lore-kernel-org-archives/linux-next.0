From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the sched tree
Date: Tue, 22 Jul 2008 11:13:26 +0200
Message-ID: <20080722091326.GB18673@elte.hu>
References: <20080722115457.46aa2c98.sfr@canb.auug.org.au> <20080722182834.73d5e293.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:48457 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752718AbYGVJNs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Jul 2008 05:13:48 -0400
Content-Disposition: inline
In-Reply-To: <20080722182834.73d5e293.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Roland McGrath <roland@redhat.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> On Tue, 22 Jul 2008 11:54:57 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the sched tree got a conflict in
> > include/asm-x86/thread_info.h between commit
> > 64f097331928b01d704047c1dbc738bb6d2a9bf9 ("x86 ptrace: unify
> > TIF_SINGLESTEP") from the  tree and commit
>                         ^^^^
> Linus'

thanks Stephen - i too had a resolution for this, pushed it out into 
auto-sched-next so the linux-next conflict should go away on your next 
iteration.

	Ingo
