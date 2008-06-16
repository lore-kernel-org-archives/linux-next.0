From: "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: linux-next: Tree for June 13: IO APIC breakage on HP nx6325
Date: Mon, 16 Jun 2008 16:39:38 +0100 (BST)
Message-ID: <Pine.LNX.4.55.0806161636510.20218@cliff.in.clinika.pl>
References: <20080613232214.394fd6fd.sfr@canb.auug.org.au> <200806160314.49489.rjw@sisk.pl>
 <Pine.LNX.4.55.0806160343220.11995@cliff.in.clinika.pl> <200806161539.05524.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kirk.serum.com.pl ([213.77.9.205]:62571 "EHLO serum.com.pl"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751826AbYFPPk1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Jun 2008 11:40:27 -0400
In-Reply-To: <200806161539.05524.rjw@sisk.pl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>

On Mon, 16 Jun 2008, Rafael J. Wysocki wrote:

> > > commit 7e3530cd98a0c6ab38f5898e855a5beffab26561
> > > Author: Maciej W. Rozycki <macro@linux-mips.org>
> > > Date:   Tue May 27 21:19:51 2008 +0100
> > > 
> > >     x86: I/O APIC: timer through 8259A second-chance
> > > 
> > >     Signed-off-by: Maciej W. Rozycki <macro@linux-mips.org>
> > >     Signed-off-by: Ingo Molnar <mingo@elte.hu>
> > 
> >  Can I have .config used and a full bootstrap log from that system with
> > the patch still applied?
> 
> That may be difficult, because with the patch applied the box either doesn't
> boot at all, or works unreliably when booted (depending on the set of patches
> applied on top of it).

 Serial console?  I'm most interested in one from a configuration that
does not boot at all as that's easier to reproduce, determine the cause
and verify whether a change fixes the problem or not.  Other
configurations may then be tested with the fix in place.

> I'll try to get one later today.

 Thanks.

  Maciej
