From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the
 watchdog tree
Date: Tue, 2 May 2017 12:12:17 -0700
Message-ID: <20170502191217.GA11901@roeck-us.net>
References: <20170502140403.24e315cf@canb.auug.org.au>
 <20170502180940.GB26866@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:39717 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751150AbdEBTMV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 May 2017 15:12:21 -0400
Content-Disposition: inline
In-Reply-To: <20170502180940.GB26866@fury>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wim Van Sebroeck <wim@iguana.be>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

On Tue, May 02, 2017 at 11:09:40AM -0700, Darren Hart wrote:
> On Tue, May 02, 2017 at 02:04:03PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the drivers-x86 tree got a conflict in:
> > 
> >   drivers/watchdog/iTCO_wdt.c
> > 
> > between commit:
> > 
> >   38a700fa1df9 ("watchdog: iTCO_wdt: cleanup set/unset no_reboot_bit functions")
> > (which also appears in the drivers-x86 tree as commit f583a884afec)
> > 
> 
> Andy and Guenter, I presume the two of you discussed how this patch would get
> submitted as I see the following in the platform driver x86 for-next branch:
> 
>     Acked-by: Guenter Roeck <linux@roeck-us.net>
>     Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> for both:
> 
> 140c91b2 watchdog: iTCO_wdt: Add PMC specific noreboot update api
> f583a88 watchdog: iTCO_wdt: cleanup set/unset no_reboot_bit functions
> 

I did not expect f583a88/38a700fa1df9 to show up in some other tree, sorry.
I don't recall discussing how to handle it either, though my memory may defeat
me. If so, my apologies.

> This suggests these were deliberately added to our tree and not accidentally
> included through a rebase without --preserve-merges or something like that.
> 
> Guenter, if you prefer/need to submit this through your tree, can you provide
> us with an immutable branch to merge for the dependencies of our later patches?
> If you can drop these two patches without a dependency problem in your tree,
> that would be the cleanest solution as we could avoid an additional merge.
> 

Please check with Wim.

Thanks,
Guenter

> Thanks,
> 
> Darren
> 
> 
> 
> > from the watchdog tree and commit:
> > 
> >   140c91b26ebc ("watchdog: iTCO_wdt: Add PMC specific noreboot update api")
> > 
> > from the drivers-x86 tree.
> > 
> > I fixed it up and can carry the fix as necessary. This is now fixed as
> > far as linux-next is concerned, but any non trivial conflicts should be
> > mentioned to your upstream maintainer when your tree is submitted for
> > merging.  You may also want to consider cooperating with the maintainer
> > of the conflicting tree to minimise any particularly complex conflicts.
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> > 
> 
> -- 
> Darren Hart
> VMware Open Source Technology Center
