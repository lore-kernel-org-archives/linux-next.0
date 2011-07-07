From: Christoph Lameter <cl@linux.com>
Subject: Re: Build issue with linux next. duplicate member _count in
 mm_types.h
Date: Thu, 7 Jul 2011 08:42:00 -0500 (CDT)
Message-ID: <alpine.DEB.2.00.1107070841500.17376@router.home>
References: <4E143120.2020501@cam.ac.uk> <alpine.DEB.2.00.1107060933460.17202@router.home> <4E15AF1C.7080103@example.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp108.prem.mail.ac4.yahoo.com ([76.13.13.47]:43989 "HELO
	smtp108.prem.mail.ac4.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1755982Ab1GGNmD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Jul 2011 09:42:03 -0400
In-Reply-To: <4E15AF1C.7080103@example.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Piotr Hosowicz <piotr@hosowicz.com>
Cc: Jonathan Cameron <jic23@cam.ac.uk>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Pekka Enberg <penberg@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

On Thu, 7 Jul 2011, Piotr Hosowicz wrote:

> On 06.07.2011 16:46, Christoph Lameter wrote:
> > On Wed, 6 Jul 2011, Jonathan Cameron wrote:
> >
> > > Getting:
> > >
> > >    CHK     include/linux/version.h
> > >    CHK     include/generated/utsrelease.h
> > > make[1]: `include/generated/mach-types.h' is up to date.
> > >    CC      arch/arm/kernel/asm-offsets.s
> > > In file included from include/linux/sched.h:64:0,
> > >                   from arch/arm/kernel/asm-offsets.c:13:
> > > include/linux/mm_types.h:74:15: error: duplicate member '_count'
> > > make[1]: *** [arch/arm/kernel/asm-offsets.s] Error 1
> > > make: *** [prepare0] Error 2
>
> I have the same error on x86_64. I'll try again withj your patch.

Could you post a config file?
