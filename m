From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: next-20080723: build fails for dm-snapshot.ko
Date: Wed, 23 Jul 2008 14:33:00 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0807231431250.3332@devserv.devel.redhat.com>
References: <1216835917.19707.3.camel@dhcppc2> <20080723182839.GF14846@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756261AbYGWSkS@vger.kernel.org>
In-Reply-To: <20080723182839.GF14846@cs181140183.pp.htv.fi>
Sender: linux-kernel-owner@vger.kernel.org
To: Adrian Bunk <bunk@kernel.org>
Cc: Thomas Meyer <thomas@m3y3r.de>, Linux Kernel <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, 23 Jul 2008, Adrian Bunk wrote:

> On Wed, Jul 23, 2008 at 07:58:37PM +0200, Thomas Meyer wrote:
> > 
> >   Building modules, stage 2.
> > Kernel: arch/x86/boot/bzImage is ready  (#24)
> >   MODPOST 1518 modules
> > ERROR: "__umoddi3" [drivers/md/dm-snapshot.ko] undefined!
> > WARNING: modpost: Found 6 section mismatch(es).
> > To see full details build your kernel with:
> > 'make CONFIG_DEBUG_SECTION_MISMATCH=y'
> > make[1]: *** [__modpost] Error 1
> > make: *** [modules] Error 2
> >...
> 
> Which gcc version are you using?
> 
> Please send the complete .config
> 
> cu
> Adrian

I'm going to compile it on 32-bit computer to try.

But I'd just suggest: why don't we add these functions __umoddi3 __udivdi3 
and so to the kernel? This is not the first time I see it and it is pretty 
annoying (and compiler- and optimization-dependent bug).

Mikulas
