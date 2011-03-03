From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: linux-next: Tree for February 21 (usb/serial)
Date: Thu, 3 Mar 2011 13:51:52 -0800
Message-ID: <20110303135152.c4b53da1.randy.dunlap@oracle.com>
References: <20110221182134.09abd232.sfr@canb.auug.org.au>
	<20110221095732.b3842652.randy.dunlap@oracle.com>
	<201102212130.01789.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201102212130.01789.rjw-KKrjLPT3xs0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lud <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Mon, 21 Feb 2011 21:30:01 +0100 Rafael J. Wysocki wrote:

> On Monday, February 21, 2011, Randy Dunlap wrote:
> > On Mon, 21 Feb 2011 18:21:34 +1100 Stephen Rothwell wrote:
> > 
> > > Hi all,
> > > 
> > > Changes since 20110218:
> > 
> > 
> > When CONFIG_PM_RUNTIME is not enabled:
> > 
> > drivers/usb/serial/usb_wwan.c:702: error: 'struct dev_pm_info' has no member named 'usage_count'
> 
> This looks like a bug in the driver that shouldn't access this field directly.


This build error is still with us in linux-next 2011.0303.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
