From: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Subject: Re: linux-next: Tree for October 15 (usb/xhci)
Date: Fri, 15 Oct 2010 09:48:30 -0700
Message-ID: <20101015164830.GA21576@kroah.com>
References: <20101015165002.0b6e418f.sfr@canb.auug.org.au> <20101015084420.6624796d.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101015084420.6624796d.randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Sarah Sharp <sarah.a.sharp-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lud <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Fri, Oct 15, 2010 at 08:44:20AM -0700, Randy Dunlap wrote:
> On Fri, 15 Oct 2010 16:50:02 +1100 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Changes since 20101014:
> 
> 
> When CONFIG_PM is not enabled:
> 
> drivers/usb/host/xhci.c:675: error: implicit declaration of function 'usb_root_hub_lost_power'
> 
> Also, can xhci.c:xhci_suspend() and xhci_resume() be inside
> #ifdef CONFIG_PM / #endif ?

Sarah, care to send me a follow-on patch fixing this up?

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
