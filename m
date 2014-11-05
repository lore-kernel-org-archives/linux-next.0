From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Nov 5
Date: Wed, 5 Nov 2014 02:47:27 -0800
Message-ID: <20141105104727.GA27329@roeck-us.net>
References: <20141105175330.3aa16982@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:51825 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754208AbaKEKrm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 Nov 2014 05:47:42 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1Xly7p-00159o-5D
	for linux-next@vger.kernel.org; Wed, 05 Nov 2014 10:47:41 +0000
Content-Disposition: inline
In-Reply-To: <20141105175330.3aa16982@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Nov 05, 2014 at 05:53:30PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Due to a move of office, there will not be a linux-next release on
> Friday (and maybe Monday).
> 
> Changes since 20141104:
> 
> The f2fs tree gained a build failure so I used the version from
> next-20141104.
> 
> The mfd tree lost its build failure.
> 
> The iommu tree gained a build failure so I used the version from
> next-20141104.
> 
> The usb tree gained a conflict against the usb.current tree.
> 
> The staging tree gained conflicts against the v4l-dvb tree.
> 
> The scsi tree still had its its build failure, so I applied a supplied
> patch.
> 
> The akpm tree lost a patch that turned up elsewhere.
> 
> Non-merge commits (relative to Linus' tree): 3680
>  3064 files changed, 103787 insertions(+), 114924 deletions(-)
> 
Build results:
	total: 133 pass: 117 fail: 16
Failed builds:
	arm:omap2plus_defconfig
	arm:axm55xx_defconfig
	arm64:defconfig
	avr32:defconfig
	m68k:allmodconfig
	microblaze:mmu_defconfig
	microblaze:nommu_defconfig
	mips:allmodconfig
	mips:nlm_xlp_defconfig
	powerpc:mpc85xx_defconfig
	powerpc:mpc85xx_smp_defconfig
	powerpc:mpc85xx_defconfig
	powerpc:mpc85xx_smp_defconfig
	s390:defconfig
	tile:tilegx_defconfig

Qemu test results:
	total: 30 pass: 28 fail: 2
Failed tests:
	arm64:arm64_smp_defconfig
	arm64:arm64_nosmp_defconfig

Browsing through the failures, they all seem to be due to the missing
declaration of 'audit_file'. A patch for that problem is pending with
https://lkml.org/lkml/2014/11/4/528.

Guenter
