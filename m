From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the samsung-krzk tree with the arm-soc
 tree
Date: Mon, 6 Jun 2016 10:06:28 +1000
Message-ID: <20160606100628.29906f83@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59081 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751892AbcFFAGc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 5 Jun 2016 20:06:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

Hi Krzysztof,

Today's linux-next merge of the samsung-krzk tree got a conflict in:

  arch/arm/mach-exynos/Kconfig

between commit:

  5c34a4e89c74 ("ARM: do away with ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB")

from the arm-soc tree and commit:

  9479f7cc9187 ("soc: samsung: pm_domains: Enable COMPILE_TEST for build coverage")

from the samsung-krzk tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm/mach-exynos/Kconfig
index ecf139f31c4c,3fa6e7b8c3fe..000000000000
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@@ -18,7 -19,7 +18,8 @@@ menuconfig ARCH_EXYNO
  	select EXYNOS_THERMAL
  	select EXYNOS_PMU
  	select EXYNOS_SROM
+ 	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
 +	select GPIOLIB
  	select HAVE_ARM_SCU if SMP
  	select HAVE_S3C2410_I2C if I2C
  	select HAVE_S3C2410_WATCHDOG if WATCHDOG
