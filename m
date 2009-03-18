From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for March 16 (slob)
Date: Wed, 18 Mar 2009 08:49:36 -0700
Message-ID: <20090318084936.63f5c5de.randy.dunlap@oracle.com>
References: <20090316220609.6f4a884c.sfr@canb.auug.org.au>
	<49BE9B20.70808@oracle.com>
	<20090317111129.5bf04ae6.sfr@canb.auug.org.au>
	<20090317092902.GA6477@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756716AbZCRPsK@vger.kernel.org>
In-Reply-To: <20090317092902.GA6477@elte.hu>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Nick Piggin <npiggin@suse.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>
List-Id: linux-next.vger.kernel.org

On Tue, 17 Mar 2009 10:29:02 +0100 Ingo Molnar wrote:

> 
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > On Mon, 16 Mar 2009 11:32:00 -0700 Randy Dunlap <randy.dunlap@oracle.com> wrote:
> > >
> > > mm/slob.c:480: error: 'flags' undeclared (first use in this function)
> > > 
> > > pseudo-patch:
> > > 
> > > s/flags/gfp/
> > 
> > Caused by commit cf40bd16fdad42c053040bcd3988f5fdedbb6c57 ("lockdep:
> > annotate reclaim context (__GFP_NOFS)") from the tracing tree.
> > 
> > Now fixed in the tip tree.
> 
> Note this has been broken for a relatively long time and only 
> got fixed when i noticed that randconfig was not as random as it 
> was supposed to be. That's how it started triggering in 
> linux-next too i suspect.


linux-next of 20090318 still has this build error.
Is the fix in some branch that is not merged into linux-next?

Thanks,
---
~Randy
