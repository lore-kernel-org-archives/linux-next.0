From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH 12/17] mfd: update gfp/slab.h includes
Date: Fri, 2 Apr 2010 18:25:47 +0200
Message-ID: <20100402162546.GL8010@sortiz.org>
References: <1269885165-18617-1-git-send-email-tj@kernel.org>
 <1269885165-18617-13-git-send-email-tj@kernel.org>
 <20100402101159.GC8010@sortiz.org>
 <20100402160855.GA15928@rakim.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.21]:9295 "EHLO
	orsmga101.jf.intel.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751943Ab0DBQZK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 2 Apr 2010 12:25:10 -0400
Content-Disposition: inline
In-Reply-To: <20100402160855.GA15928@rakim.wolfsonmicro.main>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Tejun Heo <tj@kernel.org>, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Apr 02, 2010 at 05:08:55PM +0100, Mark Brown wrote:
> On Fri, Apr 02, 2010 at 12:12:00PM +0200, Samuel Ortiz wrote:
> > Hi Tejun,
> > 
> > On Tue, Mar 30, 2010 at 02:52:40AM +0900, Tejun Heo wrote:
> > > Implicit slab.h inclusion via percpu.h is about to go away.  Make sure
> > > gfp.h or slab.h is included as necessary.
> > The davinci MFD driver is sitting in Mark's tree, so I guess he should take
> > this patch.
> > Mark, feel free to add my:
> > Acked-by: Samuel Ortiz <sameo@linux.intel.com>
> 
> > to this patch.
> 
> Unfortunately drivers/gpio/rdc321x-gpio.c isn't in mainline yet so the
> patch doesn't apply cleanly to ASoC either.  I've applied the DaVinci
> hunk, the other will need to go via your tree.
Thanks, I'm pushing the rdc321x part.

Cheers,
Samuel.


-- 
Intel Open Source Technology Centre
http://oss.intel.com/
