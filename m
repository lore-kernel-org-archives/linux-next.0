From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] usb: Fix linker errors with CONFIG_PM=n
Date: Fri, 15 Oct 2010 16:27:03 -0700
Message-ID: <20101015162703.8e3c7ec9.randy.dunlap@oracle.com>
References: <20101015205756.GA1757@xanatos>
	<20101015215915.GA25942@xanatos>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20101015215915.GA25942@xanatos>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sarah Sharp <sarah.a.sharp-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>, Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lud <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andiry Xu <andiry.xu-5C7GfCeVMHo@public.gmane.org>, Dong Nguyen <dong.nguyen-5C7GfCeVMHo@public.gmane.org>, Libin Yang <libin.yang-5C7GfCeVMHo@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Fri, 15 Oct 2010 14:59:15 -0700 Sarah Sharp wrote:

> Fix these linker errors when CONFIG_PM=n:
> 
> ERROR: "xhci_bus_resume" [drivers/usb/host/xhci-hcd.ko] undefined!
> ERROR: "xhci_bus_suspend" [drivers/usb/host/xhci-hcd.ko] undefined!
> 
> Reported-by: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Sarah Sharp <sarah.a.sharp-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
> 
> Randy, this should fix your linker errors.  Without the patch, I get the
> same errors, and with the patch I don't.

Yes, it does, thanks.

Acked-by: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>


> Greg, this applies on top of the previous patch.
> 
>  drivers/usb/host/xhci-hub.c |    7 +------
>  drivers/usb/host/xhci.c     |    6 ------
>  drivers/usb/host/xhci.h     |   14 ++++++++++++++
>  3 files changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> index 7f2f63c..fef5a1f 100644
> --- a/drivers/usb/host/xhci-hub.c
> +++ b/drivers/usb/host/xhci-hub.c
> @@ -742,9 +742,4 @@ int xhci_bus_resume(struct usb_hcd *hcd)
>  	return 0;
>  }
>  
> -#else
> -
> -#define	xhci_bus_suspend	NULL
> -#define	xhci_bus_resume		NULL
> -
> -#endif
> +#endif	/* CONFIG_PM */
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 9dc5be5..5d7d4e9 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -761,12 +761,6 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
>  	spin_unlock_irq(&xhci->lock);
>  	return 0;
>  }
> -
> -#else
> -
> -#define	xhci_suspend	NULL
> -#define	xhci_resume	NULL
> -
>  #endif	/* CONFIG_PM */
>  
>  /*-------------------------------------------------------------------------*/
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index c08928a..93d3bf4 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1405,8 +1405,15 @@ int xhci_init(struct usb_hcd *hcd);
>  int xhci_run(struct usb_hcd *hcd);
>  void xhci_stop(struct usb_hcd *hcd);
>  void xhci_shutdown(struct usb_hcd *hcd);
> +
> +#ifdef	CONFIG_PM
>  int xhci_suspend(struct xhci_hcd *xhci);
>  int xhci_resume(struct xhci_hcd *xhci, bool hibernated);
> +#else
> +#define	xhci_suspend	NULL
> +#define	xhci_resume	NULL
> +#endif
> +
>  int xhci_get_frame(struct usb_hcd *hcd);
>  irqreturn_t xhci_irq(struct usb_hcd *hcd);
>  irqreturn_t xhci_msi_irq(int irq, struct usb_hcd *hcd);
> @@ -1481,8 +1488,15 @@ void xhci_ring_ep_doorbell(struct xhci_hcd *xhci, unsigned int slot_id,
>  int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue, u16 wIndex,
>  		char *buf, u16 wLength);
>  int xhci_hub_status_data(struct usb_hcd *hcd, char *buf);
> +
> +#ifdef CONFIG_PM
>  int xhci_bus_suspend(struct usb_hcd *hcd);
>  int xhci_bus_resume(struct usb_hcd *hcd);
> +#else
> +#define	xhci_bus_suspend	NULL
> +#define	xhci_bus_resume		NULL
> +#endif	/* CONFIG_PM */
> +
>  u32 xhci_port_state_to_neutral(u32 state);
>  int xhci_find_slot_id_by_port(struct xhci_hcd *xhci, u16 port);
>  void xhci_ring_device(struct xhci_hcd *xhci, int slot_id);
> -- 
> 1.6.3.3
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
