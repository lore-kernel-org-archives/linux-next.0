From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the gpio tree with the mips tree
Date: Thu, 12 May 2016 14:17:46 +1000
Message-ID: <20160512141746.11db6bd3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57130 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751105AbcELERt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 May 2016 00:17:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Huacai Chen <chenhc@lemote.com>

Hi Linus,

Today's linux-next merge of the gpio tree got a conflict in:

  arch/mips/Kconfig

between commit:

  cec47c182286 ("MIPS: Loongson: Add Loongson-3A R2 basic support")

from the mips tree and commit:

  d30a2b47d4c2 ("MIPS: do away with ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB")

from the gpio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/mips/Kconfig
index ac9bfad794eb,512b5def854d..000000000000
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@@ -1354,8 -1340,7 +1352,8 @@@ config CPU_LOONGSON
  	select CPU_SUPPORTS_HUGEPAGES
  	select WEAK_ORDERING
  	select WEAK_REORDERING_BEYOND_LLSC
 +	select MIPS_PGD_C0_CONTEXT
- 	select ARCH_REQUIRE_GPIOLIB
+ 	select GPIOLIB
  	help
  		The Loongson 3 processor implements the MIPS64R2 instruction
  		set with many extensions.
