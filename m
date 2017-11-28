From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the i2c tree
Date: Tue, 28 Nov 2017 11:02:35 +1100
Message-ID: <20171128110235.4e5e6a01@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60367 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752109AbdK1ACh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Nov 2017 19:02:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Phil Reid <preid@electromag.com.au>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Wolfram,

After merging the i2c tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/i2c/i2c-core-base.c: In function 'get_scl_gpio_value':
drivers/i2c/i2c-core-base.c:137:9: error: implicit declaration of function 'gpiod_get_value_cansleep' [-Werror=implicit-function-declaration]
  return gpiod_get_value_cansleep(adap->bus_recovery_info->scl_gpiod);
         ^
drivers/i2c/i2c-core-base.c: In function 'set_scl_gpio_value':
drivers/i2c/i2c-core-base.c:142:2: error: implicit declaration of function 'gpiod_set_value_cansleep' [-Werror=implicit-function-declaration]
  gpiod_set_value_cansleep(adap->bus_recovery_info->scl_gpiod, val);
  ^

Caused by commit

  3991c5c80bea ("i2c: Switch to using gpiod interface for gpio bus recovery")

It is declared in include/linux/gpio/consumer.h which is not directly
included by drivers/i2c/i2c-core-base.c ...

I have used the i2c tree from next-20171127 for today.

-- 
Cheers,
Stephen Rothwell
