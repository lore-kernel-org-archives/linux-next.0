From: Tomasz Figa <tfiga@chromium.org>
Subject: Re: next-20160707 build: 1 failures 6 warnings (next-20160707)
Date: Thu, 7 Jul 2016 22:18:02 +0900
Message-ID: <CAAFQd5DacKar+T1Fj62NvAZOT_QWBhahftZJXGq40Z19n-Z4Hg@mail.gmail.com>
References: <E1bL5XI-0004Z9-EP@optimist> <20160707122219.GO6247@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qk0-f180.google.com ([209.85.220.180]:33769 "EHLO
	mail-qk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750879AbcGGNSv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Jul 2016 09:18:51 -0400
Received: by mail-qk0-f180.google.com with SMTP id e3so13808000qkd.0
        for <linux-next@vger.kernel.org>; Thu, 07 Jul 2016 06:18:24 -0700 (PDT)
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com. [209.85.216.171])
        by smtp.gmail.com with ESMTPSA id p63sm3078965qkb.13.2016.07.07.06.18.22
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Jul 2016 06:18:22 -0700 (PDT)
Received: by mail-qt0-f171.google.com with SMTP id c34so8000275qte.0
        for <linux-next@vger.kernel.org>; Thu, 07 Jul 2016 06:18:22 -0700 (PDT)
In-Reply-To: <20160707122219.GO6247@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Mark Yao <mark.yao@rock-chips.com>, David Airlie <airlied@linux.ie>, Heiko Stuebner <heiko@sntech.de>, Simon Xue <xxm@rock-chips.com>, Shunqian Zheng <zhengsq@rock-chips.com>, Joerg Roedel <jroedel@suse.de>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, dri-devel <dri-devel@lists.freedesktop.org>

Hi Mark,

On Thu, Jul 7, 2016 at 9:22 PM, Mark Brown <broonie@kernel.org> wrote:
> On Thu, Jul 07, 2016 at 10:23:56AM +0100, Build bot for Mark Brown wrote:
>
> Today's -next fails to build an arm64 allmodconfig due to:
>
>>       arm64-allmodconfig
>> ../drivers/gpu/drm/rockchip/rockchip_drm_drv.c:17:27: fatal error: asm/dma-iommu.h: No such file or directory
>
> triggered by c51f43a9c171ea (iommu/rockchip: Enable Rockchip IOMMU on
> ARM64) which enables the Rockchip IOMMU driver on ARM64 which lacks the
> above header.  Either the use of the header needs to be removed or an
> explicit ARM64 dependency added at the DRM level.

Looks like next is missing the DRM side of the series, which makes the
driver in question not need this header anymore.

This is probably because we missed this hidden dependency and decided
to push the IOMMU part separately through the IOMMU tree. I guess we
can remove the offending patch from the IOMMU tree and let the DRM
tree include it based on a topic branch from Joerg.

Joerg, David, Mark Yao, what do you think?

Best regards,
Tomasz
