From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next build error (PNP/IXJ)
Date: Tue, 22 Jul 2008 13:32:57 -0700
Message-ID: <20080722133257.7362b9f1.rdunlap@xenotime.net>
References: <20080722102739.61462b04.randy.dunlap@oracle.com>
	<20080722173957.GA14846@cs181140183.pp.htv.fi>
	<20080722124152.facaa724.rdunlap@xenotime.net>
	<20080722201930.GB14846@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xenotime.net ([66.160.160.81]:36308 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751538AbYGVUdA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Jul 2008 16:33:00 -0400
Received: from chimera.site ([96.225.228.12]) by xenotime.net for <linux-next@vger.kernel.org>; Tue, 22 Jul 2008 13:32:58 -0700
In-Reply-To: <20080722201930.GB14846@cs181140183.pp.htv.fi>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: bjorn.helgaas@hp.com, linux-next@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

On Tue, 22 Jul 2008 23:19:30 +0300 Adrian Bunk wrote:

> On Tue, Jul 22, 2008 at 12:41:52PM -0700, Randy Dunlap wrote:
> > On Tue, 22 Jul 2008 20:39:57 +0300 Adrian Bunk wrote:
> > 
> > > On Tue, Jul 22, 2008 at 10:27:39AM -0700, Randy Dunlap wrote:
> > > > Hi,
> > > > 
> > > > I'm seeing several build errors in linux-next-20080722 that I haven't
> > > > seen previously, although I don't know what changed to cause this.
> > > > 
> > > > They are all basically the same, in ixj (drivers/telephony/ixj*), when
> > > > CONFIG_PNP=n, and CONFIG_PHONE_IXJ=y or =m (so the actual error message
> > > > varies depending on IXJ=y or =m):
> > > > 
> > > > IXJ=y:
> > > > ixj.c:(.text+0x329d98): undefined reference to `pnp_get_resource'
> > > > or IXJ=m:
> > > > ERROR: "pnp_get_resource" [drivers/telephony/ixj.ko] undefined!
> > > > 
> > > > 
> > > > Suggestions?
> > > 
> > > Please send a .config
> > 
> > attached.  (IXJ=m)
> 
> Works for me with gcc 4.3.1.
> Which gcc version are you using?

gcc (GCC) 4.2.1 (SUSE Linux)

> Does disabling CONFIG_OPTIMIZE_INLINING fix it for you?

Hmpf.  Yes, it sure does.

---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
