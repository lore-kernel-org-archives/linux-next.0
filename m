From: Len Brown <lenb@kernel.org>
Subject: Re: drivers/x86 (Was: Re: linux-next: Tree for November 28
 (misc/tc1100))
Date: Sun, 30 Nov 2008 23:29:14 -0500 (EST)
Message-ID: <alpine.LFD.2.00.0811302325050.3314@localhost.localdomain>
References: <20081128213620.2ec593d4.sfr@canb.auug.org.au>
 <4930307C.30106@oracle.com> <20081129083550.3c23af37.sfr@canb.auug.org.au>
 <20081129093414.GB26691@elte.hu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vms173003pub.verizon.net ([206.46.173.3]:57313 "EHLO
	vms173003pub.verizon.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751698AbYLAE3Z (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 30 Nov 2008 23:29:25 -0500
In-reply-to: <20081129093414.GB26691@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Len Brown <len.brown@intel.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Randy Dunlap <randy.dunlap@oracle.com>, x86@kernel.org



On Sat, 29 Nov 2008, Ingo Molnar wrote:

> 
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi Len,
> > 
> > On Fri, 28 Nov 2008 09:55:08 -0800 Randy Dunlap <randy.dunlap@oracle.com> wrote:
> > >
> > > make[2]: *** No rule to make target `drivers/misc/tc1100-wmi.o', needed by `drivers/misc/built-in.o'.
> > > 
> > > on allmodconfig & allyesconfig for i386.
> > > 
> > > On, moved to drivers/x86/.  Someone needs to clean up drivers/misc/Makefile.
> > 
> > Just wondering where the move to drivers/x86 was discussed, (reviewed 
> > and tested) and why the change is in the acpi tree and not the x86 
> > tree?
> 
> it will all conflict with pending bits in the x86 tree, so i'd prefer if 
> Len did this atomically after 2.6.29-rc1, without it having this 
> long-term breakage effect.

Is linux-next running into a conflict between x86 and the acpi 
tree today?

thanks,
-Len
