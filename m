From: Len Brown <lenb@kernel.org>
Subject: Re: [PATCH -next] thermal: depends on NET
Date: Wed, 12 Jan 2011 00:18:39 -0500 (EST)
Message-ID: <alpine.LFD.2.02.1101120008590.19140@x980>
References: <20101213163607.0b0a7c3a.sfr@canb.auug.org.au>
 <20101213112033.d0060e6c.randy.dunlap@oracle.com>
 <20110110090059.6f4d739d.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-acpi-owner@vger.kernel.org>
In-reply-to: <20110110090059.6f4d739d.randy.dunlap@oracle.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: linux-acpi@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>, Zhang Rui <rui.zhang@intel.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Zimny Lech <napohybelskurwysynom2010@gmail.com>
List-Id: linux-next.vger.kernel.org

> > --- linux-next-20101213.orig/drivers/thermal/Kconfig
> > +++ linux-next-20101213/drivers/thermal/Kconfig
> > @@ -4,6 +4,7 @@
> >  
> >  menuconfig THERMAL
> >  	tristate "Generic Thermal sysfs driver"
> > +	depends on NET

I've added this line to the offending patch.

While I agree that randconfig build testing
is theoretically useful, in recent memory
its results do not seem particularly relevant
to useful configs.

Perhaps it would be a good idea to spend some time
making non-useful configs impossible, and thus focus
the testing where it will be of more benefit?

thanks,
Len Brown, Intel Open Source Technology Center
