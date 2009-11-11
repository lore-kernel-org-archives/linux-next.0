From: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Subject: Re: linux-next: Tree for November 2 (usb/whci)
Date: Wed, 11 Nov 2009 09:30:15 -0800
Message-ID: <20091111173015.GA9641@kroah.com>
References: <20091102173845.210d1c57.sfr@canb.auug.org.au> <20091102091339.479a3ddb.randy.dunlap@oracle.com> <20091111090403.5fb0229e.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20091111090403.5fb0229e.randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, David Vrabel <david.vrabel-kQvG35nSl+M@public.gmane.org>
Cc: lud <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Wed, Nov 11, 2009 at 09:04:03AM -0800, Randy Dunlap wrote:
> On Mon, 2 Nov 2009 09:13:39 -0800 Randy Dunlap wrote:
> 
> > On Mon, 2 Nov 2009 17:38:45 +1100 Stephen Rothwell wrote:
> > 
> > > Hi all,
> > > 
> > > Changes since 20091030: <<<<<<<<<<<<<<<<<<<<<<<<<<
> > 
> > 
> > whci build fails on i386 due to 64-bit multiply & divide:
> > 
> > ERROR: "__udivdi3" [drivers/usb/host/whci/whci-hcd.ko] undefined!
> > ERROR: "__umoddi3" [drivers/usb/host/whci/whci-hcd.ko] undefined!
> 
> 
> Still present in linux-next-20091111.

David, can you please look into this and resolve it?

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
