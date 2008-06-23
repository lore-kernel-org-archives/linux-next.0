From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next build poblems
Date: Mon, 23 Jun 2008 22:07:02 +0200
Message-ID: <20080623200702.GC8573@uranus.ravnborg.org>
References: <20080624022232.5c81519c.sfr@canb.auug.org.au> <20080623171023.GA16238@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:48912 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754194AbYFWUGR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Jun 2008 16:06:17 -0400
Content-Disposition: inline
In-Reply-To: <20080623171023.GA16238@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Haavard Skinnemoen <hskinnemoen@atmel.com>, Paul Mundt <lethal@linux-sh.org>, linux-next@vger.kernel.org

On Mon, Jun 23, 2008 at 06:10:23PM +0100, Russell King wrote:
> On Tue, Jun 24, 2008 at 02:22:32AM +1000, Stephen Rothwell wrote:
> > Hi Sam,
> > 
> > I haven't had a good look, but something has gone badly wrong with the
> > arm, avr32 and sh builds of linux-next today.  Have a look at
> > http://kisskb.ellerman.id.au/linux-next.
> 
> Looks like samr's to blame.
Yes.

> 
> Before:
> /path/to/build/directory/include:
> lrwxrwxrwx   1 rmk rmk    7 Nov 27  2007 asm -> asm-arm
> drwxrwxr-x   2 rmk rmk 4096 Jun  2 19:40 asm-arm
> drwxr-xr-x 194 rmk rmk 8192 Jun  2 19:43 config
> drwxrwxr-x   2 rmk rmk 4096 Jun  2 19:43 linux
> 
> After:
> /path/to/build/directory/include:
> drwxrwxr-x   2 rmk rmk 4096 Jun 23 17:59 asm-arm
> drwxrwxr-x 107 rmk rmk 4096 Jun 23 18:00 config
> drwxrwxr-x   2 rmk rmk 4096 Jun 23 18:00 linux
> 
> and inside /path/to/build/directory/include/asm-arm:
> lrwxrwxrwx 1 rmk rmk     59 Jun 23 17:59 arch -> /home/rmk/git/linux-2.6-test/include/asm-arm/arch-versatile
> -rw-rw-r-- 1 rmk rmk 603835 Jun 23 17:59 mach-types.h
> 
> Note the symlink inside include/asm-arm, and the lack of asm -> asm-arm
> symlink.  This means that <asm/arch/foo.h> won't be found.

arm/Makefile create the directory asm-arm and use it for the symlink.
But now asm is no longer a symlink to asm-arm so we fail.

I need to work out something.
But my first attemps failed miserably and I will stop for now
as I have some day-time job stuff to be done.
Travelling for a few days from now one so I cannot do anything
until the weekend.

Either we should pull the offending commit from -next or drop
kbuild-next.git.

As a sidenote I expect arm to benefit of the offending patch as we
could kill the symlinks when the header files were rearranged.
But that does not help us here.

As for sh and avr they both play symlinks games too - so same story there.

	Sam
