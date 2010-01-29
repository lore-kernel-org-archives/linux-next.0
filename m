From: Russell King <rmk+lkml@arm.linux.org.uk>
Subject: Re: linux-next: arm tree build failure
Date: Fri, 29 Jan 2010 23:45:01 +0000
Message-ID: <20100129234501.GA31198@flint.arm.linux.org.uk>
References: <20100129103837.02cc865f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:55118 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751658Ab0A2XpZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Jan 2010 18:45:25 -0500
Content-Disposition: inline
In-Reply-To: <20100129103837.02cc865f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jan 29, 2010 at 10:38:37AM +1100, Stephen Rothwell wrote:
> Hi Russell,
> 
> Yesterday's linux-next (next-20100128) build (arm versatile_defconfig)
> failed like this:
> 
> arch/arm/mach-versatile/core.c: In function 'versatile_init':
> arch/arm/mach-versatile/core.c:838: error: 'i' undeclared (first use in this function)
> 
> Looks like a bad merge (commit b7cdd38da36d61d0f42367057c9d04678644317a
> "Merge branch 'versatile' into devel").

Thanks for catching that, now fixed.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
