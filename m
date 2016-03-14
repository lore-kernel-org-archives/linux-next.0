From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Mar 14
Date: Mon, 14 Mar 2016 12:18:03 -0700
Message-ID: <20160314191803.GB9025@roeck-us.net>
References: <20160314174037.0097df55@canb.auug.org.au>
 <20160314143729.GA31845@roeck-us.net>
 <56E6EC27.2090700@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from forward.webhostbox.net ([204.11.59.73]:43734 "EHLO
	forward.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753690AbcCNTSJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 Mar 2016 15:18:09 -0400
Content-Disposition: inline
In-Reply-To: <56E6EC27.2090700@arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morse <james.morse@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Mar 14, 2016 at 04:51:51PM +0000, James Morse wrote:
> Hi Guenter,
> 
> On 14/03/16 14:37, Guenter Roeck wrote:
> > To give people an idea what to expect in the merge window, here are my current
> > build and runtime test results. Some of the runtime failures are due to the
> > newly introduced i2c bug, but many (including the arm64 boot failures) have
> > been around for a while.
> 
> > Qemu test results:
> > 	total: 96 pass: 69 fail: 27
> > Failed tests:
> 
> > 	arm64:smp:defconfig
> 
> This may be due to this qemu bug: http://patchwork.ozlabs.org/patch/585237/
> 
You are right, with that patch applied to qemu it looks better, meaning
the image now crashes due to the failing i2c initialization.

> 
> > 	arm64:nosmp:defconfig
> 
> Since 4b3dc9679cf7 ("arm64: force CONFIG_SMP=y and remove redundant #ifdefs"),
> this may just be testing the smp case again - unless your qemu config is
> different too.
> 
Only difference is that it disables SMP, or at least tries to. I'll want to
keep it around for earlier kernels, though.

Thanks,
Guenter
