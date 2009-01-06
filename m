From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the rr tree
Date: Tue, 6 Jan 2009 14:26:21 +0100
Message-ID: <20090106132621.GB16807@elte.hu>
References: <20090105143239.08b1a060.sfr@canb.auug.org.au> <200901051911.52923.rusty@rustcorp.com.au> <20090106144640.4f358eef.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:49223 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751769AbZAFN0f (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Jan 2009 08:26:35 -0500
Content-Disposition: inline
In-Reply-To: <20090106144640.4f358eef.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Christoph Lameter <clameter@sgi.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Rusty,
> 
> On Mon, 5 Jan 2009 19:11:52 +1030 Rusty Russell <rusty@rustcorp.com.au> wrote:
> >
> > On Monday 05 January 2009 14:02:39 Stephen Rothwell wrote:
> > > Similarly with init/main.c, include/linux/percpu.h,
> > > include/asm-generic/percpu.h and arch/x86/include/asm/percpu.h (though
> > > against different commits/trees, of course).
> > 
> > OK, here's the merge as I did it.  I've also attached a tarball of the files
> > post-merge.
> 
> Sorry to put you to all this work, but Ingo has rendered it unneeded by 
> dropping the other patches.

Yeah, and dont be afraid to ask for it: i can either zap a full topic, or 
people can pull from it in the Git space. Merging code in a friendly way 
is generally far easier than letting complex conflicts happen and stacking 
trees on each other in a conflicting way.

This is generally one of the big advantages of a Git based topical setup - 
we were able to discard a portion of development history that turned out 
to go nowhere in its current form - without any collateral damage. (And 
the history was non-trivial - it went back almost a year.)

	Ingo
