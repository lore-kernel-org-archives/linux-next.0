From: Greg KH <gregkh@suse.de>
Subject: Re: staging: cpc-usb: wrong Makefile path
Date: Tue, 19 May 2009 10:24:27 -0700
Message-ID: <20090519172427.GB30522@suse.de>
References: <a4423d670905191009i450545f6le9c49e84c5ce94fd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:35765 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752005AbZESR3W (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 May 2009 13:29:22 -0400
Content-Disposition: inline
In-Reply-To: <a4423d670905191009i450545f6le9c49e84c5ce94fd@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, May 19, 2009 at 09:09:53PM +0400, Alexander Beregalov wrote:
> diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
> index 9492a6f..cc1aac2 100644
> --- a/drivers/staging/Makefile
> +++ b/drivers/staging/Makefile
> @@ -40,4 +40,4 @@ obj-$(CONFIG_PLAN9AUTH)               += p9auth/
>  obj-$(CONFIG_HECI)             += heci/
>  obj-$(CONFIG_LINE6_USB)                += line6/
>  obj-$(CONFIG_USB_SERIAL_QUATECH_ESU100)        += serqt_usb/
> -obj-$(CONFIG_USB_CPC)          += cpc_usb/
> +obj-$(CONFIG_USB_CPC)          += cpc-usb/

Heh, wierd, I wonder how it was working for me when I tested this...

thanks,

greg k-h
