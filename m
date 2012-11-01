From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: linux-next: Tree for Oct 31 (ehci, dbgp)
Date: Thu, 1 Nov 2012 11:28:35 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1211011120230.1762-100000@iolanthe.rowland.org>
References: <509199A5.1090109@infradead.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <509199A5.1090109-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Beulich <JBeulich-IBi9RG/b67k@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kernel development list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Wed, 31 Oct 2012, Randy Dunlap wrote:

> On 10/30/2012 11:26 PM, Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Changes since 20121030:
> > 
> 
> 
> on x86_64:
> 
> drivers/built-in.o: In function `ehci_reset':
> host.c:(.text+0x542a7e): undefined reference to `dbgp_reset_prep'
> host.c:(.text+0x542b75): undefined reference to `dbgp_external_startup'
> drivers/built-in.o: In function `ehci_bus_resume':
> host.c:(.text+0x544705): undefined reference to `dbgp_reset_prep'
> host.c:(.text+0x544731): undefined reference to `dbgp_external_startup'

Jan:

We all forgot about the chipidea driver.  It includes code from 
ehci-hcd in a rather unorthodox manner (see 
drivers/usb/chipidea/host.c).

Evidently we need to change your new test in
drivers/usb/early/ehci-dbgp.c to:

#if IS_ENABLED(CONFIG_USB_HCD_EHCI) || defined(CONFIG_USB_CHIPIDEA_HOST)

Upcoming changes to ehci-hcd will make this unnecessary in 3.8, but for 
now we need it.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
