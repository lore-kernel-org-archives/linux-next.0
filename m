From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tile tree with the microblaze tree
Date: Thu, 20 Aug 2015 10:56:23 +1000
Message-ID: <20150820105623.56c68fc9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44847 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751566AbbHTA4Z (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Aug 2015 20:56:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Metcalf <cmetcalf@ezchip.com>, Michal Simek <monstr@monstr.eu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Frysinger <vapier@gentoo.org>

Hi Chris,

Today's linux-next merge of the tile tree got a conflict in:

  include/uapi/linux/elf-em.h

between commit:

  bb88ba0946dd ("elf-em.h: move EM_MICROBLAZE to the common header")

from the microblaze tree and commit:

  a0ddef81f4ae ("tile: enable full SECCOMP support")

from the tile tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/uapi/linux/elf-em.h
index 8c90a7972a2f,3429a3ba382b..000000000000
--- a/include/uapi/linux/elf-em.h
+++ b/include/uapi/linux/elf-em.h
@@@ -38,7 -38,8 +38,9 @@@
  #define EM_ALTERA_NIOS2	113	/* Altera Nios II soft-core processor */
  #define EM_TI_C6000	140	/* TI C6X DSPs */
  #define EM_AARCH64	183	/* ARM 64 bit */
+ #define EM_TILEPRO	188	/* Tilera TILEPro */
 +#define EM_MICROBLAZE	189	/* Xilinx MicroBlaze */
+ #define EM_TILEGX	191	/* Tilera TILE-Gx */
  #define EM_FRV		0x5441	/* Fujitsu FR-V */
  #define EM_AVR32	0x18ad	/* Atmel AVR32 */
  
