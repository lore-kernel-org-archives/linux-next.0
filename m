From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: manual merge of the pxa tree
Date: Wed, 17 Sep 2008 23:28:57 +0100
Message-ID: <20080917222857.GC5475@flint.arm.linux.org.uk>
References: <20080918063109.5aee733d.sfr@canb.auug.org.au> <20080917214045.GB5475@flint.arm.linux.org.uk> <20080918081406.3a5e3865.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:44964 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753736AbYIQW3R (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Sep 2008 18:29:17 -0400
Content-Disposition: inline
In-Reply-To: <20080918081406.3a5e3865.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Eric Miao <eric.y.miao@gmail.com>, linux-next@vger.kernel.org

On Thu, Sep 18, 2008 at 08:14:06AM +1000, Stephen Rothwell wrote:
> Hi Russell,
> 
> On Wed, 17 Sep 2008 22:40:45 +0100 Russell King <rmk@arm.linux.org.uk> wrote:
> >
> > On Thu, Sep 18, 2008 at 06:31:09AM +1000, Stephen Rothwell wrote:
> > > Today's linux-next merge of the pxa tree got a conflict in
> > > arch/arm/mach-pxa/spitz.c between commit
> > > fced80c735941fa518ac67c0b61bbe153fb8c050 ("[ARM] Convert asm/io.h to
> > > linux/io.h") from the arm tree and commit
> > > 546ed5880bf813e1386696c02d288d7ffba517d6 ("[ARM] pxa/spitz: use SPI-based
> > > driver for ads7846, corgi-lcd and max1111") from the pxa tree.
> > > 
> > > Just overlapping additions.  I fixed it up (see below) and can carry the
> > > fix.
> > 
> > If you wait a bit, kicking my tree out will resolve that (since those
> > changes have been merged today.)
> 
> Thanks, I will pick that up tomorrow.

That's rather unfortunate - the timing of the pulls and our timezone
differences means that there's generally a delay of around 36 to 48 hours
between me putting stuff into my tree and the results being available.

Is there any way you could arrange for my tree to be towards the end of
the pulls so that it happens later (eg, after 11pm UTC would be ideal?)

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
