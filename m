From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next build poblems
Date: Mon, 23 Jun 2008 21:32:49 +0100
Message-ID: <20080623203249.GB16238@flint.arm.linux.org.uk>
References: <20080624022232.5c81519c.sfr@canb.auug.org.au> <20080623171023.GA16238@flint.arm.linux.org.uk> <20080623200702.GC8573@uranus.ravnborg.org> <20080623202156.GA12027@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:53557 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752426AbYFWUdZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 Jun 2008 16:33:25 -0400
Content-Disposition: inline
In-Reply-To: <20080623202156.GA12027@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Haavard Skinnemoen <hskinnemoen@atmel.com>, Paul Mundt <lethal@linux-sh.org>, linux-next@vger.kernel.org

On Mon, Jun 23, 2008 at 10:21:56PM +0200, Sam Ravnborg wrote:
> > 
> > I need to work out something.
> > But my first attemps failed miserably and I will stop for now
> > as I have some day-time job stuff to be done.
> > Travelling for a few days from now one so I cannot do anything
> > until the weekend.
> I came up with the following fix.
> And I fixed an arm tool chain for my box so I could check it.
> 
> We can now build an arm kernel (or at least the first steps).
> 
> I have pushed it out to kbuild-next.git.
> And I will redo the patch series later so we do not bisect break arm etc.

Silly question, but what's wrong with restoring the symlink in the
build include/ directory?

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
