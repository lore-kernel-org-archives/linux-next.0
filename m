From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: Tree for Mar 14
Date: Tue, 15 Mar 2016 10:55:08 +1100
Message-ID: <1457999708.8059.1.camel@ellerman.id.au>
References: <20160314174037.0097df55@canb.auug.org.au>
	 <20160314143729.GA31845@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54276 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932175AbcCNXzM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Mar 2016 19:55:12 -0400
In-Reply-To: <20160314143729.GA31845@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>, Scott Wood <oss@buserror.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2016-03-14 at 07:37 -0700, Guenter Roeck wrote:
> On Mon, Mar 14, 2016 at 05:40:37PM +1100, Stephen Rothwell wrote:
> 
> To give people an idea what to expect in the merge window, here are my current
> build and runtime test results. Some of the runtime failures are due to the
> newly introduced i2c bug, but many (including the arm64 boot failures) have
> been around for a while.
> 
> Qemu test results:
> 	total: 96 pass: 69 fail: 27
> Failed tests:
...
> 	powerpc:mpc8544ds:mpc85xx_smp_defconfig
> 	powerpc:mpc8544ds:mpc85xx_defconfig
> 	powerpc:smp:ppc64_e5500_defconfig

These are all an i2c crash, which I assume is the one you mention above.

> 	powerpc:nosmp:ppc64_e5500_defconfig

This seems to be caused by:

  arch/powerpc/sysdev/fsl_rcpm.c:32:2: error: implicit declaration of function 'get_hard_smp_processor_id' [-Werror=implicit-function-declaration]

ie. that driver doesn't build for SMP=n.

cheers
