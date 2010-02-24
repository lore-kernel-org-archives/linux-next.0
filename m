From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the samsung tree with the arm tree
Date: Wed, 24 Feb 2010 11:33:06 +1100
Message-ID: <20100224113306.465efa4d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36849 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754472Ab0BXAdJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Feb 2010 19:33:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

Hi Ben,

Today's linux-next merge of the samsung tree got a conflict in
arch/arm/Makefile between various commits from the arm tree and various
commits from the samsung tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/Makefile
index 00ea105,13c5c2b..0000000
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@@ -186,11 -182,11 +186,11 @@@ plat-$(CONFIG_PLAT_IOP)		:= io
  plat-$(CONFIG_PLAT_NOMADIK)	:= nomadik
  plat-$(CONFIG_PLAT_ORION)	:= orion
  plat-$(CONFIG_PLAT_PXA)		:= pxa
- plat-$(CONFIG_PLAT_S3C24XX)	:= s3c24xx s3c samsung
- plat-$(CONFIG_PLAT_S3C64XX)	:= s3c64xx s3c samsung
- plat-$(CONFIG_PLAT_S5PC1XX)	:= s5pc1xx s3c samsung
- plat-$(CONFIG_PLAT_S5P)		:= s5p samsung s3c
+ plat-$(CONFIG_PLAT_S3C24XX)	:= s3c24xx samsung
+ plat-$(CONFIG_ARCH_S3C64XX)	:= samsung
+ plat-$(CONFIG_PLAT_S5PC1XX)	:= s5pc1xx samsung
+ plat-$(CONFIG_PLAT_S5P)		:= s5p samsung
 -plat-$(CONFIG_ARCH_STMP3XXX)	:= stmp3xxx
 +plat-$(CONFIG_PLAT_VERSATILE)	:= versatile
  
  ifeq ($(CONFIG_ARCH_EBSA110),y)
  # This is what happens if you forget the IOCS16 line.
