From: Len Brown <lenb@kernel.org>
Subject: Re: linux-next: acpi tree build failure
Date: Fri, 27 Mar 2009 16:58:51 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.0903271658400.26419@localhost.localdomain>
References: <20090224153742.08562389.sfr@canb.auug.org.au>
 <20090303124717.f8a65db8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vms173007pub.verizon.net ([206.46.173.7]:17183 "EHLO
	vms173007pub.verizon.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751992AbZC0U7P (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 27 Mar 2009 16:59:15 -0400
Received: from localhost.localdomain ([96.237.168.40])
 by vms173007.mailsrvcs.net
 (Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008; 32bit))
 with ESMTPA id <0KH600G0SNM73GXE@vms173007.mailsrvcs.net> for
 linux-next@vger.kernel.org; Fri, 27 Mar 2009 15:59:02 -0500 (CDT)
In-reply-to: <20090303124717.f8a65db8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>, Kay Sievers <kay.sievers@vrfy.org>, Matthew Garrett <mjg59@srcf.ucam.org>

applied.

Thanks Stephen.

--
Len Brown, Intel Open Source Technology Center

On Tue, 3 Mar 2009, Stephen Rothwell wrote:

> Hi Len,
> 
> On Tue, 24 Feb 2009 15:37:42 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > drivers/acpi/thermal.c: In function 'thermal_notify':
> > drivers/acpi/thermal.c:768: error: 'struct device' has no member named 'bus_id'
> > 
> > Caused by commit b1569e99c795bf83b4ddf41c4f1c42761ab7f75e ("ACPI: move
> > thermal trip handling to generic thermal layer") interacting with commit
> > d4a078fca590911cdf87a8eaffee1b6e643c2558 ("driver core: get rid of struct
> > device's bus_id string array").
> > 
> > I have dropped the acpi tree for today.
> 
> Since this hasn't bee fixed yet, I have applied the following patch as a
> merge fixup.  Please apply it (or something like it) to the acpi tree.
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 3 Mar 2009 12:41:46 +1100
> Subject: [PATCH] acpi: update thermal for bus_id removal
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/acpi/thermal.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/acpi/thermal.c b/drivers/acpi/thermal.c
> index 0ec48d2..6b95997 100644
> --- a/drivers/acpi/thermal.c
> +++ b/drivers/acpi/thermal.c
> @@ -41,6 +41,7 @@
>  #include <linux/kmod.h>
>  #include <linux/seq_file.h>
>  #include <linux/reboot.h>
> +#include <linux/device.h>
>  #include <asm/uaccess.h>
>  #include <linux/thermal.h>
>  #include <acpi/acpi_bus.h>
> @@ -765,7 +766,7 @@ static int thermal_notify(struct thermal_zone_device *thermal, int trip,
>  
>  	acpi_bus_generate_proc_event(tz->device, type, 1);
>  	acpi_bus_generate_netlink_event(tz->device->pnp.device_class,
> -					tz->device->dev.bus_id, type, 1);
> +					dev_name(&tz->device->dev), type, 1);
>  
>  	if (trip_type == THERMAL_TRIP_CRITICAL && nocrt)
>  		return 1;
> -- 
> 1.6.1.3
> 
