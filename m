From: Hanjun Guo <hanjun.guo@linaro.org>
Subject: Re: [Linaro-acpi] next-20150609 build: 2 failures 40 warnings (next-20150609)
Date: Wed, 10 Jun 2015 15:33:52 +0800
Message-ID: <5577E860.1040605@linaro.org>
References: <E1Z2Ny7-00019f-Dj@optimist> <20150609182305.GW14071@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:36588 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751748AbbFJHeD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 10 Jun 2015 03:34:03 -0400
Received: by pdjm12 with SMTP id m12so31920997pdj.3
        for <linux-next@vger.kernel.org>; Wed, 10 Jun 2015 00:34:02 -0700 (PDT)
In-Reply-To: <20150609182305.GW14071@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Y Vo <yvo@apm.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linaro-acpi@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org

On 06/10/2015 02:23 AM, Mark Brown wrote:
> On Tue, Jun 09, 2015 at 07:09:47PM +0100, Build bot for Mark Brown wrote:
>
>> 	arm64-allmodconfig
>> ERROR: "acpi_gpiochip_request_interrupts" [drivers/gpio/gpio-xgene-sb.ko] undefined!
>> ERROR: "acpi_gpiochip_free_interrupts" [drivers/gpio/gpio-xgene-sb.ko] undefined!
>
> Today's -next fails to build an arm64 allmodconfig due to commit
> 733cf014f02040b3ad (gpio: xgene: add ACPI support for APM X-Gene GPIO
> standby driver) which adds ACPI support to the X-Gene standby driver
> without either adding a dependency on ACPI or there being stubs in the
> ACPI headers for the above functions in !ACPI configurations.  My
> instinct is that the stubs are going to be nicer since it'll save on
> ifdefs in drivers which seems nicer.

It seems that acpi_gpiochip_request_interrupts didn't export
so there will be a compile error when xgene-sb compiled as
a ko, I prepared a patch below:


 From d47771429144d80a2c38b79f06577dd237e349d1 Mon Sep 17 00:00:00 2001
From: Hanjun Guo <hanjun.guo@linaro.org>
Date: Wed, 10 Jun 2015 15:24:30 +0800
Subject: [PATCH] GPIO / ACPI: export acpi_gpiochip_request(free)_interrupts
  for module use

acpi_gpiochip_request(free)_interrupts can be used for modules,
so export them. This also fixs a compile error when xgene-sb
configured as kernel module.

Fixes: 733cf014f020 "gpio: xgene: add ACPI support for APM X-Gene GPIO 
standby driver"
Signed-off-by: Hanjun Guo <hanjun.guo@linaro.org>
---
  drivers/gpio/gpiolib-acpi.c | 2 ++
  1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 19b99d0..980a996 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -307,6 +307,7 @@ void acpi_gpiochip_request_interrupts(struct 
gpio_chip *chip)
         acpi_walk_resources(handle, "_AEI",
                             acpi_gpiochip_request_interrupt, acpi_gpio);
  }
+EXPORT_SYMBOL_GPL(acpi_gpiochip_request_interrupts);

  /**
   * acpi_gpiochip_free_interrupts() - Free GPIO ACPI event interrupts.
@@ -346,6 +347,7 @@ void acpi_gpiochip_free_interrupts(struct gpio_chip 
*chip)
                 kfree(event);
         }
  }
+EXPORT_SYMBOL_GPL(acpi_gpiochip_free_interrupts);

  int acpi_dev_add_driver_gpios(struct acpi_device *adev,
                               const struct acpi_gpio_mapping *gpios)
-- 
1.9.1
