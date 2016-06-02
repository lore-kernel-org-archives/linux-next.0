From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: next-20160602 build: 0 failures 2 warnings (next-20160602)
Date: Thu, 02 Jun 2016 11:58:24 +0200
Message-ID: <7858362.3LIbrZdxpY@wuerfel>
References: <E1b8PEc-0000qk-Ol@optimist>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.74]:52935 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932424AbcFBJ5u (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 2 Jun 2016 05:57:50 -0400
In-Reply-To: <E1b8PEc-0000qk-Ol@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linaro-kernel@lists.linaro.org
Cc: Build bot for Mark Brown <broonie@kernel.org>, kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org, Liviu Dudau <Liviu.Dudau@arm.com>

On Thursday, June 2, 2016 10:48:15 AM CEST Build bot for Mark Brown wrote:
> Tree/Branch: next-20160602
> Git describe: next-20160602
> Commit: ce425f36d1 Add linux-next specific files for 20160602
> 
> Build Time: 141 min 21 sec
> 
> Passed:    9 / 9   (100.00 %)
> Failed:    0 / 9   (  0.00 %)
> 
> Errors: 0
> Warnings: 2
> Section Mismatches: 0
> 
> -------------------------------------------------------------------------------
> defconfigs with issues (other than build errors):
>       2 warnings    0 mismatches  : arm64-allmodconfig
>       1 warnings    0 mismatches  : arm-allmodconfig
> 
> -------------------------------------------------------------------------------
> 
> Warnings Summary: 2
> 	  2 ../drivers/gpu/drm/arm/hdlcd_crtc.c:185:28: warning: unused variable 'hdlcd' [-Wunused-variable]

This was introduced today by 1e5e10b59403 ("drm: hdlcd: Cleanup the atomic plane operations").
Liviu, can you fix it up?

> 	  1 ../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]

I sent a patch on Monday, but Greg has been busy working on his stable kernels,
I'm sure he'll get to it.

	Arnd
