From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH -next] usb: add usb.h stubs for CONFIG_USB not enabled
Date: Mon, 11 Jun 2012 16:07:23 -0700
Message-ID: <20120611230723.GA25565@kroah.com>
References: <Pine.LNX.4.44L0.1205191026400.1348-100000@netrider.rowland.org>
 <4FB7C0E4.4000008@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FB7C0E4.4000008-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ian Abbott <abbotti-GUHe90Wt2aFaa/9Udqfwiw@public.gmane.org>, Frank Mori Hess <fmhess-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Sat, May 19, 2012 at 08:48:52AM -0700, Randy Dunlap wrote:
> On 05/19/2012 07:30 AM, Alan Stern wrote:
> 
> > On Fri, 18 May 2012, Randy Dunlap wrote:
> > 
> >> From: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
> >>
> >> Add stubs for some usb core functions when CONFIG_USB
> >> is not enabled.  This fixes these comedi build errors:
> >>
> >> ERROR: "usb_deregister" [drivers/staging/comedi/comedi.ko] undefined!
> >> ERROR: "usb_register_driver" [drivers/staging/comedi/comedi.ko] undefined!
> >>
> >> Signed-off-by: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
> >> ---
> >> I am only adding the stubs that are needed for comedi to build.
> >> I expect that more stubs will be needed as more build errors are
> >> found.  It seems to me that linux/usb.h might need more (major)
> >> moving of lines to support more stubs in the future.
> > 
> > This doesn't seem like the right thing to do.  If a driver needs to 
> > register with the USB core then that driver should depend on 
> > CONFIG_USB.
> > 
> > On the other hand, if the driver is capable of being built without USB 
> > support then it should use the necessary preprocessor tests to protect 
> > calls to any USB routines.
> 
> 
> Yeah, my first patch (not on linux-usb list) to staging/comedi/drivers.c
> just surrounded the usb helper functions with IS_ENABLED(CONFIG_USB).
> I'm fine with that patch, but Greg said that he wanted stubs...

In looking at this a bit more, I think we should go back to the "fix up
comedi" patch, as it is less intrusive, and as we haven't needed these
stubs for the past 10+ years, we probably shouldn't add them now :)

So, do you happen to have that old patch around, or do you want me to
make those changes?

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
