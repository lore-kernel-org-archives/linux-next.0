From: Simon Horman <horms@verge.net.au>
Subject: Re: next-20170522 build: 2 failures 7 warnings (next-20170522)
Date: Tue, 23 May 2017 07:28:28 +0200
Message-ID: <20170523052828.GB25840@verge.net.au>
References: <E1dCmcB-0007CC-3W@optimist>
 <20170522150600.ewzu55g4ootbt7tm@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58066 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933158AbdEWF2d (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 May 2017 01:28:33 -0400
Content-Disposition: inline
In-Reply-To: <20170522150600.ewzu55g4ootbt7tm@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulf.hansson@linaro.org>, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infreadead.org, kernel-build-reports@lists.linaro.org

On Mon, May 22, 2017 at 04:06:00PM +0100, Mark Brown wrote:
> On Mon, May 22, 2017 at 01:39:11PM +0100, Build bot for Mark Brown wrote:
> 
> Today's -next fails to build both arm and arm64 allmodconfig due to:
> 
> > 	arm64-allmodconfig
> > ERROR: "renesas_sdhi_remove" [drivers/mmc/host/renesas_sdhi_sys_dmac.ko] undefined!
> > ERROR: "renesas_sdhi_probe" [drivers/mmc/host/renesas_sdhi_sys_dmac.ko] undefined!
> 
> > 	arm-allmodconfig
> > ERROR: "renesas_sdhi_remove" [drivers/mmc/host/renesas_sdhi_sys_dmac.ko] undefined!
> > ERROR: "renesas_sdhi_probe" [drivers/mmc/host/renesas_sdhi_sys_dmac.ko] undefined!
> 
> caused by the recent refactoring which created renesas_sdhi_core.c -
> those symbols aren't exported.

Sorry about that. I believe Arnd (CCed) posted a patch to resolve
this problem which Ulf has applied.

The patch is "[PATCH] mmc: renesas-sdhi: export renesas_sdhi_probe"
