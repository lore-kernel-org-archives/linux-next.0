From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: manual merge of the async_tx tree with the arm tree
Date: Mon, 16 Mar 2009 22:28:22 +0000
Message-ID: <20090316222822.GA12334@flint.arm.linux.org.uk>
References: <20090316151054.b518091c.sfr@canb.auug.org.au> <1237241887.27945.13.camel@dwillia2-linux.ch.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:57830 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751484AbZCPW2o (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Mar 2009 18:28:44 -0400
Content-Disposition: inline
In-Reply-To: <1237241887.27945.13.camel@dwillia2-linux.ch.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Guennadi Liakhovetski <lg@denx.de>

On Mon, Mar 16, 2009 at 03:18:07PM -0700, Dan Williams wrote:
> On Sun, 2009-03-15 at 21:10 -0700, Stephen Rothwell wrote:
> > Hi Dan, Russell,
> > 
> > Today's linux-next merge of the async_tx tree got a conflict in
> > drivers/video/mx3fb.c between commit
> > 9eb2eb8c40ffd30da322648c4415bae0288eb167 ("MX31 clkdev support") from the
> > arm tree and commits 1febd91acff907152e61eb5ad0a82dd8d7db21c6 ("Revert
> > "i.MX31: framebuffer driver"") and
> > 6e1588cbd88590273300403648aef70e6bdaf5af ("i.MX31: framebuffer driver")
> > from the async_tx tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary).
> > --
> > Cheers,
> > Stephen Rothwell                    sfr@canb.auug.org.au
> > http://www.canb.auug.org.au/~sfr/
> 
> Thanks Stephen!
> 
> Russell, if you are merging other changes for this driver it makes sense
> for the tabs-to-space fix to go in through your tree as well.  If you
> agree please pull from:
> 
>  git://git.kernel.org/pub/scm/linux/kernel/git/djbw/async_tx.git imx-fb-fix

Pulled.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
