From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH -next] wusb: hwa-hc: Drop unused pci_suspend/resume
	hooks.
Date: Thu, 30 Apr 2009 09:12:32 -0700
Message-ID: <20090430161232.GA18495@kroah.com>
References: <20090430084101.GA11696@linux-sh.org> <49F965CA.2050704@csr.com> <20090430154939.GB19977@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:52211 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753837AbZD3QP5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Apr 2009 12:15:57 -0400
Content-Disposition: inline
In-Reply-To: <20090430154939.GB19977@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@suse.de>
Cc: David Vrabel <david.vrabel@csr.com>, Paul Mundt <lethal@linux-sh.org>, linux-next@vger.kernel.org, Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>

On Thu, Apr 30, 2009 at 08:49:40AM -0700, Greg KH wrote:
> On Thu, Apr 30, 2009 at 09:48:10AM +0100, David Vrabel wrote:
> > Paul Mundt wrote:
> > >   CC      drivers/usb/host/hwa-hc.o
> > > drivers/usb/host/hwa-hc.c:601: warning: initialization from incompatible pointer type
> > > drivers/usb/host/hwa-hc.c:602: warning: initialization from incompatible pointer type
> > > 
> > > The prototype for these changed, so the message itself was dropped. As the only
> > > thing these hooks were doing was printing out the message for debugging, there
> > > is not much point in keeping them around. So, just kill them off.
> > 
> > Acked-by: David Vrabel <david.vrabel@csr.com>
> > 
> > Greg, can you pick this one up, please.
> 
> I don't seem to have it in my archive, can you resend it to me with your
> ack?

Nevermind, I found it...

thanks,

greg k-h
