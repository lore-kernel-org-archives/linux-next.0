From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH next-20080819] drivers/usb/atm: Fix non-existing warn()
Date: Tue, 19 Aug 2008 13:02:07 -0700
Message-ID: <20080819200207.GE10502@kroah.com>
References: <20080819185454.d9c74915.sfr@canb.auug.org.au> <s5hiqtxw8en.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:53812 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753087AbYHSUI7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Aug 2008 16:08:59 -0400
Content-Disposition: inline
In-Reply-To: <s5hiqtxw8en.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, linux-next@vger.kernel.org

On Tue, Aug 19, 2008 at 01:28:48PM +0200, Takashi Iwai wrote:
> Fix the die-hard warn() in drivers/usb/atm/usbatm.h that caused a
> build error.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
> diff --git a/drivers/usb/atm/usbatm.h b/drivers/usb/atm/usbatm.h
> index e6887c6..714dc14 100644
> --- a/drivers/usb/atm/usbatm.h
> +++ b/drivers/usb/atm/usbatm.h
> @@ -42,7 +42,7 @@
>  #ifdef DEBUG
>  #define UDSL_ASSERT(x)	BUG_ON(!(x))
>  #else
> -#define UDSL_ASSERT(x)	do { if (!(x)) warn("failed assertion '%s' at line %d", __stringify(x), __LINE__); } while(0)
> +#define UDSL_ASSERT(x)	do { if (!(x)) pr_warning("failed assertion '%s' at line %d", __stringify(x), __LINE__); } while(0)
>  #endif
>  
>  #define usb_err(instance, format, arg...)	\

Ah, sorry about that, I don't see how I missed it, I'll go fix this up.

Oh, you forgot the '\n' as well, I'll just convert this to a standard
printk() so everyone konws what is happening...

greg k-h
