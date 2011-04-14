From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warnings after merge of the usb tree
Date: Wed, 13 Apr 2011 21:51:57 -0700
Message-ID: <20110414045157.GA19370@kroah.com>
References: <20110414141831.16796e84.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:40977 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751637Ab1DNEvV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 Apr 2011 00:51:21 -0400
Content-Disposition: inline
In-Reply-To: <20110414141831.16796e84.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

On Thu, Apr 14, 2011 at 02:18:31PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) produced these warnings:
> 
> drivers/usb/renesas_usbhs/pipe.c: In function 'usbhsp_pipectrl_set':
> drivers/usb/renesas_usbhs/pipe.c:81: warning: cast from pointer to integer of different size
> drivers/usb/renesas_usbhs/pipe.c:81: warning: cast from pointer to integer of different size
> drivers/usb/renesas_usbhs/pipe.c: In function 'usbhsp_pipectrl_get':
> drivers/usb/renesas_usbhs/pipe.c:92: warning: cast from pointer to integer of different size
> drivers/usb/renesas_usbhs/pipe.c:92: warning: cast from pointer to integer of different size
> drivers/usb/renesas_usbhs/pipe.c: In function 'usbhsp_pipe_select':
> drivers/usb/renesas_usbhs/pipe.c:180: warning: cast from pointer to integer of different size
> drivers/usb/renesas_usbhs/pipe.c:180: warning: cast from pointer to integer of different size
> drivers/usb/renesas_usbhs/pipe.c: In function 'usbhsp_fifo_select':
> drivers/usb/renesas_usbhs/pipe.c:350: warning: cast from pointer to integer of different size
> drivers/usb/renesas_usbhs/pipe.c:350: warning: cast from pointer to integer of different size
> drivers/usb/renesas_usbhs/pipe.c: In function 'usbhsp_setup_pipebuff':
> drivers/usb/renesas_usbhs/pipe.c:604: warning: cast from pointer to integer of different size
> drivers/usb/renesas_usbhs/pipe.c:604: warning: cast from pointer to integer of different size
> drivers/usb/renesas_usbhs/pipe.c: In function 'usbhs_pipe_malloc':
> drivers/usb/renesas_usbhs/pipe.c:775: warning: cast from pointer to integer of different size
> drivers/usb/renesas_usbhs/pipe.c:775: warning: cast from pointer to integer of different size
> drivers/usb/renesas_usbhs/pipe.c:775: warning: format '%d' expects type 'int', but argument 3 has type 'long unsigned int'
> drivers/usb/renesas_usbhs/pipe.c:795: warning: cast from pointer to integer of different size
> drivers/usb/renesas_usbhs/pipe.c:795: warning: cast from pointer to integer of different size
> drivers/usb/renesas_usbhs/pipe.c:795: warning: format '%d' expects type 'int', but argument 4 has type 'long unsigned int'
> 
> Introduced by commit f1407d5c6624 ("usb: renesas_usbhs: Add Renesas USBHS
> common code").

Yeah, the developer was told about this already and is working on it.

thanks,

greg k-h
