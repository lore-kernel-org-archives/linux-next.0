From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH -next] regulator: aat2870-regulator.c needs module.h
Date: Mon, 1 Aug 2011 11:25:18 +0200
Message-ID: <20110801092518.GA26275@sortiz-mobl>
References: <20110729173827.716f57ff6e00095a3efc6449@canb.auug.org.au>
 <20110729211309.92e8b744.rdunlap@xenotime.net>
 <20110801001523.GA20641@opensource.wolfsonmicro.com>
 <20110801103304.e77887ff2e60f4f6d5c9f91f@canb.auug.org.au>
 <20110801110507.7ca032b85a285d1f9e755146@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:40938 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751254Ab1HAJX7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Aug 2011 05:23:59 -0400
Content-Disposition: inline
In-Reply-To: <20110801110507.7ca032b85a285d1f9e755146@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Randy Dunlap <rdunlap@xenotime.net>, akpm <akpm@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Liam Girdwood <lrg@ti.com>

Hi Stephen, Liam,

On Mon, Aug 01, 2011 at 11:05:07AM +1000, Stephen Rothwell wrote:
> On Mon, 1 Aug 2011 10:33:04 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Mon, 1 Aug 2011 01:15:24 +0100 Mark Brown <broonie@opensource.wolfsonmicro.com> wrote:
> > >
> > > On Fri, Jul 29, 2011 at 09:13:09PM -0700, Randy Dunlap wrote:
> > > > From: Randy Dunlap <rdunlap@xenotime.net>
> > > > 
> > > > aat2870-regulator.c needs to include linux/module.h to fix multiple
> > > > build errors.
> > > 
> > > Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> > > 
> > > but if the breakage isn't in mainline yet to minimize the breaks
> > > bisection someone should figure out which tree introduced the change
> > > with module.h and either get the fix merged along with that.  If neither
> > > the module.h change nor the driver is in Linus' tree yet I rather
> > > suspect this should go via MFD as I seem to recall that the driver is
> > > going in via there.
> > 
> > It is indeed.  I have this patch set to apply to my tree today after the
> > mfd tree.  Hopefully Samuel will put it in his tree for tomorrow (and
> > before he asks Linus to pull.
> 
> Too late :-)
Sorry about that. I thought I would hear about any breakage after I pushed my
bits on Friday morning.
Anyway, Liam, are you going to push this fix through your tree ?

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
