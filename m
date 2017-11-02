From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the regmap tree
Date: Thu, 2 Nov 2017 11:57:12 +1100
Message-ID: <20171102115712.231001ac@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57381 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932409AbdKBA5O (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 1 Nov 2017 20:57:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Baolin Wang <baolin.wang@linaro.org>

Hi Mark,

After merging the regmap tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/base/regmap/regmap.o: In function `regmap_unlock_hwlock':
regmap.c:(.text+0x13a5): undefined reference to `__hwspin_unlock'
drivers/base/regmap/regmap.o: In function `regmap_unlock_hwlock_irq':
regmap.c:(.text+0x13d8): undefined reference to `__hwspin_unlock'
drivers/base/regmap/regmap.o: In function `regmap_unlock_hwlock_irqrestore':
regmap.c:(.text+0x140a): undefined reference to `__hwspin_unlock'
drivers/base/regmap/regmap.o: In function `regmap_lock_hwlock':
regmap.c:(.text+0x144a): undefined reference to `__hwspin_lock_timeout'
drivers/base/regmap/regmap.o: In function `regmap_lock_hwlock_irq':
regmap.c:(.text+0x148d): undefined reference to `__hwspin_lock_timeout'
drivers/base/regmap/regmap.o: In function `regmap_lock_hwlock_irqsave':
regmap.c:(.text+0x14cf): undefined reference to `__hwspin_lock_timeout'
drivers/base/regmap/regmap.o: In function `__regmap_init':
(.text+0x5139): undefined reference to `hwspin_lock_free'
drivers/base/regmap/regmap.o: In function `__regmap_init':
(.text+0x5e25): undefined reference to `hwspin_lock_request_specific'

Presumably caused by commit

  8698b9364710 ("regmap: Add hardware spinlock support")

Note that CONFIG_HWSPINLOCK=m for this build, but CONFIG_REGMAP=y

I have used the version of the regmap tree from next-20171018 for today.

-- 
Cheers,
Stephen Rothwell
