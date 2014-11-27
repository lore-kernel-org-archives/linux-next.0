From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Nov 26
Date: Wed, 26 Nov 2014 18:52:38 -0800
Message-ID: <20141127025238.GA18150@roeck-us.net>
References: <20141126233827.3353c3f4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:48021 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753476AbaK0Cws (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 Nov 2014 21:52:48 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1XtpCJ-002aai-O7
	for linux-next@vger.kernel.org; Thu, 27 Nov 2014 02:52:47 +0000
Content-Disposition: inline
In-Reply-To: <20141126233827.3353c3f4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Nov 26, 2014 at 11:38:27PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20141125:
> 
> The i2c tree lost its build failure.
> 
> The block tree gained a conflict against the ext4 tree.
> 
> The omap_dss2 tree still had its build failure for which I applied a patch.
> 
> The devicetree tree gained conflicts against the i2c, pm, mfd and
> regulator trees.
> 
> The kvm-arm tree gained a conflict against the kvm tree.
> 
> The tty tree gained a conflict against the tty.current tree.
> 
> Non-merge commits (relative to Linus' tree): 8617
>  8299 files changed, 317805 insertions(+), 228360 deletions(-)
> 
Builds results:
	total: 133 pass: 126 fail: 7
Failed builds:
	alpha:allmodconfig
	arm:orion5x_defconfig
	arm:cm_x2xx_defconfig
	hexagon:defconfig
	sparc64:allmodconfig
	x86_64:allyesconfig
	xtensa:allmodconfig

Qemu tests:
	total: 30 pass: 22 fail: 8
Failed tests:
	arm:arm_versatile_defconfig
	mips:mips_malta_defconfig
	mips:mipsel_malta_defconfig
	mips:mipsel_malta_smp_defconfig
	powerpc:ppc_book3s_defconfig
	powerpc:ppc_book3s_smp_defconfig
	powerpc:ppc64_book3s_defconfig
	powerpc:ppc64_book3s_smp_defconfig

As far as I can see, qemu failures are all due to build failures
due to

ERROR: "nf_nat_redirect_ipv6" [net/netfilter/xt_REDIRECT.ko] undefined!

Details at http://server.roeck-us.net:8010/builders.

Guenter
