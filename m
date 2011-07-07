From: Steven Newbury <steve@snewbury.org.uk>
Subject: Re: Build issue with linux next. duplicate member _count in
 mm_types.h
Date: Thu, 07 Jul 2011 23:56:46 +0100
Message-ID: <1310079408.31261.6.camel@infinity>
References: <4E143120.2020501@cam.ac.uk>
	 <alpine.DEB.2.00.1107060933460.17202@router.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from queueout04-winn.ispmail.ntl.com ([81.103.221.58]:52137 "EHLO
	queueout04-winn.ispmail.ntl.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750932Ab1GGX3F (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Jul 2011 19:29:05 -0400
In-Reply-To: <alpine.DEB.2.00.1107060933460.17202@router.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux.com>
Cc: Jonathan Cameron <jic23@cam.ac.uk>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Pekka Enberg <penberg@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

On Wed, 2011-07-06 at 09:46 -0500, Christoph Lameter wrote:
> On Wed, 6 Jul 2011, Jonathan Cameron wrote:
> 
> > Getting:
> >
> >   CHK     include/linux/version.h
> >   CHK     include/generated/utsrelease.h
> > make[1]: `include/generated/mach-types.h' is up to date.
> >   CC      arch/arm/kernel/asm-offsets.s
> > In file included from include/linux/sched.h:64:0,
> >                  from arch/arm/kernel/asm-offsets.c:13:
> > include/linux/mm_types.h:74:15: error: duplicate member '_count'
> > make[1]: *** [arch/arm/kernel/asm-offsets.s] Error 1
> > make: *** [prepare0] Error 2
> >
> > Issue looks to have been introduced by
> >
> >     mm: Rearrange struct page
> >
> > fc9bb8c768abe7ae10861c3510e01a95f98d5933
> >
> > Guessing it's a known issue, but just thought I'd flag it up in case
> > it's something very specific about my build.
> >
> > gcc-2.6 armv7a
> >
> > Reverting that patch works, but given I don't know the history, I'm
> > not proposing doing that in general!
> 
> Well _count exists in two unionized structs but always has the same offset
> within the larger struct. Maybe ARM creates different offsets there for
> some reason?

This is due to this fix hitting gcc-4.6:
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=4784
