From: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
Subject: Re: [Patch - Next] [USB/FHCI] use dev_name() in place of bus_id.
Date: Mon, 16 Feb 2009 16:48:55 +0300
Message-ID: <20090216134855.GA26671@oksana.dev.rtsoft.ru>
References: <20090216172016.f1d159a7.sfr@canb.auug.org.au> <499929CB.2030004@in.ibm.com> <20090216211310.5513de1a.sfr@canb.auug.org.au> <49996CBB.7040007@in.ibm.com>
Reply-To: avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <49996CBB.7040007-xthvdsQ13ZrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Sachin P. Sant" <sachinp-xthvdsQ13ZrQT0dZR+AlfA@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org>, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Mon, Feb 16, 2009 at 07:10:11PM +0530, Sachin P. Sant wrote:
> Replace references to bus_id with dev_name() to fix fhci driver build break.
>
> drivers/usb/host/fhci-hcd.c:586: error: struct device has no member named bus_id
> drivers/usb/host/fhci-hcd.c:653: error: struct device has no member named bus_id
> drivers/usb/host/fhci-dbg.c:111: error: struct device has no member named bus_id
>
> Signed-off-by: Sachin Sant <sachinp-xthvdsQ13ZrQT0dZR+AlfA@public.gmane.org>

Acked-by: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>

Thanks for catching this.

> ---
> 
> diff -Naurp a/drivers/usb/host/fhci-dbg.c b/drivers/usb/host/fhci-dbg.c
> --- a/drivers/usb/host/fhci-dbg.c	2009-02-14 05:01:30.000000000 +0530
> +++ b/drivers/usb/host/fhci-dbg.c	2009-02-16 18:19:25.000000000 +0530
> @@ -108,7 +108,7 @@ void fhci_dfs_create(struct fhci_hcd *fh
>  {
>  	struct device *dev = fhci_to_hcd(fhci)->self.controller;
>  
> -	fhci->dfs_root = debugfs_create_dir(dev->bus_id, NULL);
> +	fhci->dfs_root = debugfs_create_dir(dev_name(dev), NULL);
>  	if (!fhci->dfs_root) {
>  		WARN_ON(1);
>  		return;
> diff -Naurp a/drivers/usb/host/fhci-hcd.c b/drivers/usb/host/fhci-hcd.c
> --- a/drivers/usb/host/fhci-hcd.c	2009-02-14 05:01:30.000000000 +0530
> +++ b/drivers/usb/host/fhci-hcd.c	2009-02-16 18:19:00.000000000 +0530
> @@ -583,7 +583,7 @@ static int __devinit of_fhci_probe(struc
>  	if (sprop && strcmp(sprop, "host"))
>  		return -ENODEV;
>  
> -	hcd = usb_create_hcd(&fhci_driver, dev, dev->bus_id);
> +	hcd = usb_create_hcd(&fhci_driver, dev, dev_name(dev));
>  	if (!hcd) {
>  		dev_err(dev, "could not create hcd\n");
>  		return -ENOMEM;
> @@ -650,7 +650,7 @@ static int __devinit of_fhci_probe(struc
>  			}
>  		}
>  
> -		ret = gpio_request(gpio, dev->bus_id);
> +		ret = gpio_request(gpio, dev_name(dev));
>  		if (ret) {
>  			dev_err(dev, "failed to request gpio %d", i);
>  			goto err_gpios;


-- 
Anton Vorontsov
email: cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
irc://irc.freenode.net/bd2
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
