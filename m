From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: linux-next: manual merge of the tracing tree with the parisc
	tree
Date: Thu, 2 Apr 2009 11:22:15 -0400
Message-ID: <20090402152215.GB14159@bombadil.infradead.org>
References: <20090401113740.7f425e02.sfr@canb.auug.org.au> <20090401175033.GE1443@bombadil.infradead.org> <20090402223205.e4ab7b5e.sfr@canb.auug.org.au> <1238680483.3383.7.camel@mulgrave.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:39575 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758212AbZDBPWh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 2 Apr 2009 11:22:37 -0400
Content-Disposition: inline
In-Reply-To: <1238680483.3383.7.camel@mulgrave.int.hansenpartnership.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Kyle McMartin <kyle@mcmartin.ca>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>, Steven Rostedt <srostedt@redhat.com>

On Thu, Apr 02, 2009 at 01:54:43PM +0000, James Bottomley wrote:
> Actually, the traditional way for a multi branch tree (something like
> Jens' Block tree) which contains all manner of branches, some of which
> are experimental and shouldn't be in linux-next, is to have a next
> branch into which you manually merge all branches that should be
> included.
> 
> James
> 

Heh, that makes sense. Occam's Razor, I guess.
