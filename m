From: Aleksey Gorelov <dared1st@yahoo.com>
Subject: Re: linux-next: ttydev tree build failure
Date: Fri, 18 Jul 2008 14:34:18 -0700 (PDT)
Message-ID: <944003.64972.qm@web83313.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from web83313.mail.sp1.yahoo.com ([69.147.64.46]:24279 "HELO
	web83313.mail.sp1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1754521AbYGRVlj (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2008 17:41:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>



----- Original Message ----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> To: Alan Cox <alan@lxorguk.ukuu.org.uk>
> Cc: linux-next@vger.kernel.org; Greg KH <greg@kroah.com>; Aleksey Gorelov <dared1st@yahoo.com>
> Sent: Friday, July 18, 2008 1:59:45 AM
> Subject: linux-next: ttydev tree build failure
> 
> Hi Alan,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/usb/serial/usb_debug.c: In function 'usb_debug_open':
> drivers/usb/serial/usb_debug.c:37: warning: passing argument 1 of 
> 'usb_serial_generic_open' from incompatible pointer type
> drivers/usb/serial/usb_debug.c:37: warning: passing argument 2 of 
> 'usb_serial_generic_open' from incompatible pointer type
> drivers/usb/serial/usb_debug.c:37: error: too few arguments to function 
> 'usb_serial_generic_open'
> drivers/usb/serial/usb_debug.c: At top level:
> drivers/usb/serial/usb_debug.c:47: warning: initialization from incompatible 
> pointer type
> 
> usb_debug_open was added in commit
> 1d051a41474c386498bc37e3ae89f7937222cfe7 ("USB: debug port converter does
> not accept more than 8 byte packets") from the usb tree.
> 
> I applied the patch below and will do so until it can be resolved.
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> From 36676f026d56652cf4d42c13651373dc6a232141 Mon Sep 17 00:00:00 2001
> From: Stephen Rothwell 
> Date: Fri, 18 Jul 2008 18:54:09 +1000
> Subject: [PATCH] usb: tty API change fallout
> 
> Signed-off-by: Stephen Rothwell 
> ---
> drivers/usb/serial/usb_debug.c |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/serial/usb_debug.c b/drivers/usb/serial/usb_debug.c
> index 9ca4d4d..06a272b 100644
> --- a/drivers/usb/serial/usb_debug.c
> +++ b/drivers/usb/serial/usb_debug.c
> @@ -31,10 +31,10 @@ static struct usb_driver debug_driver = {
>     .no_dynamic_id =     1,
> };
> 
> -int usb_debug_open(struct usb_serial_port *port, struct file *filp)
> +int usb_debug_open(struct tty_struct *tty, struct usb_serial_port *port, struct 
> file *filp)
> {
>     port->bulk_out_size = USB_DEBUG_MAX_PACKET_SIZE;
> -    return usb_serial_generic_open(port, filp);
> +    return usb_serial_generic_open(tty, port, filp);
> }
> 
> static struct usb_serial_driver debug_device = {
> -- 
> 1.5.6.2

original patch was against 2.6.26 git which still has
int usb_serial_generic_open (struct usb_serial_port *port, struct file *filp)

Aleks.
