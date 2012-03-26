From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: linux-next: Tree for Mar 26 (usbcore)
Date: Mon, 26 Mar 2012 11:07:36 -0700
Message-ID: <20120326180736.GA2893@kroah.com>
References: <20120326152807.debdb1ec426b3c370c121178@canb.auug.org.au>
 <4F70A03C.2070400@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4F70A03C.2070400@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Mar 26, 2012 at 09:58:36AM -0700, Randy Dunlap wrote:
> On 03/25/2012 09:28 PM, Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Reminder: please do not add stuff destined for v3.5 to linux-next
> > included trees/branches until after v3.4-rc1 has been released.
> > 
> > Changes since 20120323:
> 
> 
> 
> on x86_64:
> 
> ERROR: "utf16s_to_utf8s" [drivers/usb/core/usbcore.ko] undefined!
> ERROR: "usb_speed_string" [drivers/usb/core/usbcore.ko] undefined!
> 
> Full randconfig file is attached.

Odd, nothing in the usb core has changed in a while in this area,
although we might have gotten some core dependancies mixed up for random
configurations like this.

Any patches would be greatly appreciated...

greg k-h
