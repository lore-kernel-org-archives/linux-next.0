From: David Rientjes <rientjes@google.com>
Subject: Re: linux-next: PowerPC boot failures in next-20120521
Date: Mon, 21 May 2012 19:44:40 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1205211942540.29814@chino.kir.corp.google.com>
References: <20120522114051.0c9db9a7c2d660bc9e0e1be2@canb.auug.org.au> <328.1337652722@neuling.org> <alpine.DEB.2.00.1205211924390.13682@chino.kir.corp.google.com> <2182.1337654352@neuling.org> <2246.1337654423@neuling.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2246.1337654423@neuling.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Neuling <mikey@neuling.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, ppc-dev <linuxppc-dev@lists.ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Lee Schermerhorn <lee.schermerhorn@hp.com>, Linus <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Tue, 22 May 2012, Michael Neuling wrote:

> > > > Trying David's patch just posted doesn't fix it.
> > > > 
> > > 
> > > Hmm, what does CONFIG_DEBUG_VM say?
> > 
> > No set.
> 
> Sorry, should have read "Not set"
> 

I mean if it's set, what does it emit to the kernel log with my patch 
applied?

I made CONFIG_DEBUG_VM catch !node_online(node) about six months ago, so I 
was thinking it would have caught this if either you or Stephen enable it.
