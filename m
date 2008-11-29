From: Ingo Molnar <mingo@elte.hu>
Subject: Re: drivers/x86 (Was: Re: linux-next: Tree for November 28
	(misc/tc1100))
Date: Sat, 29 Nov 2008 10:34:14 +0100
Message-ID: <20081129093414.GB26691@elte.hu>
References: <20081128213620.2ec593d4.sfr@canb.auug.org.au> <4930307C.30106@oracle.com> <20081129083550.3c23af37.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:47344 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751146AbYK2Jee (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 29 Nov 2008 04:34:34 -0500
Content-Disposition: inline
In-Reply-To: <20081129083550.3c23af37.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Len Brown <len.brown@intel.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Randy Dunlap <randy.dunlap@oracle.com>, x86@kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Len,
> 
> On Fri, 28 Nov 2008 09:55:08 -0800 Randy Dunlap <randy.dunlap@oracle.com> wrote:
> >
> > make[2]: *** No rule to make target `drivers/misc/tc1100-wmi.o', needed by `drivers/misc/built-in.o'.
> > 
> > on allmodconfig & allyesconfig for i386.
> > 
> > On, moved to drivers/x86/.  Someone needs to clean up drivers/misc/Makefile.
> 
> Just wondering where the move to drivers/x86 was discussed, (reviewed 
> and tested) and why the change is in the acpi tree and not the x86 
> tree?

it will all conflict with pending bits in the x86 tree, so i'd prefer if 
Len did this atomically after 2.6.29-rc1, without it having this 
long-term breakage effect.

Historically drivers/misc/ has been more active via the ACPI tree. (Len 
being the (in-)voluntary maintainer for those platform details)

So drivers/x86/ makes sense i guess. Eventually the really lowlevel bits 
might move to arch/x86/drivers/ or so - but i've got no strong opinion on 
it. There seems to be enough precedent of existing drivers/$ARCH 
hierarchies.

	Ingo
