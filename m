From: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH next-20080819] drivers/usb/atm: Fix non-existing warn()
Date: Tue, 19 Aug 2008 17:47:23 -0700
Message-ID: <20080820004723.GB385@kroah.com>
References: <20080819185454.d9c74915.sfr@canb.auug.org.au> <s5hiqtxw8en.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <s5hiqtxw8en.wl%tiwai-l3A5Bk7waGM@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Tue, Aug 19, 2008 at 01:28:48PM +0200, Takashi Iwai wrote:
> Fix the die-hard warn() in drivers/usb/atm/usbatm.h that caused a
> build error.
> 
> Signed-off-by: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
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

I fixed it a bit differently, using dev_warn() instead and passing the
"instance" to the macro like the other macros defined in this file.
That way any user knows exactly which device and driver caused the
driver to go boom :)

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
