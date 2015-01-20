From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Jan 20
Date: Tue, 20 Jan 2015 06:16:44 -0800
Message-ID: <20150120141644.GA21491@roeck-us.net>
References: <20150120185308.53f4af4e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:42172 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752267AbbATORi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 20 Jan 2015 09:17:38 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YDZcf-002AwS-K7
	for linux-next@vger.kernel.org; Tue, 20 Jan 2015 14:17:38 +0000
Content-Disposition: inline
In-Reply-To: <20150120185308.53f4af4e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jan 20, 2015 at 06:53:08PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150119:
> 
> The omap tree gained a conflict against the arm-soc tree.
> 
> The net-next tree lost its build failure.
> 
> The mmc-uh tree gained a conflict against the sunxi tree.
> 
> The audit tree gained conflicts against Linus' tree.
> 
> Non-merge commits (relative to Linus' tree): 3975
>  3828 files changed, 141642 insertions(+), 68217 deletions(-)
> 
What difference a few days can make ... from zero failures to:

Build results:
	total: 133 pass: 123 fail: 10
Failed builds:
	i386:allyesconfig
	mips:allmodconfig
	powerpc:cell_defconfig (binutils 2.23)
	powerpc:mpc85xx_defconfig
	powerpc:mpc85xx_smp_defconfig
	powerpc:cell_defconfig (binutils 2.24)
	powerpc:mpc85xx_defconfig
	powerpc:mpc85xx_smp_defconfig
	sparc64:allmodconfig
	x86_64:allyesconfig

Qemu tests:
	total: 30 pass: 19 fail: 11
Failed tests:
	microblaze:microblaze_defconfig
	microblaze:microblazeel_defconfig
	mips:mips_malta_smp_defconfig
	mips64:mips_malta64_smp_defconfig
	powerpc:ppc_book3s_smp_defconfig
	powerpc:ppc64_book3s_smp_defconfig
	sh:sh_defconfig
	sparc32:sparc_defconfig
	sparc32:sparc_smp_defconfig
	x86:x86_pc_defconfig
	x86_64:x86_64_pc_defconfig

Most of it mm related problems inherited from mmotm, but there are
a few others (sparc64, x86_64, and i386 don't fail to build on mmotm,
and the microblaze qemu test fails differently, for example).

Guenter
