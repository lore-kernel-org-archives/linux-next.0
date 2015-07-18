From: Fabio Estevam <festevam@gmail.com>
Subject: Re: ASoC: cs4349: Add support for Cirrus Logic CS4349 breaks on
 multiple arch
Date: Sat, 18 Jul 2015 17:38:05 -0300
Message-ID: <CAOMZO5AX_Aj3DR4fp9Cv+dySD41_91vZN6bnSNWy_aDzszGfhg@mail.gmail.com>
References: <20150718192822.GB4477@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:36416 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751780AbbGRUiH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 18 Jul 2015 16:38:07 -0400
Received: by lbbpo10 with SMTP id po10so76713204lbb.3
        for <linux-next@vger.kernel.org>; Sat, 18 Jul 2015 13:38:05 -0700 (PDT)
In-Reply-To: <20150718192822.GB4477@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: tim.howe@cirrus.com, Mark Brown <broonie@kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

Hi Paul,

On Sat, Jul 18, 2015 at 4:28 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> Hi Tim,
>
> This commit:
>
> e40da86a37f64c73b810bc7a63d77c44dc61accb is the first bad commit
> commit e40da86a37f64c73b810bc7a63d77c44dc61accb
> Author: Tim Howe <tim.howe@cirrus.com>
> Date:   Thu Jul 16 14:51:40 2015 -0500
>
>     ASoC: cs4349: Add support for Cirrus Logic CS4349
>
>     Signed-off-by: Tim Howe <tim.howe@cirrus.com>
>     Signed-off-by: Mark Brown <broonie@kernel.org>
>
> is showing up in linux-next build failures for mips, parisc and s390.
>
> sound/soc/codecs/cs4349.c:300:2: error: implicit declaration of function
> 'devm_gpiod_get_optional' [-Werror=implicit-function-declaration]
> sound/soc/codecs/cs4349.c:301:12: error: 'GPIOD_OUT_LOW' undeclared
> (first use in this function)
> sound/soc/codecs/cs4349.c:306:3: error: implicit declaration of function
> 'gpiod_set_value_cansleep' [-Werror=implicit-function-declaration]
>
> Here are a few examples:
>
> http://kisskb.ellerman.id.au/kisskb/buildresult/12465322/
> http://kisskb.ellerman.id.au/kisskb/buildresult/12465445/
> http://kisskb.ellerman.id.au/kisskb/buildresult/12465246/
>
> I'm guessing it needs some tighter Kconfig dependencies to block it
> from being selected on arch that don't have/enable gpio stuff.

Would this fix the problem?

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
