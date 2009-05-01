From: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Subject: Re: linux-next: driver-core tree build warning
Date: Thu, 30 Apr 2009 22:47:27 -0700
Message-ID: <20090501054727.GB19020@kroah.com>
References: <20090501152144.500e619a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090501152144.500e619a.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Fri, May 01, 2009 at 03:21:44PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build (x86_64 allmodconfig) produced these warnings:
> 
> drivers/net/wireless/ipw2x00/ipw2100.c: In function 'show_cfg':
> drivers/net/wireless/ipw2x00/ipw2100.c:3491: warning: passing argument 1 of 'dev_get_drvdata' from incompatible pointer type
> include/linux/device.h:457: note: expected 'const struct device *' but argument is of type 'struct device **'
> drivers/net/wireless/ipw2x00/ipw2100.c: In function 'show_status':
> drivers/net/wireless/ipw2x00/ipw2100.c:3500: warning: passing argument 1 of 'dev_get_drvdata' from incompatible pointer type
> include/linux/device.h:457: note: expected 'const struct device *' but argument is of type 'struct device **'
> drivers/net/wireless/ipw2x00/ipw2100.c: In function 'show_capability':
> drivers/net/wireless/ipw2x00/ipw2100.c:3509: warning: passing argument 1 of 'dev_get_drvdata' from incompatible pointer type
> include/linux/device.h:457: note: expected 'const struct device *' but argument is of type 'struct device **'
> drivers/net/wireless/ipw2x00/ipw2100.c: In function 'show_rf_kill':
> drivers/net/wireless/ipw2x00/ipw2100.c:4227: warning: passing argument 1 of 'dev_get_drvdata' from incompatible pointer type
> include/linux/device.h:457: note: expected 'const struct device *' but argument is of type 'struct device **'
> 
> Introduced by commit 73119f5e60e3b16577e99e2f035039bed0d2dcca ("Wireless:
> remove driver_data direct access of struct device").

Ah crap, my bad.  I'll go fix this up, it passed my build tests, I
wonder why this isn't an error, I missed the warning.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
