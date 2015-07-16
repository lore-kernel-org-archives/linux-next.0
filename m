From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the arm tree
Date: Thu, 16 Jul 2015 14:50:19 +1000
Message-ID: <20150716145019.03c07a2e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37488 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751537AbbGPEuV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Jul 2015 00:50:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Laurent Dufour <ldufour@linux.vnet.ibm.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/arm/include/asm/Kbuild

between commit:

  57853e8906a0 ("ARM: 8403/1: kbuild: don't use generic mcs_spinlock.h header")

from the arm tree and commit:

  74cf1a5a0c64 ("mm: clean up per architecture MM hook header files")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/include/asm/Kbuild
index 517ef6dd22b9,30b3bc1666d2..000000000000
--- a/arch/arm/include/asm/Kbuild
+++ b/arch/arm/include/asm/Kbuild
@@@ -12,6 -12,8 +12,7 @@@ generic-y += irq_regs.
  generic-y += kdebug.h
  generic-y += local.h
  generic-y += local64.h
 -generic-y += mcs_spinlock.h
+ generic-y += mm-arch-hooks.h
  generic-y += msgbuf.h
  generic-y += param.h
  generic-y += parport.h
