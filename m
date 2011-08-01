From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH -next] regulator: aat2870-regulator.c needs module.h
Date: Mon, 1 Aug 2011 01:15:24 +0100
Message-ID: <20110801001523.GA20641@opensource.wolfsonmicro.com>
References: <20110729173827.716f57ff6e00095a3efc6449@canb.auug.org.au>
 <20110729211309.92e8b744.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:46507 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752756Ab1HAAPa (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 31 Jul 2011 20:15:30 -0400
Content-Disposition: inline
In-Reply-To: <20110729211309.92e8b744.rdunlap@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Liam Girdwood <lrg@ti.com>

On Fri, Jul 29, 2011 at 09:13:09PM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@xenotime.net>
> 
> aat2870-regulator.c needs to include linux/module.h to fix multiple
> build errors.

Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

but if the breakage isn't in mainline yet to minimize the breaks
bisection someone should figure out which tree introduced the change
with module.h and either get the fix merged along with that.  If neither
the module.h change nor the driver is in Linus' tree yet I rather
suspect this should go via MFD as I seem to recall that the driver is
going in via there.

It's not entirely clear to me why this started showing up part way
through the merge window :/
