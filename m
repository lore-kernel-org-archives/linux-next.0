From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for July 13 (staging/usbip)
Date: Mon, 13 Jul 2009 09:34:43 -0700
Message-ID: <20090713093443.4d3ecfb1.randy.dunlap@oracle.com>
References: <20090713180524.72f613dc.sfr@canb.auug.org.au>
	<20090713085915.6bbd4879.randy.dunlap@oracle.com>
	<20090713162511.GB22074@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:45760 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756365AbZGMQei (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 13 Jul 2009 12:34:38 -0400
In-Reply-To: <20090713162511.GB22074@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, 13 Jul 2009 09:25:11 -0700 Greg KH wrote:

> On Mon, Jul 13, 2009 at 08:59:15AM -0700, Randy Dunlap wrote:
> > On Mon, 13 Jul 2009 18:05:24 +1000 Stephen Rothwell wrote:
> > 
> > > Hi all,
> > > 
> > > Changes since 20090710:
> > 
> > 
> > drivers/staging/usbip/usbip_common.c: In function 'usbip_thread':
> > drivers/staging/usbip/usbip_common.c:386: error: implicit declaration of function 'lock_kernel'
> > drivers/staging/usbip/usbip_common.c:390: error: implicit declaration of function 'unlock_kernel'
> > 
> > config attached.
> 
> Odd, that code has not changed at all.
> 
> Did we just loose the big kernel lock somehow?

I dunno.  Probably some header file cleanup thing.  :(

Looks like only linux/smp_lock.h #defines it, but a driver shouldn't
need to #include that file IMHO.


---
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
