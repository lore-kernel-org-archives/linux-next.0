From: Tony Lindgren <tony@atomide.com>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Wed, 7 Dec 2011 11:28:43 -0800
Message-ID: <20111207192842.GF31337@atomide.com>
References: <20111128105633.8a8c06afce3cdccb1ce0d7b7@canb.auug.org.au>
 <201111281911.36341.arnd@arndb.de>
 <1322553977.1869.1.camel@deskari>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mho-03-ewr.mailhop.org ([204.13.248.66]:43729 "EHLO
	mho-01-ewr.mailhop.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1756664Ab1LGT2t (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Dec 2011 14:28:49 -0500
Content-Disposition: inline
In-Reply-To: <1322553977.1869.1.camel@deskari>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

* Tomi Valkeinen <tomi.valkeinen@ti.com> [111128 23:31]:
> Hi,
> 
> On Mon, 2011-11-28 at 19:11 +0000, Arnd Bergmann wrote:
> > On Sunday 27 November 2011, Stephen Rothwell wrote:
> > > Today's linux-next merge of the arm-soc tree got a conflict in
> > > arch/arm/plat-omap/include/plat/common.h between commit 4e65331c6bb4
> > > ("ARM: 7159/1: OMAP: Introduce local common.h files") from the  tree and
> > > commit 13662dc5b177 ("ARM: OMAP: HWMOD: Unify DSS resets for OMAPs") from
> > > the arm-soc tree.
> > > 
> > > I did the obvious fixup (see below) and can carry the fix as necessary.
> > 
> > Your fix looks technically correct, thanks!
> > 
> > Tony, I believe what you actually want here is to move omap_dss_reset
> > into mach-omap2/common.h, right?
> 
> omap_dss_reset will never be used by omap1 boards, so I think
> mach-omap2/common.h would be a good place for it.

Sorry for the delay. Yes mach-omap2/common.h is the way to go. That
comes from Russells devel-stable branch and was needed for the ARM
restart changes.

Tomi, if you need to, you can base your branch on commit
deee6d5359969a0ce4e2760cfd7b9f379bd5698a in Russell's devel-stable
branch.

Regards,

Tony
