From: Jean-Philippe Brucker <Jean-Philippe.Brucker@arm.com>
Subject: Re: next-20160222 build: 5 failures 9 warnings (next-20160222)
Date: Mon, 22 Feb 2016 10:37:26 +0000
Message-ID: <20160222103725.GA5163@e106794-lin.cambridge.arm.com>
References: <E1aXlz4-000486-Pb@optimist>
 <20160222102542.GZ18327@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:55691 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754409AbcBVKhb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Feb 2016 05:37:31 -0500
Content-Disposition: inline
In-Reply-To: <20160222102542.GZ18327@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Russell King <rmk+kernel@arm.linux.org.uk>, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org

Mark,

On Mon, Feb 22, 2016 at 07:25:42PM +0900, Mark Brown wrote:
> On Mon, Feb 22, 2016 at 08:36:46AM +0000, Build bot for Mark Brown wrote:
> 
> For the past few days -next has been failing to build an arm
> allmodconfig due to:
> 
> > 	arm-allmodconfig
> > ../arch/arm/kernel/hyp-stub.S:168: Error: selected processor does not support ARM mode `ubfx r7,r7,#28,#4'
> > ../arch/arm/kernel/hyp-stub.S:176: Error: selected processor does not support ARM mode `isb'
> 
> caused by e59941b9b3817c (ARM: 8527/1: virt: enable GICv3 system
> registers) in the ARM tree.  My hot take is that it looks like
> CONFIG_ARM_GIC_V3 needs tighter dependencies so it can't get enabled for
> a v6 system but I could be wrong.

Thanks for the report. A fix is already in Russell's patch system [1],
and should be applied shortly.

Thanks,
Jean-Philippe

[1] http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=8534/1
