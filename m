From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the tip tree with the slab tree
Date: Tue, 16 Jun 2009 09:44:46 +0200
Message-ID: <20090616074446.GA10278@elte.hu>
References: <20090616154652.b8adcb9d.sfr@canb.auug.org.au> <1245131318.3415.1.camel@penberg-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:60279 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752098AbZFPHpG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Jun 2009 03:45:06 -0400
Content-Disposition: inline
In-Reply-To: <1245131318.3415.1.camel@penberg-laptop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nick Piggin <npiggin@suse.de>, Christoph Lameter <cl@linux-foundation.org>, Vegard Nossum <vegard.nossum@gmail.com>


* Pekka Enberg <penberg@cs.helsinki.fi> wrote:

> On Tue, 2009-06-16 at 15:46 +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the tip tree got a conflict in mm/slub.c
> > between commit 964cf35c88f93b4927dbc4e950dfa4d880c7f9d1 ("SLUB: Fix early
> > boot GFP_DMA allocations") from the slab tree and commit
> > 18fd427debcf37c06917b55295df682fd05fee76 ("slub: add hooks for
> > kmemcheck") from the tip tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary.
> 
> Looks good! Thanks.

Btw., this SLAB commit is for this merge window, right?

	Ingo
