From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the gpio tree
Date: Mon, 29 May 2017 15:39:47 +1000
Message-ID: <20170529153947.458e2297@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46727 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750837AbdE2Fjv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 29 May 2017 01:39:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>

Hi Linus,

After merging the gpio tree, today's linux-next build (arm
orion5x_defconfig) failed like this:

drivers/gpio/gpio-mvebu.c:1062: undefined reference to `__devm_regmap_init_mmio_clk'
drivers/gpio/gpio-mvebu.c:1078: undefined reference to `__devm_regmap_init_mmio_clk'

Caused by commit

  2233bf7a92e7 ("gpio: mvebu: switch to regmap for register access")

Presumably a missing Kconfig dependency.  Yeah, CONFIG_REGMAP_MMIO is
not set for this build.

-- 
Cheers,
Stephen Rothwell
