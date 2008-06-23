From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next build poblems
Date: Mon, 23 Jun 2008 23:01:11 +0200
Message-ID: <20080623210111.GA16637@uranus.ravnborg.org>
References: <20080624022232.5c81519c.sfr@canb.auug.org.au> <20080623171023.GA16238@flint.arm.linux.org.uk> <20080623200702.GC8573@uranus.ravnborg.org> <20080623202156.GA12027@uranus.ravnborg.org> <20080623203249.GB16238@flint.arm.linux.org.uk> <20080623205133.GA12278@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:45656 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754149AbYFWVA0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Jun 2008 17:00:26 -0400
Content-Disposition: inline
In-Reply-To: <20080623205133.GA12278@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Haavard Skinnemoen <hskinnemoen@atmel.com>, Paul Mundt <lethal@linux-sh.org>, linux-next@vger.kernel.org

On Mon, Jun 23, 2008 at 10:51:33PM +0200, Sam Ravnborg wrote:
> On Mon, Jun 23, 2008 at 09:32:49PM +0100, Russell King wrote:
> > On Mon, Jun 23, 2008 at 10:21:56PM +0200, Sam Ravnborg wrote:
> > > > 
> > > > I need to work out something.
> > > > But my first attemps failed miserably and I will stop for now
> > > > as I have some day-time job stuff to be done.
> > > > Travelling for a few days from now one so I cannot do anything
> > > > until the weekend.
> > > I came up with the following fix.
> > > And I fixed an arm tool chain for my box so I could check it.
> > > 
> > > We can now build an arm kernel (or at least the first steps).
> > > 
> > > I have pushed it out to kbuild-next.git.
> > > And I will redo the patch series later so we do not bisect break arm etc.
> > 
> > Silly question, but what's wrong with restoring the symlink in the
> > build include/ directory?
> The asm-offsets.h file should always be generated in the same directory.
> And that is include/asm-$ARCH today.
> 
> But if we move include/asm-$ARCH to arch/$ARCH/include then that directory
> no longer exists.
> And I wanted to avoid adding generated files to arch/$ARCH/include
> so the obvious choice was to generate the asm-offsets.h file in
> include/asm which works in make O=... and 'normal' builds.
> 
> And because I were facing problams when asm was a symlink I
> went for the solution with asm being a directory.
> But then arm creates asm-arm as a directory too.
> 
> So I can try to see of I can make asm a symlink again
> to asm-$ARCH. Adding a include3 directory is not my preferred
> solution.

OK - I tried to do what you hinted and it seems to work.
Too late to push out something and I need to test more.
But seems to simplify things - which is good.

Now I wonder why I did not do so before - maybe to avoid the
symlink.

	Sam
