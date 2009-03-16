From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: manual merge of the async_tx tree with the arm tree
Date: Mon, 16 Mar 2009 15:18:07 -0700
Message-ID: <1237241887.27945.13.camel@dwillia2-linux.ch.intel.com>
References: <20090316151054.b518091c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:44194 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751511AbZCPWSJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 18:18:09 -0400
In-Reply-To: <20090316151054.b518091c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Russell King <rmk@arm.linux.org.uk>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Guennadi Liakhovetski <lg@denx.de>

On Sun, 2009-03-15 at 21:10 -0700, Stephen Rothwell wrote:
> Hi Dan, Russell,
> 
> Today's linux-next merge of the async_tx tree got a conflict in
> drivers/video/mx3fb.c between commit
> 9eb2eb8c40ffd30da322648c4415bae0288eb167 ("MX31 clkdev support") from the
> arm tree and commits 1febd91acff907152e61eb5ad0a82dd8d7db21c6 ("Revert
> "i.MX31: framebuffer driver"") and
> 6e1588cbd88590273300403648aef70e6bdaf5af ("i.MX31: framebuffer driver")
> from the async_tx tree.
> 
> I fixed it up (see below) and can carry the fix as necessary).
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/

Thanks Stephen!

Russell, if you are merging other changes for this driver it makes sense
for the tabs-to-space fix to go in through your tree as well.  If you
agree please pull from:

 git://git.kernel.org/pub/scm/linux/kernel/git/djbw/async_tx.git imx-fb-fix

...to receive:

Dan Williams (1):
      Revert "i.MX31: framebuffer driver"

Guennadi Liakhovetski (1):
      i.MX31: framebuffer driver

 arch/arm/plat-mxc/include/mach/mx3fb.h |   26 +-
 drivers/video/Kconfig                  |   20 +-
 drivers/video/Makefile                 |    2 +-
 drivers/video/mx3fb.c                  | 2300 ++++++++++++++++----------------
 4 files changed, 1174 insertions(+), 1174 deletions(-)

Thanks,
Dan
