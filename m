From: "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: linux-next: Tree for June 13: IO APIC breakage on HP nx6325
Date: Mon, 16 Jun 2008 03:45:05 +0100 (BST)
Message-ID: <Pine.LNX.4.55.0806160343220.11995@cliff.in.clinika.pl>
References: <20080613232214.394fd6fd.sfr@canb.auug.org.au> <200806152031.01959.rjw@sisk.pl>
 <200806160314.49489.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kirk.serum.com.pl ([213.77.9.205]:64008 "EHLO serum.com.pl"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751471AbYFPCp5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 15 Jun 2008 22:45:57 -0400
In-Reply-To: <200806160314.49489.rjw@sisk.pl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>

On Mon, 16 Jun 2008, Rafael J. Wysocki wrote:

> On Sunday, 15 of June 2008, Rafael J. Wysocki wrote:
> > On Friday, 13 of June 2008, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Changes since next-20080612:
> > > 
> > > New tree: kgdb
> > > Dropped trees (temporary): ldp (it is unfetchable - probably something to
> > > do with the new Staging tree)
> > > Restored trees: block
> > > 
> > > The x86 tree gained a conflict with Linus' tree.
> > > 
> > > The acpi tree gained a conflict with the pci tree.
> > > 
> > > The mtd tree gained a trivial conflict with the avr32 tree.
> > > 
> > > The rr tree lost its conflict with the net-current tree.
> > > 
> > > The block tree gained several conflict with various other trees.  It also
> > > required a build fix patch.
> > > 
> > > The firmware tree lost its build fix patch.
> > > 
> > > The patches for known build problems are no longer needed.
> > 
> > 20080613 doesn't boot on my HP nx6325.  Bisecting ...
> 
> Okay, with the following commit reverted, the kernel boots normally on this
> box:
> 
> commit 7e3530cd98a0c6ab38f5898e855a5beffab26561
> Author: Maciej W. Rozycki <macro@linux-mips.org>
> Date:   Tue May 27 21:19:51 2008 +0100
> 
>     x86: I/O APIC: timer through 8259A second-chance
> 
>     Signed-off-by: Maciej W. Rozycki <macro@linux-mips.org>
>     Signed-off-by: Ingo Molnar <mingo@elte.hu>

 Can I have .config used and a full bootstrap log from that system with
the patch still applied?

  Maciej
