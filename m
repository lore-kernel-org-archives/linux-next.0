From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: next-20161108 build: 2 failures 1 warnings (next-20161108)
Date: Tue, 8 Nov 2016 22:58:58 +1100
Message-ID: <20161108225858.17b3440d@canb.auug.org.au>
References: <E1c43nx-0006yU-De@optimist>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40887 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933116AbcKHMJl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Nov 2016 07:09:41 -0500
In-Reply-To: <E1c43nx-0006yU-De@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Build bot for Mark Brown <broonie@kernel.org>, Stephen Warren <swarren@nvidia.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Thierry Reding <treding@nvidia.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, Mirza Krak <mirza.krak@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Jon Hunter <jonathanh@nvidia.com>

Hi all,

On Tue, 08 Nov 2016 10:39:01 +0000 Build bot for Mark Brown <broonie@kernel.org> wrote:
>
> 	arm64-allmodconfig
> ../drivers/bus/tegra-gmi.c:97:11: error: 'dev' undeclared (first use in this function)
> 
> 	arm-allmodconfig
> ../drivers/bus/tegra-gmi.c:97:11: error: 'dev' undeclared (first use in this function)

Caused by commit

  4f95e6a5c9e4 ("bus: Add support for Tegra Generic Memory Interface")

from the tegra tree.
-- 
Cheers,
Stephen Rothwell
