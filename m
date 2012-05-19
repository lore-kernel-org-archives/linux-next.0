From: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH -next] usb: add usb.h stubs for CONFIG_USB not enabled
Date: Sat, 19 May 2012 18:16:45 +0400
Message-ID: <4FB7AB4D.5040900@mvista.com>
References: <20120518184943.2c762e8441e53ea24748d1b8@canb.auug.org.au> <4FB6ED55.6090805@xenotime.net> <20120519005031.GA27613@kroah.com> <4FB6FFBF.6000509@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FB6FFBF.6000509-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ian Abbott <abbotti-GUHe90Wt2aFaa/9Udqfwiw@public.gmane.org>, Frank Mori Hess <fmhess-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

Hello.

On 19-05-2012 6:04, Randy Dunlap wrote:

> From: Randy Dunlap<rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>

> Add stubs for some usb core functions when CONFIG_USB
> is not enabled.  This fixes these comedi build errors:

> ERROR: "usb_deregister" [drivers/staging/comedi/comedi.ko] undefined!
> ERROR: "usb_register_driver" [drivers/staging/comedi/comedi.ko] undefined!

> Signed-off-by: Randy Dunlap<rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
> ---
> I am only adding the stubs that are needed for comedi to build.
> I expect that more stubs will be needed as more build errors are
> found.  It seems to me that linux/usb.h might need more (major)
> moving of lines to support more stubs in the future.

>   Documentation/usb/error-codes.txt |    2 ++
>   include/linux/usb.h               |   24 +++++++++++++++++++++++-
>   2 files changed, 25 insertions(+), 1 deletion(-)
>
> --- linux-next-20120518.orig/include/linux/usb.h
> +++ linux-next-20120518/include/linux/usb.h
> @@ -10,7 +10,7 @@
>
>   #ifdef __KERNEL__
>
> -#include<linux/errno.h>         /* for -ENODEV */
> +#include<linux/errno.h>         /* for -ENODEV, -ENOSYS */
>   #include<linux/delay.h>	/* for mdelay() */
>   #include<linux/interrupt.h>	/* for in_interrupt() */
>   #include<linux/list.h>		/* for struct list_head */
> @@ -515,6 +515,8 @@ static inline struct usb_device *interfa
>   	return to_usb_device(intf->dev.parent);
>   }
>
> +#if defined(CONFIG_USB) || defined(CONFIG_USB_MODULE)

    You can use IS_ENABLED(CONFIG_USB) instead of these two now.

WBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
