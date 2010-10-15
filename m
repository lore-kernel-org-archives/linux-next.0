From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Tree for October 15 (usb/xhci)
Date: Fri, 15 Oct 2010 11:16:56 -0700
Message-ID: <20101015181656.GA6473@kroah.com>
References: <20101015165002.0b6e418f.sfr@canb.auug.org.au>
 <20101015084420.6624796d.randy.dunlap@oracle.com>
 <20101015164830.GA21576@kroah.com>
 <20101015175211.GA13313@xanatos>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101015175211.GA13313@xanatos>
Sender: linux-kernel-owner@vger.kernel.org
To: Sarah Sharp <sarah.a.sharp@linux.intel.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, lud <linux-usb@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Oct 15, 2010 at 10:52:11AM -0700, Sarah Sharp wrote:
> On Fri, Oct 15, 2010 at 09:48:30AM -0700, Greg KH wrote:
> > On Fri, Oct 15, 2010 at 08:44:20AM -0700, Randy Dunlap wrote:
> > > On Fri, 15 Oct 2010 16:50:02 +1100 Stephen Rothwell wrote:
> > > 
> > > > Hi all,
> > > > 
> > > > Changes since 20101014:
> > > 
> > > 
> > > When CONFIG_PM is not enabled:
> > > 
> > > drivers/usb/host/xhci.c:675: error: implicit declaration of function 'usb_root_hub_lost_power'
> > > 
> > > Also, can xhci.c:xhci_suspend() and xhci_resume() be inside
> > > #ifdef CONFIG_PM / #endif ?
> > 
> > Sarah, care to send me a follow-on patch fixing this up?
> 
> Sure.  Do you want me to rework the last patch (patch 8), or just send a
> bug fix?

A bug fix is fine.

thanks,

greg k-h
