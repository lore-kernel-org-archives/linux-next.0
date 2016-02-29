From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: next-20160229 build: 1 failures 40 warnings (next-20160229)
Date: Mon, 29 Feb 2016 13:24:41 +0100
Message-ID: <17469991.f4u2qCNYdr@wuerfel>
References: <E1aaM2h-0001cz-TB@optimist>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:63398 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754276AbcB2MYs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Feb 2016 07:24:48 -0500
In-Reply-To: <E1aaM2h-0001cz-TB@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linaro-kernel@lists.linaro.org
Cc: Build bot for Mark Brown <broonie@kernel.org>, kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org

On Monday 29 February 2016 11:31:12 Build bot for Mark Brown wrote:
> -------------------------------------------------------------------------------
> arm-multi_v5_defconfig : PASS, 0 errors, 2 warnings, 0 section mismatches
> 
> Warnings:
> 	<stdin>:1310:2: warning: #warning syscall madvisev not implemented [-Wcpp]

Not much we can do about this. I wonder if the script should report these
at all.

> x86 allmodconfig
> Errors:
> 	drivers/gpio/Kconfig:34:error: recursive dependency detected!
> 	drivers/gpio/Kconfig:34:error: recursive dependency detected!

Oh well. I've sent a patch now, what else should I do.

> -------------------------------------------------------------------------------
> arm-allmodconfig : PASS, 0 errors, 11 warnings, 0 section mismatches
> 
> Warnings:
> 	../lib/lz4/lz4hc_compress.c:514:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]

I've sent a patch for Kbuild to avoid this, should probably ping the
maintainer.

> 	../include/asm-generic/div64.h:207:28: warning: comparison of distinct pointer types lacks a cast
> 	../include/asm-generic/div64.h:220:25: warning: right shift count >= width of type [-Wshift-count-overflow]
> 	../include/asm-generic/div64.h:224:22: warning: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]

Not sure where this comes from, I've sent a patch for iio/adc/imx25-gcq to address this
kind of problem.

> 	../drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]

I sent a patch on Jan 1, but the 0day bot found a warning on UML, I've resent
it with a slight adaptation now.

> 	../drivers/ntb/test/ntb_perf.c:213:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> 	../drivers/ntb/test/ntb_perf.c:214:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

Resent my fix today, there was one Ack but no other reply on the original
submission.

> 	../drivers/platform/goldfish/goldfish_pipe.c:312:3: warning: 'get_user_pages8' is deprecated [-Wdeprecated-declarations]

Sent a patch, but it's not getting applied before -rc1 as the warning shows up only
in combination of the tip and next trees, and it is harmless (it warns about an added
use of an older API after the API was changed along with all other users in tip)

> 	../include/linux/kern_levels.h:4:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 8 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]

I think I must have sent a patch, but I don't know which driver this is.

	Arnd
