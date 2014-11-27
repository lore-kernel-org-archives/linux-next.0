From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Nov 27
Date: Thu, 27 Nov 2014 12:30:27 -0800
Message-ID: <20141127203027.GA13159@roeck-us.net>
References: <20141127230251.5273a72f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:53122 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750784AbaK0Uaf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 27 Nov 2014 15:30:35 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1Xu5hy-002WkE-Mt
	for linux-next@vger.kernel.org; Thu, 27 Nov 2014 20:30:34 +0000
Content-Disposition: inline
In-Reply-To: <20141127230251.5273a72f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Nov 27, 2014 at 11:02:51PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20141126:
> 
> The block tree gained a conflict against the ext4 tree.
> 
> The omap_dss2 tree lost its build failure.
> 
> The irqchip tree gained a conflict against the mips tree.
> 
> The staging tree gained conflicts against the kbuild and vfs trees.
> 
> The akpm tree lost a patch that turned up elsewhere.
> 
> Non-merge commits (relative to Linus' tree): 9044
>  8635 files changed, 334054 insertions(+), 234320 deletions(-)
> 
> ----------------------------------------------------------------------------

Build results:
	total: 133 pass: 111 fail: 22
Failed builds:
	alpha:defconfig
	alpha:allmodconfig
	hexagon:defconfig
	mips:defconfig
	mips:allmodconfig
	mips:bcm47xx_defconfig
	mips:bcm63xx_defconfig
	mips:nlm_xlp_defconfig
	mips:ath79_defconfig
	mips:ar7_defconfig
	mips:fuloong2e_defconfig
	mips:e55_defconfig
	mips:cavium_octeon_defconfig
	mips:malta_defconfig
	parisc:defconfig
	parisc:generic-32bit_defconfig
	parisc:a500_defconfig
	parisc:generic-64bit_defconfig
	sparc64:allmodconfig
	x86_64:allyesconfig
	xtensa:defconfig
	xtensa:allmodconfig

Qemu test results:
	total: 30 pass: 17 fail: 13
Failed tests:
	alpha:alpha_defconfig
	arm:arm_versatile_defconfig
	mips:mips_malta_defconfig
	mips:mips_malta_smp_defconfig
	mips:mipsel_malta_defconfig
	mips:mipsel_malta_smp_defconfig
	mips64:mips_malta64_defconfig
	mips64:mips_malta64_smp_defconfig
	powerpc:ppc_book3s_defconfig
	powerpc:ppc_book3s_smp_defconfig
	powerpc:ppc64_book3s_defconfig
	powerpc:ppc64_book3s_smp_defconfig
	xtensa:xtensa_defconfig

Details are available at http://server.roeck-us.net:8010/builders.

Guenter
