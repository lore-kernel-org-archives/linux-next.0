From: Rodolfo Giometti <giometti-AVVDYK/kqiJWk0Htik3J/w@public.gmane.org>
Subject: Re: next-20081103: oxu210hp-hcd.c:3849: error: implicit
	declaration of function 'set_irq_type'
Date: Tue, 4 Nov 2008 20:45:29 +0100
Message-ID: <20081104194528.GI32133@tekkaman>
References: <20081103183214.aac32543.sfr@canb.auug.org.au> <20081103155047.GA14489@x200.localdomain> <20081104163038.GF32133@tekkaman> <20081104184334.GA1840@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20081104184334.GA1840-l3A5Bk7waGM@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
Cc: Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Tue, Nov 04, 2008 at 10:43:34AM -0800, Greg KH wrote:
> On Tue, Nov 04, 2008 at 05:30:38PM +0100, Rodolfo Giometti wrote:
> > On Mon, Nov 03, 2008 at 06:50:47PM +0300, Alexey Dobriyan wrote:
> > > On sparc:
> > > 
> > > drivers/usb/host/oxu210hp-hcd.c:3849: error: implicit declaration of function 'set_irq_type'
> > > 
> > > and including linux/irq.h doesn't cut it CONFIG_GENERIC_HARDIRQS aren't set.
> > 
> > Should I force CONFIG_GENERIC_HARDIRQS selection?
> 
> Can this hardware work on SPARC?

I think so even if on the data sheet is not specified...

Ciao,

Rodolfo

-- 

GNU/Linux Solutions                  e-mail: giometti-AVVDYK/kqiJWk0Htik3J/w@public.gmane.org
Linux Device Driver                          giometti-k2GhghHVRtY@public.gmane.org
Embedded Systems                     phone:  +39 349 2432127
UNIX programming                     skype:  rodolfo.giometti
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
