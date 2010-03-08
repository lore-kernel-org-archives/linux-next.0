From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for March 8 (mtd)
Date: Mon, 08 Mar 2010 09:25:18 -0800
Message-ID: <4B9532FE.8030901@oracle.com>
References: <20100308152740.a007e8cb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:44472 "EHLO
	rcsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752412Ab0CHR1n (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Mar 2010 12:27:43 -0500
In-Reply-To: <20100308152740.a007e8cb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>, David Woodhouse <dwmw2@infradead.org>

On 03/07/10 20:27, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20100305:
> 
> 
> The mtd tree still has its 2 build failures for which I applied patches.


drivers/mtd/sm_ftl.c:
sm_ftl.c:(.text+0x9c110): undefined reference to `__nand_calculate_ecc'
sm_ftl.c:(.text+0x9c123): undefined reference to `__nand_correct_data'
sm_ftl.c:(.text+0x9c14a): undefined reference to `__nand_calculate_ecc'
sm_ftl.c:(.text+0x9c15d): undefined reference to `__nand_correct_data'
sm_ftl.c:(.text+0x9c9ac): undefined reference to `__nand_calculate_ecc'
sm_ftl.c:(.text+0x9c9bf): undefined reference to `__nand_calculate_ecc'


CONFIG_SM_FTL=y
CONFIG_SM_FTL_MUSEUM=y

CONFIG_MTD_NAND=m
CONFIG_MTD_NAND_VERIFY_WRITE=y
CONFIG_MTD_NAND_ECC_SMC=y

but drivers/mtd/nand/Makefile does this:
obj-$(CONFIG_MTD_NAND)			+= nand.o nand_ecc.o

so having CONFIG_MTD_NAND_ECC_SMC different from CONFIG_MTD_NAND does not work.


Also:

config SM_FTL
	tristate "SmartMedia/xD new translation layer"
	depends on EXPERIMENTAL && BLOCK
	select MTD_BLKDEVS
	help
	  This enables new and very EXPERMENTAL support for SmartMedia/xD
EXPERIMENTAL

	  FTL (Flash tanslation layer)
end with .

	  Write support isn't yet well tested, therefore this code IS likely to
	  eat your card, so please don't use it together with valuable data.
	  Use readonly driver (CONFIG_SSFDC) instead.

config SM_FTL_MUSEUM
	boolean "Additional Support for 1MiB and 2MiB SmartMedia cards"
	depends on SM_FTL && MTD_NAND
	select MTD_NAND_ECC_SMC
	help
	  Very old SmartMedia cards need ECC to be calculated in the FTL
end with .

	  Such cards are very rare, thus enabling this option is mostly useless
end with .

	  Also this support is completely UNTESTED.



-- 
~Randy
