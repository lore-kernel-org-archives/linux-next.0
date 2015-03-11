From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Mar 11 (arm build failure, ASoC)
Date: Wed, 11 Mar 2015 08:51:54 -0700
Message-ID: <20150311155154.GA22446@roeck-us.net>
References: <20150311163558.6a09cfcc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:33967 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750779AbbCKPv7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Mar 2015 11:51:59 -0400
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YVivO-002Z6s-K0
	for linux-next@vger.kernel.org; Wed, 11 Mar 2015 15:51:58 +0000
Content-Disposition: inline
In-Reply-To: <20150311163558.6a09cfcc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>

On Wed, Mar 11, 2015 at 04:35:58PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150310:
> 
> New tree: drm-exynos
> 
> The sound-asoc tree still had its build failure so I used the version from
> next-20150306.
> 
> The regulator tree lost its build failure.
> 
> The tip tree gained a conflict against the usb-gadget-fixes tree.
> 
> The staging tree lost its build failure.
> 
> Non-merge commits (relative to Linus' tree): 3446
>  3448 files changed, 138744 insertions(+), 73083 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
Building arm:omap2plus_defconfig ... failed
--------------
Error log:
sound/soc/davinci/davinci-mcasp.c: In function 'davinci_mcasp_suspend':
sound/soc/davinci/davinci-mcasp.c:1062:2: error: expected ';' before 'if'

Caused by 6afda7f507 ("ASoC: davinci-mcasp: Allow complete shutdown of McASP
when not in use"). Yes, there is a missing ';' in that code.

Guenter
