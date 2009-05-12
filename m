From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: driver-core tree build failure
Date: Mon, 11 May 2009 21:05:18 -0700
Message-ID: <20090512040518.GA2407@kroah.com>
References: <20090512134401.a251bb22.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:40174 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750769AbZELEIz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 May 2009 00:08:55 -0400
Content-Disposition: inline
In-Reply-To: <20090512134401.a251bb22.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Roel Kluin <roel.kluin@gmail.com>

On Tue, May 12, 2009 at 01:44:01PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build (powerpc_ppc64_defconfig) failed like this:
> 
> In file included from arch/powerpc/platforms/ps3/platform.h:28,
>                  from arch/powerpc/platforms/ps3/mm.c:32:
> arch/powerpc/include/asm/ps3.h: In function 'ps3_system_bus_set_driver_data':
> arch/powerpc/include/asm/ps3.h:424: error: 'struct device' has no member named 'driver_data'
> arch/powerpc/include/asm/ps3.h: In function 'ps3_system_bus_get_driver_data':
> arch/powerpc/include/asm/ps3.h:429: error: 'struct device' has no member named 'driver_data'
> 
> Caused (obviously) by commit 9499952d8efc857406365bfc04079ff1e85660ff
> ("Driver core: move dev_get/set_drvdata to drivers/base/dd.c") which I
> have reverted.
> 
> Grep is your friend ...

Do you know how many false-positives there currently are for hitting
driver_data?  It's insane...  I got 'make allmodconfig' working for
i386, x86-64, and s390, and I thought ps3 as well, sorry about that.

> Actually there is a patch for this ...
> http://patchwork.ozlabs.org/patch/27061/ ... also for another ...
> http://patchwork.ozlabs.org/patch/27062/
> 
> Please leave the above commit out of the tree until you have at least
> fixed all the in tree users.

I thought I had.  This was my way of shaking out the residue as I don't
have a working ppc cross-compiler anymore :(

I'll add the above two patches (don't know if the second one needs it)
for tomorrow.

Roel, do you have any other patches doing this that I haven't picked up
yet?

thanks,

greg k-h
