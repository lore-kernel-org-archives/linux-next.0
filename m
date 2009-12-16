From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH -next] x86 msrs: alloc/free for CONFIG_SMP=n
Date: Wed, 16 Dec 2009 14:02:01 -0800
Message-ID: <20091216140201.5ef21b90.randy.dunlap@oracle.com>
References: <20091216183212.118c5e14.sfr@canb.auug.org.au>
	<20091216092424.5f87214c.randy.dunlap@oracle.com>
	<4B2919BD.40001@zytor.com>
	<20091216174524.GH11618@aftab>
	<4B2928AC.3020807@zytor.com>
	<20091216135119.e283e525.randy.dunlap@oracle.com>
	<20091216215808.GB27228@liondog.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:59134 "EHLO
	rcsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935813AbZLPWCG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Dec 2009 17:02:06 -0500
In-Reply-To: <20091216215808.GB27228@liondog.tnic>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <petkovbb@googlemail.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <borislav.petkov@amd.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 16 Dec 2009 22:58:08 +0100 Borislav Petkov wrote:

> On Wed, Dec 16, 2009 at 01:51:19PM -0800, Randy Dunlap wrote:
> > From: Randy Dunlap <randy.dunlap@oracle.com>
> > 
> > Rearrange arch/x86/lib/msr.c so that alloc/free are built and
> > usable when CONFIG_SMP=n.  Fixes build of amd64_edac.
> > 
> > ERROR: "msrs_free" [drivers/edac/amd64_edac_mod.ko] undefined!
> > ERROR: "msrs_alloc" [drivers/edac/amd64_edac_mod.ko] undefined!
> >
> > ---
> >  arch/x86/lib/Makefile |    2 -
> >  arch/x86/lib/msr.c    |   42 ++++++++++++++++++++--------------------
> >  2 files changed, 23 insertions(+), 21 deletions(-)
> 
> Haha, I just sent a very similar one :)

Yes, I noticed.

> > 
> > --- linux-next-20091216.orig/arch/x86/lib/Makefile
> > +++ linux-next-20091216/arch/x86/lib/Makefile
> > @@ -14,7 +14,7 @@ $(obj)/inat.o: $(obj)/inat-tables.c
> >  
> >  clean-files := inat-tables.c
> >  
> > -obj-$(CONFIG_SMP) := msr.o
> > +obj-$(CONFIG_X86_MSR) := msr.o
> 
> however, CONFIG_X86_MSR is the x86 MSR access module and the <lib/msr.c>
> is the library of MSR accessing functions which is always in. So this
> should be unconditional as in my version or Peter might have a better
> idea...?

Sure, whichever is OK with me.

---
~Randy
