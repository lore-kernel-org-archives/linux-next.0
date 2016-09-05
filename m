From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the gpio tree with the arm64 tree
Date: Mon, 5 Sep 2016 17:53:59 +1000
Message-ID: <20160905175359.44fda083@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49748 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754940AbcIEHyH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Sep 2016 03:54:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Will Deacon <will.deacon@arm.com>

Hi Linus,

Today's linux-next merge of the gpio tree got a conflict in:

  arch/arm64/Kconfig.platforms

between commit:

  67060ed148cc ("arm64: remove redundant "select HAVE_CLK"")

from the arm64 tree and commit:

  da9a1c676754 ("arm64: do away with ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB")

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

diff --cc arch/arm64/Kconfig.platforms
index 4e0e1071f2e8,4fb0bef0f094..000000000000
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@@ -163,9 -158,9 +162,10 @@@ config ARCH_TEGR
  	select CLKSRC_MMIO
  	select CLKSRC_OF
  	select GENERIC_CLOCKEVENTS
+ 	select GPIOLIB
 -	select HAVE_CLK
  	select PINCTRL
 +	select PM
 +	select PM_GENERIC_DOMAINS
  	select RESET_CONTROLLER
  	help
  	  This enables support for the NVIDIA Tegra SoC family.
