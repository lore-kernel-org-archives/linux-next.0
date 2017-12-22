From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: linux-next: manual merge of the samsung-krzk tree with the
 keystone tree
Date: Fri, 22 Dec 2017 09:40:44 +0100
Message-ID: <CAJKOXPfj3nAhdW_EOkpTtcZeGp6WS6yFscg2eDOf=TMJve9row@mail.gmail.com>
References: <20171204094558.19b80b4d@canb.auug.org.au> <20171222100513.79b0d3c6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:50274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751407AbdLVIkr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 22 Dec 2017 03:40:47 -0500
In-Reply-To: <20171222100513.79b0d3c6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On Fri, Dec 22, 2017 at 12:05 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> On Mon, 4 Dec 2017 09:45:58 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the samsung-krzk tree got a conflict in:
>>
>>   arch/arm/configs/multi_v7_defconfig
>>
>> between commit:
>>
>>   f15187dcdbcd ("ARM: config: sync multi-v7 config with keystone peripherals")
>>
>> from the keystone tree and commit:
>>
>>   453c63073185 ("ARM: multi_v7_defconfig: Enable missing drivers for supported Exynos boards")
>>
>> from the samsung-krzk tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
>> diff --cc arch/arm/configs/multi_v7_defconfig
>> index 6f2343e259f7,833892568d31..000000000000
>> --- a/arch/arm/configs/multi_v7_defconfig
>> +++ b/arch/arm/configs/multi_v7_defconfig
>> @@@ -558,7 -583,8 +559,9 @@@ CONFIG_VIDEO_STI_DELTA=
>>   CONFIG_VIDEO_RENESAS_JPU=m
>>   CONFIG_VIDEO_RENESAS_VSP1=m
>>   CONFIG_V4L_TEST_DRIVERS=y
>>  +CONFIG_VIDEO_VIVID=m
>> + CONFIG_CEC_PLATFORM_DRIVERS=y
>> + CONFIG_VIDEO_SAMSUNG_S5P_CEC=m
>>   # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
>>   CONFIG_VIDEO_ADV7180=m
>>   CONFIG_VIDEO_ML86V7667=m
>> @@@ -582,16 -613,12 +585,17 @@@ CONFIG_DRM_RCAR_DU=
>>   CONFIG_DRM_RCAR_LVDS=y
>>   CONFIG_DRM_SUN4I=m
>>   CONFIG_DRM_TEGRA=y
>>  +CONFIG_DRM_PANEL_SIMPLE=y
>>   CONFIG_DRM_PANEL_SAMSUNG_LD9040=m
>>   CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=m
>>  -CONFIG_DRM_PANEL_SIMPLE=y
>>  +CONFIG_DRM_DUMB_VGA_DAC=m
>>  +CONFIG_DRM_NXP_PTN3460=m
>>  +CONFIG_DRM_PARADE_PS8622=m
>>  +CONFIG_DRM_I2C_ADV7511=m
>>  +CONFIG_DRM_I2C_ADV7511_AUDIO=y
>> + CONFIG_DRM_SII9234=m
>>   CONFIG_DRM_STI=m
>>  -CONFIG_DRM_VC4=y
>>  +CONFIG_DRM_VC4=m
>>   CONFIG_FB_ARMCLCD=y
>>   CONFIG_FB_EFI=y
>>   CONFIG_FB_WM8505=y
>> @@@ -626,9 -655,10 +630,10 @@@ CONFIG_SND_SOC_SAMSUNG=
>>   CONFIG_SND_SOC_SAMSUNG_SMDK_WM8994=m
>>   CONFIG_SND_SOC_SMDK_WM8994_PCM=m
>>   CONFIG_SND_SOC_SNOW=m
>> + CONFIG_SND_SOC_ODROID=m
>>   CONFIG_SND_SOC_SH4_FSI=m
>>   CONFIG_SND_SOC_RCAR=m
>>  -CONFIG_SND_SIMPLE_SCU_CARD=m
>>  +CONFIG_SND_SOC_STI=m
>>   CONFIG_SND_SUN4I_CODEC=m
>>   CONFIG_SND_SOC_TEGRA=m
>>   CONFIG_SND_SOC_TEGRA20_I2S=m
>
> This is now a conflict between the arm-soc and keystone trees (I think).

Yes, my pull request ended in arm-soc so the same resolution of yours applies.

Thanks!
Krzysztof
