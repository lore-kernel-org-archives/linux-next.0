From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for November 2 (usb/whci)
Date: Tue, 17 Nov 2009 07:51:01 -0800
Message-ID: <20091117075101.0bf72415.randy.dunlap@oracle.com>
References: <20091102173845.210d1c57.sfr@canb.auug.org.au>
	<20091102091339.479a3ddb.randy.dunlap@oracle.com>
	<20091111090403.5fb0229e.randy.dunlap@oracle.com>
	<20091111173015.GA9641@kroah.com>
	<4B028BBB.1080803@csr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:32147 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750905AbZKQPvj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Nov 2009 10:51:39 -0500
In-Reply-To: <4B028BBB.1080803@csr.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Vrabel <david.vrabel@csr.com>
Cc: Greg KH <greg@kroah.com>, lud <linux-usb@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 17 Nov 2009 11:40:43 +0000 David Vrabel wrote:

> Greg KH wrote:
> > On Wed, Nov 11, 2009 at 09:04:03AM -0800, Randy Dunlap wrote:
> >> On Mon, 2 Nov 2009 09:13:39 -0800 Randy Dunlap wrote:
> >>
> >>> On Mon, 2 Nov 2009 17:38:45 +1100 Stephen Rothwell wrote:
> >>>
> >>>> Hi all,
> >>>>
> >>>> Changes since 20091030: <<<<<<<<<<<<<<<<<<<<<<<<<<
> >>>
> >>> whci build fails on i386 due to 64-bit multiply & divide:
> >>>
> >>> ERROR: "__udivdi3" [drivers/usb/host/whci/whci-hcd.ko] undefined!
> >>> ERROR: "__umoddi3" [drivers/usb/host/whci/whci-hcd.ko] undefined!
> >>
> >> Still present in linux-next-20091111.
> > 
> > David, can you please look into this and resolve it?
> 
> Yes,  I've been on holiday and haven't had a change to look into it yet.
> 
> I can't immediately think of any 64 bit maths and I don't understand why
>  I haven't seen it.  I always build for i386.

When the driver is built-in (not a loadable module), the messages are:

drivers/built-in.o: In function `qset_add_urb':
(.text+0x4595f8): undefined reference to `__umoddi3'
drivers/built-in.o: In function `qset_add_urb':
(.text+0x45969a): undefined reference to `__udivdi3'

Those could still refer to other (inline) functions...

---
~Randy
