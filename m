From: Nishanth Menon <nm@ti.com>
Subject: Re: regression: OMAP4 (next-20141204) (bisect to: ARM: 8208/1: l2c:
 Refactor the driver to use commit-like)
Date: Fri, 5 Dec 2014 10:13:51 -0600
Message-ID: <5481D9BF.2090007@ti.com>
References: <5481D913.9040109@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:49481 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750907AbaLEQO2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 5 Dec 2014 11:14:28 -0500
In-Reply-To: <5481D913.9040109@ti.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kevin Hilman <khilman@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Russell King <rmk+kernel@arm.linux.org.uk>
Cc: linux-omap <linux-omap@vger.kernel.org>, "tony@atomide.com" <tony@atomide.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-next <linux-next@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 12/05/2014 10:10 AM, Nishanth Menon wrote:
> next-20141204 fails to boot, but next-20141203 boots fine with
> omap2plus_defconfig.
> 
> Panda-ES(4460):
> https://github.com/nmenon/kernel-test-logs/blob/next-20141204/omap2plus_defconfig/pandaboard-es.txt
> Panda(4430):
> https://github.com/nmenon/kernel-test-logs/blob/next-20141204/omap2plus_defconfig/pandaboard-vanilla.txt
> 
> at the point of hang (JTAG):
>  pandaboard-es:
> 	cpu0: http://slexy.org/view/s2eIFqkRd5
> 	cpu1: http://slexy.org/view/s2Tysb6gpL
> 
> Case #1:
> Disabling CPUIDLE allows boot to proceed. there does not seem to have
> been any change in drivers/cpuidle and arch/arm/mach-omap2 w.r.t this.
> 
> Case #2: Reverting the following allows boot.
> 
> From next-20141204
> 10df7d5 ARM: 8211/1: l2c: Add support for overriding prefetch settings
> revert this  -> boot still fails
> 
> d42ced0 ARM: 8210/1: l2c: Get outer cache .write_sec callback from
> mach_desc only if not NULL
> revert this  -> boot still fails
> 
> 46b9af8 ARM: 8209/1: l2c: Add interface to ask hypervisor to configure L2C
> revert this  -> boot still fails
> 
> c94e325 ARM: 8208/1: l2c: Refactor the driver to use commit-like
> revert this  -> boot passed (first bad commit).
> 
> 

+ linux-samsung soc and updated Thomaz's mail ID (gmail now).


-- 
Regards,
Nishanth Menon
