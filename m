From: Fabio Estevam <festevam@gmail.com>
Subject: Re: ASoC: cs4349: Add support for Cirrus Logic CS4349 breaks on
 multiple arch
Date: Sat, 18 Jul 2015 18:04:48 -0300
Message-ID: <CAOMZO5B98KvAwJppqzi0RcCf-harrO9FXJrfRybwVZYH1r5vJw@mail.gmail.com>
References: <20150718192822.GB4477@windriver.com>
	<CAOMZO5AX_Aj3DR4fp9Cv+dySD41_91vZN6bnSNWy_aDzszGfhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:36158 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750889AbbGRVEu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 18 Jul 2015 17:04:50 -0400
Received: by lbbpo10 with SMTP id po10so76851610lbb.3
        for <linux-next@vger.kernel.org>; Sat, 18 Jul 2015 14:04:48 -0700 (PDT)
In-Reply-To: <CAOMZO5AX_Aj3DR4fp9Cv+dySD41_91vZN6bnSNWy_aDzszGfhg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: tim.howe@cirrus.com, Mark Brown <broonie@kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Sat, Jul 18, 2015 at 5:38 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Would this fix the problem?
>
> +++ b/sound/soc/codecs/Kconfig
> @@ -53,7 +53,7 @@ config SND_SOC_ALL_CODECS
>         select SND_SOC_CS4271_I2C if I2C
>         select SND_SOC_CS4271_SPI if SPI_MASTER
>         select SND_SOC_CS42XX8_I2C if I2C
> -       select SND_SOC_CS4349 if I2C
> +       select SND_SOC_CS4349 if I2C && GPIOLIB
>         select SND_SOC_CX20442 if TTY
>         select SND_SOC_DA7210 if SND_SOC_I2C_AND_SPI
>         select SND_SOC_DA7213 if I2C

Or this one:

--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -53,7 +53,7 @@ config SND_SOC_ALL_CODECS
        select SND_SOC_CS4271_I2C if I2C
        select SND_SOC_CS4271_SPI if SPI_MASTER
        select SND_SOC_CS42XX8_I2C if I2C
-       select SND_SOC_CS4349 if I2C
+       select SND_SOC_CS4349 if I2C && GPIOLIB
        select SND_SOC_CX20442 if TTY
        select SND_SOC_DA7210 if SND_SOC_I2C_AND_SPI
        select SND_SOC_DA7213 if I2C
@@ -410,7 +410,7 @@ config SND_SOC_CS42XX8_I2C
 # Cirrus Logic CS4349 HiFi DAC
 config SND_SOC_CS4349
        tristate "Cirrus Logic CS4349 CODEC"
-       depends on I2C
+       depends on I2C && GPIOLIB

 config SND_SOC_CX20442
        tristate
