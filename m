From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Fri, 11 Aug 2017 14:44:25 +0200
Message-ID: <20170811124425.mubdjge6h6qse7na@gmail.com>
References: <20170811175326.36d546dc@canb.auug.org.au>
 <20170811093449.w5wttpulmwfykjzm@hirez.programming.kicks-ass.net>
 <20170811214556.322b3c4e@canb.auug.org.au>
 <20170811115607.p2vgqcp7w3wurhvw@gmail.com>
 <20170811121742.sv3tfysnydsqpg2a@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:36424 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752616AbdHKMo3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 11 Aug 2017 08:44:29 -0400
Content-Disposition: inline
In-Reply-To: <20170811121742.sv3tfysnydsqpg2a@hirez.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nadav Amit <namit@vmware.com>, Linus <torvalds@linux-foundation.org>


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Fri, Aug 11, 2017 at 01:56:07PM +0200, Ingo Molnar wrote:
> > I've done a minimal conflict resolution merge locally. Peter, could you please 
> > double check my resolution, in:
> > 
> >   040cca3ab2f6: Merge branch 'linus' into locking/core, to resolve conflicts
> 
> That merge is a bit wonky, but not terminally broken afaict.
> 
> It now does two TLB flushes, the below cleans that up.

Cool, thanks - I've applied it as a separate commit, to reduce the evilness of the 
merge commit.

Will push it all out in time to make Stephen's Monday morning a bit less of a 
Monday morning.

Thanks,

	Ingo
