From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Mon, 24 Oct 2011 23:09:52 +0200
Message-ID: <20111024210952.GQ23421@pengutronix.de>
References: <20111025072013.1824cfd24495819777ad2660@canb.auug.org.au>
 <20111024203041.GA32545@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:42587 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755988Ab1JXVKB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 24 Oct 2011 17:10:01 -0400
Content-Disposition: inline
In-Reply-To: <20111024203041.GA32545@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Pitre <nicolas.pitre@linaro.org>

On Mon, Oct 24, 2011 at 09:30:41PM +0100, Russell King wrote:
> On Tue, Oct 25, 2011 at 07:20:13AM +1100, Stephen Rothwell wrote:
> > Hi Arnd,
> > 
> > Today's linux-next merge of the arm-soc tree got a conflict in
> > arch/arm/plat-mxc/include/mach/memory.h between commit c039bad00f21
> > ("ARM: plat-mxc: remove mach/memory.h") from the arm tree and commits
> > ae4fa7f66e54 ("ARM i.MX: allow to compile together ARMv4 and ARMv5 based
> > SoCs") and 7409cd1cd554 ("ARM i.MX: allow to compile together all i.MX5
> > based SoCs") from the arm-soc tree.
> > 
> > The former removed the file, so I did that.
> 
> Stephen - thanks.
> 
> ARM guys, we need to be smarter about this stuff - if we're consolidating
> code across the ARM tree, committing changes to files which we're going
> to remove really isn't a good idea.  It probably means something else has
> changed elsewhere to accomodate the deletion of the file, which this
> kind of resolution won't fix up.

In this case deleting the file is the correct solution. I removed some
definitions of PLAT_PHYS_OFFSET which got unused due to "ARM i.MX: allow
to compile together..." and Nicolas removed the need for PLAT_PHYS_OFFSET
at all.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
