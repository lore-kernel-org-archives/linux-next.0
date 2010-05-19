From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the davinci tree with the arm tree
Date: Wed, 19 May 2010 11:10:50 +1000
Message-ID: <20100519111050.337181c4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49334 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753975Ab0ESBKy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 18 May 2010 21:10:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kevin Hilman <khilman@deeprootsystems.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, Cyril Chemparathy <cyril@ti.com>

Hi Kevin,

Today's linux-next merge of the davinci tree got a conflict in
arch/arm/Kconfig between commit 717e7c2672e37253a4d3aa70e4716b5b0a658761
("ARM: remove 'select GENERIC_TIME'") from the arm tree and commit
b722049d7e60356fe04bcac6065a7c8b1c64c06f ("Davinci: allow SOCs based on
other ARM CPUs") from the davinci tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/Kconfig
index a07b6c4,1151d1a..0000000
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@@ -760,9 -776,11 +760,8 @@@ config ARCH_NOMADI
  
  config ARCH_DAVINCI
  	bool "TI DaVinci"
- 	select CPU_ARM926T
 -	select GENERIC_TIME
  	select GENERIC_CLOCKEVENTS
 -	select GENERIC_GPIO
  	select ARCH_REQUIRE_GPIOLIB
 -	select HAVE_CLK
  	select ZONE_DMA
  	select HAVE_IDE
  	select COMMON_CLKDEV
