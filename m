From: Darren Hart <dvhart@infradead.org>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the
 watchdog tree
Date: Tue, 2 May 2017 13:21:59 -0700
Message-ID: <20170502202159.GC26866@fury>
References: <20170502140403.24e315cf@canb.auug.org.au>
 <20170502180940.GB26866@fury>
 <20170502191217.GA11901@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:39467 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750850AbdEBUWE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 May 2017 16:22:04 -0400
Content-Disposition: inline
In-Reply-To: <20170502191217.GA11901@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wim Van Sebroeck <wim@iguana.be>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

On Tue, May 02, 2017 at 12:12:17PM -0700, Guenter Roeck wrote:
> On Tue, May 02, 2017 at 11:09:40AM -0700, Darren Hart wrote:
> > On Tue, May 02, 2017 at 02:04:03PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Today's linux-next merge of the drivers-x86 tree got a conflict in:
> > > 
> > >   drivers/watchdog/iTCO_wdt.c
> > > 
> > > between commit:
> > > 
> > >   38a700fa1df9 ("watchdog: iTCO_wdt: cleanup set/unset no_reboot_bit functions")
> > > (which also appears in the drivers-x86 tree as commit f583a884afec)
> > > 
> > 
> > Andy and Guenter, I presume the two of you discussed how this patch would get
> > submitted as I see the following in the platform driver x86 for-next branch:
> > 
> >     Acked-by: Guenter Roeck <linux@roeck-us.net>
> >     Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > for both:
> > 
> > 140c91b2 watchdog: iTCO_wdt: Add PMC specific noreboot update api
> > f583a88 watchdog: iTCO_wdt: cleanup set/unset no_reboot_bit functions
> > 
> 
> I did not expect f583a88/38a700fa1df9 to show up in some other tree, sorry.
> I don't recall discussing how to handle it either, though my memory may defeat
> me. If so, my apologies.
> 
> > This suggests these were deliberately added to our tree and not accidentally
> > included through a rebase without --preserve-merges or something like that.
> > 
> > Guenter, if you prefer/need to submit this through your tree, can you provide
> > us with an immutable branch to merge for the dependencies of our later patches?
> > If you can drop these two patches without a dependency problem in your tree,
> > that would be the cleanest solution as we could avoid an additional merge.
> > 
> 
> Please check with Wim.

Thanks Guenter.

Wim, for context, this was a 6 patch series, with 4 patches to the platform
driver x86 tree and 2patches to the watchdog tree. The series was reviewed by
Guenter and Andy, and in v7 Andy replied that he had pushed the series to
testing (the testing branch of the platform driver x86 tree).

https://lkml.org/lkml/2017/4/25/666

>From my perspective, the most direct solution would be to drop these two patches
from the watchdog tree and let them go through the platform driver x86 tree with
Guenter's Acked-by. If you have additional patches which depend on these two,
then if you will provide an immutable branch we can merge, we can do that too
(but I try to keep the number of external merges to a minimum - which is
becoming increasingly difficult lately for some reason).

Thanks,

-- 
Darren Hart
VMware Open Source Technology Center
