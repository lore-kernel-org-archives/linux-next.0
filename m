From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: manual merge of the watchdog tree with the arm tree
Date: Fri, 20 Mar 2009 08:19:15 +0000
Message-ID: <20090320081915.GA17251@flint.arm.linux.org.uk>
References: <20090320135849.8f71cdbc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:42509 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753231AbZCTITj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Mar 2009 04:19:39 -0400
Content-Disposition: inline
In-Reply-To: <20090320135849.8f71cdbc.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wim Van Sebroeck <wim@iguana.be>, linux-next@vger.kernel.org

On Fri, Mar 20, 2009 at 01:58:49PM +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the watchdog tree got a conflict in
> drivers/watchdog/omap_wdt.c between commit
> 39a80c7f379e1c1d3e63b204b8353b7381d0a3d5 ("[ARM] omap: watchdog: convert
> clocks to match by devid and conid") from the arm tree and commit
> 47efb2337f6f450c995712762c0bcf6ce073171f ("[WATCHDOG] More coding-style
> and trivial clean-up") from the watchdog tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Wim, what changes are you carrying to this driver which also touch its
clk API use?  Please send these changes to me.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
