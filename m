From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the rr tree
Date: Mon, 5 Jan 2009 13:47:45 +0100
Message-ID: <20090105124745.GC29758@elte.hu>
References: <20090105143239.08b1a060.sfr@canb.auug.org.au> <200901051727.11403.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:60751 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750928AbZAEMsR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 5 Jan 2009 07:48:17 -0500
Content-Disposition: inline
In-Reply-To: <200901051727.11403.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Christoph Lameter <cl@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>


* Rusty Russell <rusty@rustcorp.com.au> wrote:

> On Monday 05 January 2009 14:02:39 Stephen Rothwell wrote:
> > Hi Rusty,
> > 
> > Today's linux-next merge of the rr tree got a conflict in kernel/module.c
> > between commit d3794979a8a80c222ce9d016a6dfc4bed36965d0 ("Zero based
> > percpu: infrastructure to rebase the per cpu area to zero") from the
> > tip-core tree and the cpualloc patches from the rr tree.
> 
> That's a sweet patch, but there are a few issues with it.  Main one is
> that noone sets CONFIG_HAVE_ZERO_BASED_PER_CPU yet.  Is there more sitting
> outside the tree, Mike?
> 
> 1) Author is wrong.  This is Christoph's, not Mike's.

yes - as can be seen from the signoff lineup. Mike's scripts ate a From: 
line i guess. (this was months ago)

> 2) module.c now includes asm/sections.h twice.
> 3) We do still need RELOC_HIDE: it's for the compiler, not us.  It
>    can otherwise make assumptions about pointers remaining within objects.
> 4) Defining SHIFT_PERCPU_PTR for UP, and DEFINE_PER_CPU_FIRST are currently
>    unnecessary.  I assume for future patches, but I want to see them!

i'm inclined to drop all of tip/core/percpu where these are located:

 41f395c: Merge commit 'v2.6.28-rc8' into core/percpu
 d74f61b: Merge branch 'linus' into core/percpu
 f8d90d9: percpu: zero based percpu build error on s390
 cfcfdff: Merge branch 'linus' into core/percpu
 d379497: Zero based percpu: infrastructure to rebase the per cpu area to zero
 b3a0cb4: x86: extend percpu ops to 64 bit

i didnt send them to Linus in this merge window because it was visibly 
orphaned.

That would allow Mike, Christoph and you to work this out cleanly from 
scratch. It would also solve your merge conflict.

Does that sound like a good solution?

	Ingo
