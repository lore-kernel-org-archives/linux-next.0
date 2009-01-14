From: Greg KH <gregkh@suse.de>
Subject: Re: [BUILD-FAILURE] next-20090114 - drivers/staging/meilhaus
Date: Wed, 14 Jan 2009 10:50:29 -0800
Message-ID: <20090114185029.GA29674@suse.de>
References: <20090114165002.3bbe49d7.sfr@canb.auug.org.au> <20090114180024.GB4796@linux.vnet.ibm.com> <20090114180403.GA16974@suse.de> <496E2AEE.3060709@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755645AbZANSvz@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <496E2AEE.3060709@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Jan 14, 2009 at 10:11:58AM -0800, Randy Dunlap wrote:
> Greg KH wrote:
> > On Wed, Jan 14, 2009 at 11:30:24PM +0530, Kamalesh Babulal wrote:
> >> Hi Stephen,
> >>
> >> 	next-20090114 randconfig build on x86_64 machine fails,
> >>
> >>   LD      drivers/staging/meilhaus/built-in.o
> >> drivers/staging/meilhaus/me1600.o: In function `cleanup_module':
> >> (.exit.text+0x0): multiple definition of `cleanup_module'
> >> drivers/staging/meilhaus/memain.o:memain.c:(.exit.text+0x0): first defined here
> > 
> > Yeah, a lot of these staging drivers can't handle being built into the
> > kernel.
> > 
> > At first glance, I don't see a way to prevent this, is there some
> > Kconfig option I can use to say, "this can only be a module or disabled,
> > not build statically"?
> 
> 	depends on m

Doh, it's even documented!

Thanks, I'll go fix that all up.

greg k-h
