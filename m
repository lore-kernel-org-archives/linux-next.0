From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the mfd tree
Date: Thu, 30 Nov 2017 11:35:16 +1100
Message-ID: <20171130113516.42c8bde2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45759 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753120AbdK3AfS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Nov 2017 19:35:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Jacek Anaszewski <j.anaszewski@samsung.com>, Bjorn Andersson <bjorn.andersson@linaro.org>

Hi Lee,

After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/leds/leds-pm8058.c: In function 'pm8058_led_probe':
drivers/leds/leds-pm8058.c:109:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  led->ledtype = (u32)of_device_get_match_data(&pdev->dev);
                 ^

Exposed by commit

  deed10c2d603 ("mfd: pm8xxx: Make elegible for COMPILE_TEST")

CONFIG_LEDS_PM8058 depends on CONFIG_MFD_PM8XXX which is now turned on
by allmodconfig.

The actual problematic commit is:

  7f866986e705 ("leds: add PM8058 LEDs driver")

from v4.9-rc1.

-- 
Cheers,
Stephen Rothwell
