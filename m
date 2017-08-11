From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Fri, 11 Aug 2017 13:56:07 +0200
Message-ID: <20170811115607.p2vgqcp7w3wurhvw@gmail.com>
References: <20170811175326.36d546dc@canb.auug.org.au>
 <20170811093449.w5wttpulmwfykjzm@hirez.programming.kicks-ass.net>
 <20170811214556.322b3c4e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:37415 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751995AbdHKL4L (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 11 Aug 2017 07:56:11 -0400
Content-Disposition: inline
In-Reply-To: <20170811214556.322b3c4e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nadav Amit <namit@vmware.com>, Linus <torvalds@linux-foundation.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Peter,
> 
> On Fri, 11 Aug 2017 11:34:49 +0200 Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Fri, Aug 11, 2017 at 05:53:26PM +1000, Stephen Rothwell wrote:
> > > 
> > > Today's linux-next merge of the akpm-current tree got conflicts in:
> > > 
> > >   include/linux/mm_types.h
> > >   mm/huge_memory.c
> > > 
> > > between commit:
> > > 
> > >   8b1b436dd1cc ("mm, locking: Rework {set,clear,mm}_tlb_flush_pending()")
> > > 
> > > from the tip tree and commits:
> > > 
> > >   16af97dc5a89 ("mm: migrate: prevent racy access to tlb_flush_pending")
> > >   a9b802500ebb ("Revert "mm: numa: defer TLB flush for THP migration as long as possible"")
> > > 
> > > from the akpm-current tree.
> > > 
> > > The latter 2 are now in Linus' tree as well (but were not when I started
> > > the day).
> >
> > Here's two patches that apply on top of tip.
> 
> What I will really need (on Monday) is a merge resolution between
> Linus' tree and the tip tree ...

I've done a minimal conflict resolution merge locally. Peter, could you please 
double check my resolution, in:

  040cca3ab2f6: Merge branch 'linus' into locking/core, to resolve conflicts

Thanks,

	Ingo
