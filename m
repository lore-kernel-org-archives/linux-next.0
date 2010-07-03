From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: Tree for July 2 (touchscreen/ad7879)
Date: Sat, 3 Jul 2010 13:17:06 -0700
Message-ID: <20100703201706.GA8405@core.coreip.homeip.net>
References: <20100702163505.272e6fca.sfr@canb.auug.org.au>
 <20100702093944.b0ebe49a.randy.dunlap@oracle.com>
 <201007020958.05448.dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:60220 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752202Ab0GCURM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 3 Jul 2010 16:17:12 -0400
Content-Disposition: inline
In-Reply-To: <201007020958.05448.dmitry.torokhov@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Michael Hennerich <hennerich@blackfin.uclinux.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Jul 02, 2010 at 09:58:03AM -0700, Dmitry Torokhov wrote:
> On Friday, July 02, 2010 09:39:44 am Randy Dunlap wrote:
> > On Fri, 2 Jul 2010 16:35:05 +1000 Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Changes since 20100630:
> > > 
> > > The tip tree lost a conflict.
> > > 
> > > The driver-core tree gained a conflict agains the jdelvare-hwmon tree.
> > > 
> > > -------------------------------------------------------------------------
> > > ---
> > 
> > drivers/input/touchscreen/ad7879.c: In function 'ad7879_probe':
> > drivers/input/touchscreen/ad7879.c:487: error: 'struct ad7879' has no
> > member named 'mutex' drivers/input/touchscreen/ad7879.c:578: warning:
> > passing argument 1 of 'ad7879_gpio_add' from incompatible pointer type
> > drivers/input/touchscreen/ad7879.c:444: note: expected 'struct device *'
> > but argument is of type 'struct ad7879 *'
> > drivers/input/touchscreen/ad7879.c:578: error: too many arguments to
> > function 'ad7879_gpio_add' drivers/input/touchscreen/ad7879.c:589:
> > warning: passing argument 1 of 'ad7879_gpio_remove' from incompatible
> > pointer type drivers/input/touchscreen/ad7879.c:449: note: expected
> > 'struct device *' but argument is of type 'struct ad7879 *'
> > drivers/input/touchscreen/ad7879.c: In function 'ad7879_remove':
> > drivers/input/touchscreen/ad7879.c:604: warning: passing argument 1 of
> > 'ad7879_gpio_remove' from incompatible pointer type
> > drivers/input/touchscreen/ad7879.c:449: note: expected 'struct device *'
> > but argument is of type 'struct ad7879 *'
> > 
> > 
> > config file is attached.
> > 
> 
> Oops, I will fix that up.
> 
> Thanks for the report Randy.
> 

Should be better now.

-- 
Dmitry
