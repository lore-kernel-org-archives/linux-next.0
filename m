From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Nov 13
Date: Thu, 13 Nov 2014 06:11:16 -0800
Message-ID: <20141113141116.GA15339@roeck-us.net>
References: <20141113181002.6c583589@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:35976 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933066AbaKMOLb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 13 Nov 2014 09:11:31 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1Xov7R-003nDY-94
	for linux-next@vger.kernel.org; Thu, 13 Nov 2014 14:11:29 +0000
Content-Disposition: inline
In-Reply-To: <20141113181002.6c583589@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Nov 13, 2014 at 06:10:02PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20141112:
> 
> The net-next tree gained a conflict against the net tree.
> 
> The mfd tree gained a conflict against Linus' tree.
> 
> The akpm-current tree lost its build failures.
> 
> Non-merge commits (relative to Linus' tree): 6008
>  6314 files changed, 193590 insertions(+), 163738 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
> are tracking the linux-next tree using git, you should not use "git pull"
> to do so as that will try to merge the new linux-next release with the
> old one.  You should use "git fetch" and checkout or reset to the new
> master.
> 
> You can see which trees have been included by looking in the Next/Trees
> file in the source.  There are also quilt-import.log and merge.log files
> in the Next directory.  Between each merge, the tree was built with
> a ppc64_defconfig for powerpc and an allmodconfig for x86_64 and a
> multi_v7_defconfig for arm. After the final fixups (if any), it is also
> built with powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig and
> allyesconfig (this fails its final link) and i386, sparc, sparc64 and arm
> defconfig.
> 
Build results:
	total: 133 pass: 124 fail: 9
Failed builds:
	arm:davinci_all_defconfig
	arm:axm55xx_defconfig
	arm:orion5x_defconfig
	arm:clps711x_defconfig
	blackfin:defconfig
	hexagon:defconfig
	m68k:allmodconfig
	powerpc:ppc6xx_defconfig (binutils 2.23)
	powerpc:ppc6xx_defconfig (binutils 2.24)

Qemu tests:
	total: 30 pass: 29 fail: 1
Failed tests:
	x86:x86_pc_nosmp_defconfig

Details are available at http://server.roeck-us.net:8010/builders.

Guenter
