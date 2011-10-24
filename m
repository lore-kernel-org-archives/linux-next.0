From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Mon, 24 Oct 2011 21:30:41 +0100
Message-ID: <20111024203041.GA32545@flint.arm.linux.org.uk>
References: <20111025072013.1824cfd24495819777ad2660@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:41769 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755115Ab1JXUa4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 24 Oct 2011 16:30:56 -0400
Content-Disposition: inline
In-Reply-To: <20111025072013.1824cfd24495819777ad2660@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Pitre <nicolas.pitre@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>

On Tue, Oct 25, 2011 at 07:20:13AM +1100, Stephen Rothwell wrote:
> Hi Arnd,
> 
> Today's linux-next merge of the arm-soc tree got a conflict in
> arch/arm/plat-mxc/include/mach/memory.h between commit c039bad00f21
> ("ARM: plat-mxc: remove mach/memory.h") from the arm tree and commits
> ae4fa7f66e54 ("ARM i.MX: allow to compile together ARMv4 and ARMv5 based
> SoCs") and 7409cd1cd554 ("ARM i.MX: allow to compile together all i.MX5
> based SoCs") from the arm-soc tree.
> 
> The former removed the file, so I did that.

Stephen - thanks.

ARM guys, we need to be smarter about this stuff - if we're consolidating
code across the ARM tree, committing changes to files which we're going
to remove really isn't a good idea.  It probably means something else has
changed elsewhere to accomodate the deletion of the file, which this
kind of resolution won't fix up.

It's a recipe for creating unnecessary build failures when these trees
get merged together.

It probably means that those two commits need to be postponed and
updated for the changes already queued by other people.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
