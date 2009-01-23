From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the kmemcheck tree with the x86
	tree
Date: Fri, 23 Jan 2009 16:53:40 +0100
Message-ID: <20090123155340.GC16064@elte.hu>
References: <20090123154409.e3d1cd1d.sfr@canb.auug.org.au> <1232720514.6094.61.camel@penberg-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:36932 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756277AbZAWPx6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 23 Jan 2009 10:53:58 -0500
Content-Disposition: inline
In-Reply-To: <1232720514.6094.61.camel@penberg-laptop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Vegard Nossum <vegard.nossum@gmail.com>, linux-next@vger.kernel.org, Nick Piggin <npiggin@suse.de>


* Pekka Enberg <penberg@cs.helsinki.fi> wrote:

> Hi Stephen,
> 
> On Fri, 2009-01-23 at 15:44 +1100, Stephen Rothwell wrote:
> > Today's linux-next merge of the kmemcheck tree got a conflict in
> > arch/x86/mm/fault.c between commit do_page_fault ("x86: optimise x86's
> > do_page_fault (C entry point for the page fault path)") from the x86 tree
> > and commit 787ecfaa503dc63ff1831ddc74b15dad49bace1d ("x86: add hooks for
> > kmemcheck") from the kmemcheck tree.
> > 
> > I fixed it up (see below) but it is worth a check.  I can carry the fix
> > as necessary.
> 
> Looks good to me. Vegard?

it's resolved in tip/master already.

Stephen, could you please only report conflict resolutions that you do if 
they differ from the one done in tip/master? Or use tip/auto-latest that 
has all these conflict resolutions integrated into a single package.

A lot of internal conflicts between -tip originated trees get reported 
again and again as genuine conflicts - needlessly in 99% of the cases as 
i've already done the conflict resolution myself days (sometimes weeks) 
ahead of the linux-next resolution, and tested the end result in 
tip/master.

	Ingo
