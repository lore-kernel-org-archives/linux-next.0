From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the powerpc tree with the kbuild tree
Date: Wed, 21 Sep 2016 10:24:42 +1000
Message-ID: <20160921102442.1061af69@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54759 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752187AbcIUAYs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Sep 2016 20:24:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Nicholas Piggin <npiggin@gmail.com>

Hi all,

Today's linux-next merge of the powerpc tree got conflicts in:

  arch/powerpc/kernel/misc_32.S
  arch/powerpc/kernel/misc_64.S

between commit:

  9445aa1a3062 ("ppc: move exports to definitions")

from the kbuild tree and commit:

  6f698df10cb2 ("powerpc/kernel: Use kprobe blacklist for asm functions")

from the powerpc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/kernel/misc_32.S
index f5156105c5f3,03756ffdcd71..000000000000
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@@ -360,7 -358,8 +360,9 @@@ END_FTR_SECTION_IFSET(CPU_FTR_COHERENT_
  	sync				/* additional sync needed on g4 */
  	isync
  	blr
+ _ASM_NOKPROBE_SYMBOL(flush_icache_range)
 +EXPORT_SYMBOL(flush_icache_range)
+ 
  /*
   * Flush a particular page from the data cache to RAM.
   * Note: this is necessary because the instruction cache does *not*
diff --cc arch/powerpc/kernel/misc_64.S
index 8b526846e72a,5d7e583f1588..000000000000
--- a/arch/powerpc/kernel/misc_64.S
+++ b/arch/powerpc/kernel/misc_64.S
@@@ -110,8 -109,8 +110,9 @@@ END_FTR_SECTION_IFSET(CPU_FTR_COHERENT_
  	bdnz	2b
  	isync
  	blr
- 	.previous .text
+ _ASM_NOKPROBE_SYMBOL(flush_icache_range)
 +EXPORT_SYMBOL(flush_icache_range)
+ 
  /*
   * Like above, but only do the D-cache.
   *
