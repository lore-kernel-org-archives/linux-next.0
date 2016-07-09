From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Jul 8
Date: Sat, 9 Jul 2016 14:24:46 -0700
Message-ID: <20160709212446.GA3340@roeck-us.net>
References: <20160708180338.6863303a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:39579 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752892AbcGIVYy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 9 Jul 2016 17:24:54 -0400
Content-Disposition: inline
In-Reply-To: <20160708180338.6863303a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jul 08, 2016 at 06:03:38PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160707:
> 
> New trees: netfilter and netfilter-next
> 
> The drm-msm tree gained a conflict against the arm tree.
> 
> The block tree gained conflicts against Linus' and the btrfs-kdave trees.
> 
> The userns tree gained a conflict against Linus' tree.
> 
> Non-merge commits (relative to Linus' tree): 7460
>  6931 files changed, 350754 insertions(+), 147233 deletions(-)
> 

Build results:
	total: 148 pass: 136 fail: 12
Failed builds:
	arc:defconfig
	arc:allnoconfig
	arc:tb10x_defconfig
	arc:axs103_defconfig
	arc:nsim_hs_smp_defconfig
	arc:vdk_hs38_smp_defconfig
	arm:allmodconfig
	arm64:allmodconfig
	hexagon:defconfig
	hexagon:allnoconfig
	mips:ath79_defconfig
	mips:malta_defconfig

Qemu test results:
	total: 107 pass: 95 fail: 12
Failed tests:
	arm64:smp:defconfig
	arm64:nosmp:defconfig
	mips:malta_defconfig:nosmp
	mips:malta_defconfig:smp
	mips64:malta_defconfig:nosmp
	mips64:malta_defconfig:smp
	mipsel:malta_defconfig:nosmp
	mipsel:malta_defconfig:smp
	mipsel64:malta_defconfig:nosmp
	mipsel64:malta_defconfig:smp
	xtensa:dc233c:ml605:generic_kc705_defconfig
	xtensa:dc233c:kc705:generic_kc705_defconfig

Details are available at http://kerneltests.org/builders.

Thanks,
Guenter
