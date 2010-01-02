From: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>
Subject: RE: linux-next: origin tree build warnings
Date: Sat, 2 Jan 2010 15:02:55 +0530
Message-ID: <EAF47CD23C76F840A9E7FCE10091EFAB02C02E9494@dbde02.ent.ti.com>
References: <20100101114238.83108321.sfr@canb.auug.org.au>
	<alpine.LFD.2.00.0912311649070.3630@localhost.localdomain>
	<20100101122259.394d5b19.sfr@canb.auug.org.au>
	<alpine.LFD.2.00.0912311731130.3630@localhost.localdomain>
 <20100101125046.23103597.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:55063 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751022Ab0ABJda convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 2 Jan 2010 04:33:30 -0500
In-Reply-To: <20100101125046.23103597.sfr@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Samuel Ortiz <sameo@linux.intel.com>, Tony Lindgren <tony@atomide.com>, "Krishnamoorthy, Balaji T" <balajitk@ti.com>, "Nayak, Rajendra" <rnayak@ti.com>

Stephen,Linus,

> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Friday, January 01, 2010 7:21 AM
> To: Linus Torvalds
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Thomas Gleixner; Samuel Ortiz; Tony
> Lindgren; Shilimkar, Santosh; Krishnamoorthy, Balaji T; Nayak, Rajendra
> Subject: Re: linux-next: origin tree build warnings
> 
> Hi Linus,
> 
> On Thu, 31 Dec 2009 17:32:11 -0800 (PST) Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >
> > On Fri, 1 Jan 2010, Stephen Rothwell wrote:
> > >
> > > I have built drivers/mfd/twl4030-irq.o the same way as before but after
> > > applying your patch and the warnings are fixed.  I do not have the
> > > hardware and so cannot do a runtime test.
> >
> > Ok, committed as "Reported-and-compile-tested-by:" you.
> 
> Thanks.
> 
> > Somebody should probably test it on real hardware, but I doubt the patch
> > makes anything worse, and it _probably_ makes things better.
> 
> With any luck :-)
Have tested this patch on OMAP3430 and works as expected. 

Regards,
Santosh
