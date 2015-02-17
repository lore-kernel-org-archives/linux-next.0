From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Feb 17 (mips build failures)
Date: Tue, 17 Feb 2015 09:20:36 -0800
Message-ID: <20150217172036.GA29820@roeck-us.net>
References: <20150217160221.1a15340e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:57162 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751769AbbBQRUm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Feb 2015 12:20:42 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YNlpC-000qXz-5w
	for linux-next@vger.kernel.org; Tue, 17 Feb 2015 17:20:42 +0000
Content-Disposition: inline
In-Reply-To: <20150217160221.1a15340e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Markos Chandras <markos.chandras@imgtec.com>

On Tue, Feb 17, 2015 at 04:02:21PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add any material destined for v3.21 to your linux-next
> included trees until after v3.20-rc1 has been released.
> 
> Changes since 20150216:
> 
> The slave-dma tree lost its build failure.
> 
> Non-merge commits (relative to Linus' tree): 2980
>  2871 files changed, 124415 insertions(+), 70264 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
[ maybe I got it right this time ]

Build results:
	total: 121 pass: 109 fail: 12
Failed builds:
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
	sparc64:allmodconfig

mips builds are all failing with

Building mips:defconfig ... failed
--------------
Error log:
arch/mips/kernel/genex.S: Assembler messages:
arch/mips/kernel/genex.S:128: Error: Bad value (mips64r6) for internal use
arch/mips/kernel/genex.S:128: Error: unknown ISA level 64r6

This was introduced by commit 0bf705e94771800 ("MIPS: kernel: genex: Set
correct ISA level") which apparently assumes that only mips64r6 is a valid
ISA level, though it is obviously not supported on older compilers. This
is on top of the other mips r6 related build errors seen yesterday.

I really hope that this is not 3.20 material, given the lack of testing
with architectures other than mips r6 or with older compilers.

Guenter
