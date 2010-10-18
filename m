From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: linux-next: manual merge of the msm tree with the arm tree
Date: Mon, 18 Oct 2010 17:11:47 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1010181657380.2764@xanadu.home>
References: <20101018103540.7bd9c535.sfr@canb.auug.org.au>
 <alpine.LFD.2.00.1010181525000.2764@xanadu.home>
 <1287432774.5588.5.camel@c-dwalke-linux.qualcomm.com>
 <201010182219.25890.arnd@arndb.de>
 <1287434251.5588.23.camel@c-dwalke-linux.qualcomm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relais.videotron.ca ([24.201.245.36]:33503 "EHLO
	relais.videotron.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750806Ab0JRVLs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 18 Oct 2010 17:11:48 -0400
In-reply-to: <1287434251.5588.23.camel@c-dwalke-linux.qualcomm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Walker <dwalker@fifo99.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King <rmk@arm.linux.org.uk>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jeremy Kerr <jeremy.kerr@canonical.com>, Jeff Ohlstein <johlstei@codeaurora.org>

On Mon, 18 Oct 2010, Daniel Walker wrote:

> I think the term "merge window" is a little mis-leading here.. Your
> describing development. To me the term merge window is indicating a
> short period when you get changes in, not the whole -rc cycle.

There are overlaps.  The two-week merge window is for subsystem 
maintainers to push their stuff to Linus.  Obviously those subsystem 
maintainers must have merge windows of their own prior pushing their 
tree to Linus.  This is a pipeline.

And folks let's not get too excited about this.  The idea of having this 
change at the end of RMK's merge window is to catch most (if not all) 
ARM targets being affected.  Last time I checked this affected something 
like 367 machines.  This is not a catastrophic issue if support for one 
or two machines get merged outside of RMK's tree and a build error 
happens for them once in Linus' tree.  The fix should be obvious and the 
-rc period is long enough to fix those things.  Or the merge actually 
flags a conflict that should be trivial to fix as Stephen did in 
linux-next.

Merge conflicts do happen.  If those conflicts remain small and trivial 
this is _fine_.


Nicolas
