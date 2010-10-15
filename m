From: Sarah Sharp <sarah.a.sharp-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] usb: Fix linker errors with CONFIG_PM=n
Date: Fri, 15 Oct 2010 16:26:29 -0700
Message-ID: <20101015232629.GA26031@xanatos>
References: <20101015205756.GA1757@xanatos>
 <20101015215915.GA25942@xanatos>
 <20101015222301.GA4080@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101015222301.GA4080-OI9uyE9O0yo@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>, Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lud <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andiry Xu <andiry.xu-5C7GfCeVMHo@public.gmane.org>, Dong Nguyen <dong.nguyen-5C7GfCeVMHo@public.gmane.org>, Libin Yang <libin.yang-5C7GfCeVMHo@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Sat, Oct 16, 2010 at 12:23:01AM +0200, Marcin Slusarz wrote:
> On Fri, Oct 15, 2010 at 02:59:15PM -0700, Sarah Sharp wrote:
> > diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> > index c08928a..93d3bf4 100644
> > --- a/drivers/usb/host/xhci.h
> > +++ b/drivers/usb/host/xhci.h
> > @@ -1405,8 +1405,15 @@ int xhci_init(struct usb_hcd *hcd);
> >  int xhci_run(struct usb_hcd *hcd);
> >  void xhci_stop(struct usb_hcd *hcd);
> >  void xhci_shutdown(struct usb_hcd *hcd);
> > +
> > +#ifdef	CONFIG_PM
> >  int xhci_suspend(struct xhci_hcd *xhci);
> >  int xhci_resume(struct xhci_hcd *xhci, bool hibernated);
> > +#else
> > +#define	xhci_suspend	NULL
> > +#define	xhci_resume	NULL
> > +#endif
> > +
> 
> "static inline int xhci_suspend(struct xhci_hcd *) {}"
> has the same effect but saves types

That doesn't have the same effect.  Since those functions are only used
as function pointers, the original patch compiles to less code when
CONFIG_PM=n.  Also, the original version will cause an oops if those
functions are ever called when CONFIG_PM=n, which would indicate a bug
in the callee (something we would rather catch anyway).  This is the
style that other USB host controller drivers use, like EHCI.

I don't understand what you mean by "saves types".  Is there something
I've missed?

Sarah Sharp
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
