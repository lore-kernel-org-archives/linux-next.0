From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: input tree build failure
Date: Tue, 19 Aug 2008 13:00:57 -0700
Message-ID: <20080819200057.GD10502@kroah.com>
References: <20080819163148.159c7d8c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:53808 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755470AbYHSUI6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Aug 2008 16:08:58 -0400
Content-Disposition: inline
In-Reply-To: <20080819163148.159c7d8c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-next@vger.kernel.org, "Alfred E. Heggestad" <aeh@db.org>

On Tue, Aug 19, 2008 at 04:31:48PM +1000, Stephen Rothwell wrote:
> Hi Dmitry,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/input/misc/cm109.c: In function 'cm109_usb_suspend':
> drivers/input/misc/cm109.c:768: error: implicit declaration of function 'info'
> 
> Caused by commit c04148f915e5ba7947752e6348e0da4cdab1329e ("Input: add
> driver for USB VoIP phones with CM109 chipset") adding a usage of the info
> () function while commit 8aac48f4f2460b00468fd5f1101addf3df04e94c ("USB:
> remove info() macro from usb.h") from the usb tree removed it.
> 
> I applied the following patch (which may not be the best).
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 
> >From 2a58297038a91ef5ffba3df4a5bd7576735ca205 Mon Sep 17 00:00:00 2001
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 19 Aug 2008 16:28:15 +1000
> Subject: [PATCH] input/cm109: fix up for info() removal
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/input/misc/cm109.c |   26 +++++++++++++++++---------
>  1 files changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/input/misc/cm109.c b/drivers/input/misc/cm109.c
> index 404fd49..595b3b1 100644
> --- a/drivers/input/misc/cm109.c
> +++ b/drivers/input/misc/cm109.c
> @@ -312,7 +312,8 @@ static void cm109_urb_irq_callback(struct urb *urb)
>  	int error;
>  
>  #if CM109_DEBUG
> -	info("### URB IRQ: [0x%02x 0x%02x 0x%02x 0x%02x] keybit=0x%02x",
> +	printk(KERN_INFO KBUILD_MODNAME ": "
> +	     "### URB IRQ: [0x%02x 0x%02x 0x%02x 0x%02x] keybit=0x%02x",

No, these should all use dev_info() instead.

Actually, they should all use dev_dbg() and drop the #if entirely.  With
the dynamic dev_dbg() patch that is in -next, that will work just fine,
no need to rebuild modules which is almost impossible for most users to
do.

thanks,

greg k-h
