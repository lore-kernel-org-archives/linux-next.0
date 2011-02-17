From: Ingo Molnar <mingo@elte.hu>
Subject: [kbuild] Re: linux-next: build failure after merge of the tip tree
Date: Thu, 17 Feb 2011 13:43:04 +0100
Message-ID: <20110217124304.GA27504@elte.hu>
References: <20110131154259.dca1f7e6.sfr@canb.auug.org.au>
 <20110217144743.2db26b27.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:57042 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756308Ab1BQMnV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Feb 2011 07:43:21 -0500
Content-Disposition: inline
In-Reply-To: <20110217144743.2db26b27.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>, Michal Marek <mmarek@suse.cz>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> On Mon, 31 Jan 2011 15:42:59 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> > failed like this:
> > 
> > x86_64-linux-gcc: arch/x86/lib/memmove_64.c: No such file or directory
> > 
> > Caused by commit 9599ec0471deae24044241e2173090d2cbc0e899 ("x86-64, mem:
> > Convert memmove() to assembly file and fix return value bug") interacting
> > with our build system.
> > 
> > After removing arch/x86/lib/.memmove_64.o.cmd (left over from the build
> > before merging the tip tree) from my object tree, it built correctly.
> 
> I am still getting this (of course).

You reported this as a -tip build failure - but it appears to be some sort of kbuild 
bug/artifact, right? There was a leftover .memmove_64.o.cmd file from an old tree.

When jumping between kernel versions via git checkout a 'make mrproper' is generally 
needed. In most cases 'make' will figure things out but it's not always guaranteed.

So for example there are version transitions where a stale include/asm links could 
cause build problems.

Thanks,

	Ingo
