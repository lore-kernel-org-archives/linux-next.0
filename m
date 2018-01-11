From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the gpio tree
Date: Thu, 11 Jan 2018 15:06:14 +1100
Message-ID: <20180111150614.2a1d0de0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54729 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752922AbeAKEGQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Jan 2018 23:06:16 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>

Hi Linus,

After merging the gpio tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/gpio/Kconfig:13:error: recursive dependency detected!
drivers/gpio/Kconfig:13:	symbol GPIOLIB is selected by STX104
drivers/iio/adc/Kconfig:699:	symbol STX104 depends on ISA_BUS_API
arch/Kconfig:821:	symbol ISA_BUS_API is selected by GPIO_WINBOND
drivers/gpio/Kconfig:701:	symbol GPIO_WINBOND depends on GPIOLIB
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"

Presumably introduced by commit

  a0d65009411c ("gpio: winbond: Add driver")

-- 
Cheers,
Stephen Rothwell
