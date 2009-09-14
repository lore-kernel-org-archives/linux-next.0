From: Ingo Molnar <mingo@elte.hu>
Subject: Re: Warning from ring buffer code (Was: Re: linux-next: tip tree
	build warning)
Date: Mon, 14 Sep 2009 15:53:25 +0200
Message-ID: <20090914135325.GA24454@elte.hu>
References: <20090804161640.70817ee6.sfr@canb.auug.org.au> <1249403089.4634.139.camel@localhost.localdomain> <20090912165300.9d257283.sfr@canb.auug.org.au> <20090912073906.GA3972@elte.hu> <1252936201.2964.59.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:56474 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751276AbZINNxo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Sep 2009 09:53:44 -0400
Content-Disposition: inline
In-Reply-To: <1252936201.2964.59.camel@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <srostedt@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


* Steven Rostedt <srostedt@redhat.com> wrote:

> On Sat, 2009-09-12 at 09:39 +0200, Ingo Molnar wrote:
> > * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > > Now that this is in Linus' tree, can we have a fix for the waning, 
> > > please?
> > 
> > The first warning got fixed 1.5 months ago - the second one at line 
> > 797 is still there but harmless - you can ignore it for now, it will 
> > be fixed.
> 
> The first warning never got fixed. The typecast was placed in the 
> wrong spot (my fault). I sent another patch that fixes both warnings.

Pulled it, thanks Steve.

	Ingo
