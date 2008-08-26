From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: manual merge of the arm tree
Date: Tue, 26 Aug 2008 23:20:44 +0100
Message-ID: <20080826222044.GA17277@flint.arm.linux.org.uk>
References: <20080825110348.9f5485ec.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:60622 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751055AbYHZWVE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 26 Aug 2008 18:21:04 -0400
Content-Disposition: inline
In-Reply-To: <20080825110348.9f5485ec.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Ian Molton <spyro@f2s.com>

On Mon, Aug 25, 2008 at 11:03:48AM +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the arm tree got a conflict in
> arch/arm/mach-pxa/include/mach/irqs.h between commit
> dec5abe9219aebf6d65e9af95de1c031d7039bdb ("[ARM] Fix eseries IRQ limit")
> from Linus' tree and commit 44b6deaa10e0b62fc6d6db0b673f8bfa61b745d1
> ("[ARM] pxa: introduce PXA_HAVE_BOARD_IRQS") from the arm tree.

I think you're seeing that because of my devel branch having multiple
common ancestors.  I've rebased most of the work in there so it doesn't
suffer from that problem, and it should resolve your problem.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
