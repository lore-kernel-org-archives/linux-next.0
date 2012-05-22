From: Michael Neuling <mikey@neuling.org>
Subject: Re: linux-next: PowerPC boot failures in next-20120521
Date: Tue, 22 May 2012 12:40:23 +1000
Message-ID: <2246.1337654423@neuling.org>
References: <20120522114051.0c9db9a7c2d660bc9e0e1be2@canb.auug.org.au> <328.1337652722@neuling.org> <alpine.DEB.2.00.1205211924390.13682@chino.kir.corp.google.com> <2182.1337654352@neuling.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:43432 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751770Ab2EVCkY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 May 2012 22:40:24 -0400
In-reply-to: <2182.1337654352@neuling.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Rientjes <rientjes@google.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, ppc-dev <linuxppc-dev@lists.ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Lee Schermerhorn <lee.schermerhorn@hp.com>, Linus <torvalds@linux-foundation.org>

Michael Neuling <mikey@neuling.org> wrote:

> > > Trying David's patch just posted doesn't fix it.
> > > 
> > 
> > Hmm, what does CONFIG_DEBUG_VM say?
> 
> No set.

Sorry, should have read "Not set"

mikey
