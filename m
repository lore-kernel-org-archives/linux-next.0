From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: linux-next:  commit "Remove rtd->codec usage from CODEC drivers"
 breakage.
Date: Tue, 10 Apr 2012 17:39:15 -0400
Message-ID: <4F84A883.3040308@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:34828 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755624Ab2DJVjU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Apr 2012 17:39:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-next@vger.kernel.org

Hi Mark,

Can you have a look at this build failure?

sound/soc/codecs/wm9712.c:482:32: error: 'runtime' undeclared (first use in this function)
sound/soc/codecs/wm9712.c:499:33: error: 'runtime' undeclared (first use in this function)
make[4]: *** [sound/soc/codecs/wm9712.o] Error 1

Full log is here:

http://kisskb.ellerman.id.au/kisskb/buildresult/6087177/

It breaks eseries_pxa_defconfig,em_x270_defconfig

A bisect leads to this commit in linux-next:

--------------------
commit e6968a1719a88afa4708ff43696d6615f0be90be
Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date:   Wed Apr 4 15:58:16 2012 +0100

    ASoC: codecs: Remove rtd->codec usage from CODEC drivers
    
    In order to support CODEC<->CODEC links remove the assumption that there
    is only a single CODEC on a DAI link by removing the use of the CODEC
    pointer in the rtd from the CODEC drivers. They are already being passed
    their DAI whenever they are passed an rtd and can get the CODEC from
    there.
    
    Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
--------------------

Thanks,
Paul.

git bisect start
# good: [0034102808e0dbbf3a2394b82b1bb40b5778de9e] Linux 3.4-rc2
git bisect good 0034102808e0dbbf3a2394b82b1bb40b5778de9e
# bad: [ef1f1fecd5e7fa274229cd4f30653b4a66a76df4] Add linux-next specific files for 20120410
git bisect bad ef1f1fecd5e7fa274229cd4f30653b4a66a76df4
# good: [25cfb83003f369b9c153eefea97be39085d55936] Merge remote-tracking branch 'sound/for-next'
git bisect good 25cfb83003f369b9c153eefea97be39085d55936
# good: [b62eb966bd66c78a8fc36e566fe0448f879dad60] kvm tools: Move arch-specific cmdline init into kvm__arch_set_cmdline()
git bisect good b62eb966bd66c78a8fc36e566fe0448f879dad60
# good: [911bcb25143c2cbe3daac8785285d8daf03cf9fc] Merge branch 'linus'
git bisect good 911bcb25143c2cbe3daac8785285d8daf03cf9fc
# bad: [5fc4bef34f121f77405c7b4e5aaa485187e8011a] Merge remote-tracking branch 'trivial/for-next'
git bisect bad 5fc4bef34f121f77405c7b4e5aaa485187e8011a
# bad: [c946ebd47232bba219aff0ee2d31bd62c502696a] Merge branch 'quilt/device-mapper'
git bisect bad c946ebd47232bba219aff0ee2d31bd62c502696a
# bad: [c2f6702d318e43bf841da9c0ba5b6f1695661bbc] ASoC: tegra: utils: add support for Tegra30 devices
git bisect bad c2f6702d318e43bf841da9c0ba5b6f1695661bbc
# good: [b46b373f4084cc02d4d41a5a42199fe8462c2f13] ASoC: fsl: assign dma peripheral type according to bus topology
git bisect good b46b373f4084cc02d4d41a5a42199fe8462c2f13
# good: [1d99f2436d0d1c7741d6dfd9d27b5376cdbbca40] ASoC: core: Rework SOC_DOUBLE_R_SX_TLV add SOC_SINGLE_SX_TLV
git bisect good 1d99f2436d0d1c7741d6dfd9d27b5376cdbbca40
# bad: [063dd9d4488184f35c4598fb68f46fbba959d58e] ASoC: tegra: drop Kconfig description for SND_SOC_TEGRA_DAS
git bisect bad 063dd9d4488184f35c4598fb68f46fbba959d58e
# good: [149c53b514d0a42abbb2c9611ffc9fa2d94857e8] ASoC: wm8994: Don't bother updating the jackdet mode needlessly
git bisect good 149c53b514d0a42abbb2c9611ffc9fa2d94857e8
# good: [5c7b4a08b7f3ce49756b79386dcdad5a2a21ccb6] ASoC: fsl: remove redundant Kconfig dependency on SND_SOC_POWERPC_DMA
git bisect good 5c7b4a08b7f3ce49756b79386dcdad5a2a21ccb6
# bad: [e6968a1719a88afa4708ff43696d6615f0be90be] ASoC: codecs: Remove rtd->codec usage from CODEC drivers
git bisect bad e6968a1719a88afa4708ff43696d6615f0be90be
# good: [fc9a30e85e4a9df7e692eda45b8484fc028238f0] ASoC: tlv320aic23: Remove driver-specific version number
git bisect good fc9a30e85e4a9df7e692eda45b8484fc028238f0
