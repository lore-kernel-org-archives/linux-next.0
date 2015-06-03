From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: next-20150603 build: 5 failures 55 warnings (next-20150603)
Date: Wed, 3 Jun 2015 18:38:45 -0400
Message-ID: <CAP=VYLojVYPwC7N5ePFQ08aTd0a3G5SEirME8bfDuSASyM4jpw@mail.gmail.com>
References: <E1Z08Mt-0006dU-4j@optimist>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:36221 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753340AbbFCWjR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2015 18:39:17 -0400
Received: by wibdq8 with SMTP id dq8so106721702wib.1
        for <linux-next@vger.kernel.org>; Wed, 03 Jun 2015 15:39:15 -0700 (PDT)
In-Reply-To: <E1Z08Mt-0006dU-4j@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Build bot for Mark Brown <broonie@kernel.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Wed, Jun 3, 2015 at 9:06 AM, Build bot for Mark Brown
<broonie@kernel.org> wrote:
> Tree/Branch: next-20150603
> Git describe: next-20150603
> Commit: 273de33838 Add linux-next specific files for 20150603
>
> Build Time: 64 min 44 sec
>
> Passed:    4 / 9   ( 44.44 %)
> Failed:    5 / 9   ( 55.56 %)
>
> Errors: 10
> Warnings: 55
> Section Mismatches: 1
>
> Failed defconfigs:
>         arm64-allmodconfig
>         arm-multi_v7_defconfig
>         arm-allmodconfig
>         arm-allnoconfig
>         arm64-defconfig
>
> Errors:
>
>         arm64-allmodconfig
> ../include/linux/device.h:1296:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
> ../include/linux/device.h:1301:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
> ../include/linux/device.h:1296:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
> ../include/linux/device.h:1301:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
> ../include/linux/device.h:1296:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
> ../include/linux/device.h:1301:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]

I'm pretty sure that the above are just duplicates from the
tegra/fuse/fuse-tegra error below.

>
>         arm-multi_v7_defconfig
> ../drivers/clk/sunxi/clk-mod0.c:131:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
> ../drivers/clk/sunxi/clk-mod0.c:131:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]

The sunxi should be fixed with this now added:

https://lkml.kernel.org/r/1433358578-9579-1-git-send-email-paul.gortmaker@windriver.com

> ../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
> ../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]

The tegra fix should ideally be in the tegra tree, as per here:

https://lkml.kernel.org/r/20150603160808.GM29898@windriver.com

...but since I didn't hear from Thierry yet, I put in this preemptive fix,
since we get those ugly looking device.h errors above from this.

https://git.kernel.org/cgit/linux/kernel/git/paulg/linux.git/commit/?h=init-v4.1-rc6&id=53806e8b585f2eaf1cda5fbef89cd8e4b5f3d336

>
>         arm-allmodconfig
> ../drivers/cpufreq/exynos-cpufreq.c:239:1: error: type defaults to 'int' in declaration of 'device_initcall' [-Werror=implicit-int]

The exynos should be fixed now as well, with this:

https://lkml.kernel.org/r/1433366298-30016-1-git-send-email-paul.gortmaker@windriver.com

> ../drivers/clk/sunxi/clk-mod0.c:131:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
> ../drivers/clk/sunxi/clk-mod0.c:131:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]

The  sunxi was covered above.

> ../drivers/hwtracing/coresight/coresight-replicator-qcom.c:214:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
> ../drivers/hwtracing/coresight/coresight-replicator-qcom.c:214:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]

I can't fix this one from my tree since the code only exists in next.
But I've passed the fix onto Greg since it comes via his staging tree:

https://lkml.kernel.org/r/1433364777-29651-1-git-send-email-paul.gortmaker@windriver.com

> ../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
> ../drivers/soc/tegra/fuse/fuse-tegra.c:171:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]

Same tegra thing mentioned above.

> ../drivers/tty/serial/8250/8250_omap.c:586:20: error: redefinition of 'omap8250_irq'

I don't think that one was caused by me..

>
>         arm64-defconfig
> ../include/linux/device.h:1296:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
> ../include/linux/device.h:1301:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]

Tegra one again, unfortunately.

Thanks again for the extra build coverage; I should have given a heads-up
earlier that I was proactively sorting this out once I saw the results.

I'd run all the ARM defconfigs recently, but forgot to go back and redo
the allmodconfigs after test-merging with the latest linux-next.  :-/

Paul.
