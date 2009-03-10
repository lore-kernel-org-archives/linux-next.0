From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sound tree with the arm tree
Date: Tue, 10 Mar 2009 14:45:28 +1100
Message-ID: <20090310144528.0fa208dd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56341 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752044AbZCJDpe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Mar 2009 23:45:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, Ben Dooks <ben@simtec.co.uk>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Alexander Schulz <alex@shark-linux.de>, Russell King <rmk@arm.linux.org.uk>

Hi Takashi,

Today's linux-next merge of the sound tree got a conflict in
arch/arm/mach-shark/include/mach/io.h between commit
eab184c2362567f2b2e951b7bd0e0d353a7e5091 ("[ARM] 5363/1: Shark cleanup
and new defconfig") from the arm tree and commit
8150bc886be5ce3cc301a2baca1fcf2cf7bd7f39 ("S3C24XX: Move and update IIS
headers") from the sound tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/arm/mach-shark/include/mach/io.h
index 9ccbcec,8ca7d7f..0000000
--- a/arch/arm/mach-shark/include/mach/io.h
+++ b/arch/arm/mach-shark/include/mach/io.h
@@@ -11,10 -11,10 +11,10 @@@
  #ifndef __ASM_ARM_ARCH_IO_H
  #define __ASM_ARM_ARCH_IO_H
  
 -#define PCIO_BASE	0xe0000000
 -#define IO_SPACE_LIMIT	0xffffffff
 +#define IO_SPACE_LIMIT 0xffffffff
  
- #define __io(a)                 ((void __iomem *)(0xe0000000 + (a)))
 -#define __io(a)		__typesafe_io(PCIO_BASE + (a))
 -#define __mem_pci(addr)	(addr)
++#define __io(a)		__typesafe_io(0xe0000000 + (a))
 +
 +#define __mem_pci(addr) (addr)
  
  #endif
