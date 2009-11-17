From: David Vrabel <david.vrabel-kQvG35nSl+M@public.gmane.org>
Subject: Re: linux-next: Tree for November 2 (usb/whci)
Date: Tue, 17 Nov 2009 18:49:52 +0000
Message-ID: <4B02F050.2080100@csr.com>
References: <20091102173845.210d1c57.sfr@canb.auug.org.au>	<20091102091339.479a3ddb.randy.dunlap@oracle.com>	<20091111090403.5fb0229e.randy.dunlap@oracle.com>	<20091111173015.GA9641@kroah.com>	<4B028BBB.1080803@csr.com> <20091117075101.0bf72415.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20091117075101.0bf72415.randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, lud <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Randy Dunlap wrote:
> 
> When the driver is built-in (not a loadable module), the messages are:
> 
> drivers/built-in.o: In function `qset_add_urb':
> (.text+0x4595f8): undefined reference to `__umoddi3'
> drivers/built-in.o: In function `qset_add_urb':
> (.text+0x45969a): undefined reference to `__udivdi3'
> 
> Those could still refer to other (inline) functions...

If HIGHMEM64G is set then dma_addr_t is 64 bits which is where the 64
bit maths come from.

David
-- 
David Vrabel, Senior Software Engineer, Drivers
CSR, Churchill House, Cambridge Business Park,  Tel: +44 (0)1223 692562
Cowley Road, Cambridge, CB4 0WZ                 http://www.csr.com/


Member of the CSR plc group of companies. CSR plc registered in England and Wales, registered number 4187346, registered office Churchill House, Cambridge Business Park, Cowley Road, Cambridge, CB4 0WZ, United Kingdom
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
