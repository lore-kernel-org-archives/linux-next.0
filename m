From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: pci tree build failure
Date: Fri, 18 Jul 2008 00:57:06 +0200
Message-ID: <200807180057.07192.rjw@sisk.pl>
References: <20080717130924.edd5a501.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:37312 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751647AbYGQWzN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Jul 2008 18:55:13 -0400
In-Reply-To: <20080717130924.edd5a501.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org, Jeremy Fitzhardinge <jeremy@goop.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

On Thursday, 17 of July 2008, Stephen Rothwell wrote:
> Hi Jesse,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/xen/manage.c: In function 'xen_suspend':
> drivers/xen/manage.c:66: error: too few arguments to function 'device_power_up'
> drivers/xen/manage.c: In function 'do_suspend':
> drivers/xen/manage.c:117: error: too few arguments to function 'device_resume'
> 
> Caused by commit 1eede070a59e1cc73da51e1aaa00d9ab86572cfc ("Introduce new
> top level suspend and hibernation callbacks") interacting with new
> usages ...
> 
> I applied the patch below (which could be incorrect).

The patch is correct.

Thanks,
Rafael


> The above commit is now in Linus' tree, so this needs to be fixed in the
> merge of the x86(?) tree.
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 
> From aa015dc0cceb8478a89421c4015e81f78a9cf106 Mon Sep 17 00:00:00 2001
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 17 Jul 2008 13:01:15 +1000
> Subject: [PATCH] pci: fix xen fallout from PM API change
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/xen/manage.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/xen/manage.c b/drivers/xen/manage.c
> index 2bb268e..a5bc91a 100644
> --- a/drivers/xen/manage.c
> +++ b/drivers/xen/manage.c
> @@ -63,7 +63,7 @@ static int xen_suspend(void *data)
>  	gnttab_resume();
>  	xen_mm_unpin_all();
>  
> -	device_power_up();
> +	device_power_up(PMSG_RESUME);
>  
>  	if (!*cancelled) {
>  		xen_irq_resume();
> @@ -114,7 +114,7 @@ static void do_suspend(void)
>  	} else
>  		xenbus_suspend_cancel();
>  
> -	device_resume();
> +	device_resume(PMSG_RESUME);
>  
>  	/* Make sure timer events get retriggered on all CPUs */
>  	clock_was_set();
