From: Greg KH <gregkh@suse.de>
Subject: Re: [PATCH -next] wusb: hwa-hc: Drop unused pci_suspend/resume
	hooks.
Date: Thu, 30 Apr 2009 08:49:40 -0700
Message-ID: <20090430154939.GB19977@suse.de>
References: <20090430084101.GA11696@linux-sh.org> <49F965CA.2050704@csr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54848 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1764272AbZD3P63 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Apr 2009 11:58:29 -0400
Content-Disposition: inline
In-Reply-To: <49F965CA.2050704@csr.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Vrabel <david.vrabel@csr.com>
Cc: Paul Mundt <lethal@linux-sh.org>, linux-next@vger.kernel.org, Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>

On Thu, Apr 30, 2009 at 09:48:10AM +0100, David Vrabel wrote:
> Paul Mundt wrote:
> >   CC      drivers/usb/host/hwa-hc.o
> > drivers/usb/host/hwa-hc.c:601: warning: initialization from incompatible pointer type
> > drivers/usb/host/hwa-hc.c:602: warning: initialization from incompatible pointer type
> > 
> > The prototype for these changed, so the message itself was dropped. As the only
> > thing these hooks were doing was printing out the message for debugging, there
> > is not much point in keeping them around. So, just kill them off.
> 
> Acked-by: David Vrabel <david.vrabel@csr.com>
> 
> Greg, can you pick this one up, please.

I don't seem to have it in my archive, can you resend it to me with your
ack?

thanks,

greg k-h
