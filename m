From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: next-20160629 build: 2 failures 4 warnings (next-20160629)
Date: Wed, 29 Jun 2016 16:53:15 +0200
Message-ID: <5967470.99cM9XydEF@wuerfel>
References: <E1bIBcE-0003jN-K9@optimist>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.75]:55440 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752417AbcF2Ouq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Jun 2016 10:50:46 -0400
In-Reply-To: <E1bIBcE-0003jN-K9@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linaro-kernel@lists.linaro.org
Cc: Build bot for Mark Brown <broonie@kernel.org>, kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Wednesday, June 29, 2016 10:17:02 AM CEST Build bot for Mark Brown wrote:
> Tree/Branch: next-20160629
> 	arm64-allmodconfig
> ../drivers/gpu/drm/mediatek/mtk_hdmi.c:1653:15: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
> ../drivers/gpu/drm/mediatek/mtk_hdmi.c:1654:19: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
> ../drivers/gpu/drm/mediatek/mtk_hdmi.c:1655:20: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
> ../drivers/gpu/drm/mediatek/mtk_hdmi.c:1656:18: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
> ../drivers/gpu/drm/mediatek/mtk_hdmi.c:1657:13: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]

The dri-devel and asoc-devel trees clashed, I just sent a fix, but
we cannot apply it unless both branches are merged.
> 
> Warnings Summary: 4
> 	  1 ../include/linux/kernel.h:743:17: warning: comparison of distinct pointer types lacks a cast
> 	  1 ../drivers/tty/serial/8250/8250_fintek.c:34:0: warning: "IRQ_MODE" redefined
> 	  1 ../arch/arm/mach-s3c64xx/common.h:28:2: warning: its scope is only this definition or declaration, which is probably not what you want
> 	  1 ../arch/arm/mach-s3c64xx/common.h:28:2: warning: 'struct device_node' declared inside parameter list

Sent fixes for these all before.

	Arnd
