From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for June 5
Date: Fri, 6 Jun 2008 10:33:22 +0200
Message-ID: <20080606083322.GC10826@elte.hu>
References: <20080605175217.cee497f3.sfr@canb.auug.org.au> <20080605195604.41623687.akpm@linux-foundation.org> <20080606071707.GB9708@elte.hu> <20080606072536.GA19334@elte.hu> <20080606003327.9ac0e91b.akpm@linux-foundation.org> <20080606074137.GA28962@elte.hu> <20080606004743.a78180c3.akpm@linux-foundation.org> <20080606082325.GA10826@elte.hu> <20080606182858.60490e47.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:42995 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753315AbYFFIdk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Jun 2008 04:33:40 -0400
Content-Disposition: inline
In-Reply-To: <20080606182858.60490e47.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> On Fri, 6 Jun 2008 10:23:25 +0200 Ingo Molnar <mingo@elte.hu> wrote:
> >
> > hm, which commit is this exactly? I've never hit it myself in 
> > bisection (and there are days when i bisect -tip several times). 
> > We'll respin tip/tracing/mmiotrace if it's bisection-hostile. You 
> > can probably nudge it into building via "git-bisect next".
> 
> See my other email.  This is because the ftrace tree does not merge 
> well with the rcu tree.

yeah, we have this fixup in -tip as well, in a structured way: you might 
want to start tracking the tip/tracing/mmiotrace-mergefixups branch to 
pick it up.

or we could offer you a full auto-tip-next plug-and-play branch as well. 
(there's no reason to redo all these integration steps)

	Ingo
