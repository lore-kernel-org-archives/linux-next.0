From: Kukjin Kim <kgene@kernel.org>
Subject: RE: linux-next: build failure after merge of the samsung tree
Date: Wed, 24 Sep 2014 12:54:05 +0900
Message-ID: <010701cfd7ab$2f7acc30$8e706490$@kernel.org>
References: <20140924110836.209bc8e2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:40142 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751990AbaIXDyH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 23 Sep 2014 23:54:07 -0400
In-reply-to: 
Content-language: ko
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Stephen Rothwell' <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>, 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, 'Mike Turquette' <mturquette@linaro.org>

Kukjin Kim wrote:
> 
> Stephen Rothwell wrote:
> >
> > Hi Kukjin,
> >
> Hi Stephen,
> 
> > After merging the samsung tree, today's linux-next build (arm multi_v7_defconfig)
> > failed like this:
> >
> > arch/arm/boot/dts/exynos5250-snow.dts:13:46: fatal error: dt-bindings/clock/maxim,max77686.h: No
> such
> > file or directory
> >  #include <dt-bindings/clock/maxim,max77686.h>
> >                                               ^
> >
> + Mike
> 
> Hmm... I think, inclusion of the header file should be included in Mike's clk
> tree...What's wrong?
> 
Just note, I've merged Mike's clk-next into my -next tree.

> > Caused by commit c04c92ed5614 ("ARM: dts: Add rtc_src clk for s3c-rtc on exynos5250-snow").
> >
> > In file included from arch/arm/mach-tegra/cpuidle-tegra114.c:17:0:
> > arch/arm/mach-tegra/cpuidle-tegra114.c: In function 'tegra114_idle_power_down':
> > arch/arm/include/asm/firmware.h:64:24: error: too few arguments to function 'firmware_ops->do_idle'
> >   ((firmware_ops->op) ? firmware_ops->op(__VA_ARGS__) : (-ENOSYS))
> >                         ^
> > arch/arm/mach-tegra/cpuidle-tegra114.c:52:6: note: in expansion of macro 'call_firmware_op'
> >   if (call_firmware_op(do_idle) == -ENOSYS)
> >       ^
> >
> > Caused by commit f5217f3b9332 ("ARM: EXYNOS: add AFTR mode support to
> > firmware do_idle method").
> 
> OK, I'll revert it firstly. Thanks.
> 
Reverted just now.

> >
> > I have used the samsung tree from next-20140923 for today.
> 
> OK.
> 
> - Kukjin
