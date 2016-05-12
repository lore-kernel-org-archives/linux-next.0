From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: next-20160512 build: 0 failures 18 warnings (next-20160512)
Date: Thu, 12 May 2016 11:14:35 +0200
Message-ID: <6651930.C0tGb7p3a4@wuerfel>
References: <E1b0m8y-0002hK-8Y@optimist>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:53798 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752655AbcELJOq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 May 2016 05:14:46 -0400
In-Reply-To: <E1b0m8y-0002hK-8Y@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linaro-kernel@lists.linaro.org
Cc: Build bot for Mark Brown <broonie@kernel.org>, kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org

On Thursday 12 May 2016 09:38:52 Build bot for Mark Brown wrote:
> -------------------------------------------------------------------------------
> arm64-allnoconfig : PASS, 0 errors, 1 warnings, 0 section mismatches
> 
> Warnings:
> 	../mm/page_alloc.c:3658:5: warning: 'compact_result' may be used uninitialized in this function [-Wmaybe-uninitialized]

I sent a patch, and a better one was done subsequently.

> -------------------------------------------------------------------------------
> arm64-allmodconfig : PASS, 0 errors, 15 warnings, 0 section mismatches
> 
> Warnings:
> 	../fs/gfs2/dir.c:802:9: warning: 'leaf_no' may be used uninitialized in this function [-Wmaybe-uninitialized]
> 	../fs/gfs2/dir.c:1021:8: warning: 'leaf_no' may be used uninitialized in this function [-Wmaybe-uninitialized]
> 	../fs/reiserfs/ibalance.c:1156:2: warning: 'new_insert_key' may be used uninitialized in this function [-Wmaybe-uninitialized]
> 	../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]

I should check these all, these may have been uncovered by my change to not
set CONFIG_CC_OPTIMIZE_FOR_SIZE for allmodconfig, which dropped the
-Wno-maybe-uninitialized.

Which compiler version are you using?

> 	../include/acpi/video.h:74:12: warning: 'acpi_video_get_levels' defined but not used [-Wunused-function]
> 	../include/acpi/video.h:74:12: warning: 'acpi_video_get_levels' defined but not used [-Wunused-function]

Should be easy to fix. I never saw this so far, as it's only on arm64, not arm32.

> 	../include/soc/nps/common.h:148:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
> 	../include/soc/nps/common.h:162:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
> 	../drivers/soc/mediatek/mtk-pmic-wrap.c:1062:16: warning: large integer implicitly truncated to unsigned type [-Woverflow]
> 	../drivers/soc/mediatek/mtk-pmic-wrap.c:1074:16: warning: large integer implicitly truncated to unsigned type [-Woverflow]
> 	../drivers/soc/mediatek/mtk-pmic-wrap.c:1086:16: warning: large integer implicitly truncated to unsigned type [-Woverflow]

Probably a regression that shows up on all 64-bit builds, will take a look


> 	../drivers/xen/balloon.c:154:13: warning: 'release_memory_resource' declared 'static' but never defined [-Wunused-function]

I sent a patch

> -------------------------------------------------------------------------------
> arm-multi_v5_defconfig : PASS, 0 errors, 3 warnings, 0 section mismatches
> 
> Warnings:
> 	../kernel/cgroup.c:1634:15: warning: unused variable 'ret' [-Wunused-variable]

My patch should be merged tomorrow.

> 	../drivers/regulator/core.c:2536:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
> 	../include/linux/export.h:63:25: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
> -------------------------------------------------------------------------------
> arm-allmodconfig : PASS, 0 errors, 6 warnings, 0 section mismatches
> 
> Warnings:
> 	../drivers/gpu/drm/omapdrm/dss/dsi.c:1183:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
> 	../drivers/gpu/drm/omapdrm/dss/hdmi4.c:117:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]
> 	../drivers/gpu/drm/omapdrm/dss/hdmi5.c:134:2: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]

Only omapdrm remains using this. Peter Ujfalusi sent a patch for it
and Tomi Valkeinen applied it and sent a pull request to dri-devel
this Monday, but it has not yet shown up in linux-next, see

http://permalink.gmane.org/gmane.linux.kernel/2210499
http://lkml.iu.edu/hypermail/linux/kernel/1604.3/05431.html
http://www.spinics.net/lists/dri-devel/msg106847.html

I assume it's going to be there in -rc1. 

Mark, are you planning to remove the definition for 4.7 when we get there?
If not, maybe do a change so we don't get a warning for the EXPORT_SYMBOL?

	Arnd
