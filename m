From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: next-20170103 build: 4 failures 2 warnings (next-20170103)
Date: Tue, 3 Jan 2017 19:54:05 -0500
Message-ID: <CAP=VYLpkKWNHiL53FXdO5wYWN9a9GMd8fRjRCaLaofrgrFAecQ@mail.gmail.com>
References: <E1cOKoA-0000sR-RL@optimist>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:34038 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932500AbdADAyg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Jan 2017 19:54:36 -0500
Received: by mail-ua0-f195.google.com with SMTP id i68so35297700uad.1
        for <linux-next@vger.kernel.org>; Tue, 03 Jan 2017 16:54:36 -0800 (PST)
In-Reply-To: <E1cOKoA-0000sR-RL@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Build bot for Mark Brown <broonie@kernel.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Tue, Jan 3, 2017 at 3:51 AM, Build bot for Mark Brown
<broonie@kernel.org> wrote:
> Tree/Branch: next-20170103
> Git describe: next-20170103
> Commit: 533d7e3a9f Add linux-next specific files for 20170103

[...]


>         arm-allmodconfig
> ../samples/vfio-mdev/mtty.c:1418:20: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]

I got the same on my i386 allmodconfig build today ; unclear why sfr's
build didn't
barf on the same issue -- gcc version perhaps?  Anyway, I posted a fix:

https://lkml.kernel.org/r/20170103193643.8631-1-paul.gortmaker@windriver.com

Paul.
--

>
>         arm64-defconfig
> ../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
> ../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
> ../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
> ../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
> ../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
> ../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
> ../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
>
> -------------------------------------------------------------------------------
> defconfigs with issues (other than build errors):
>       2 warnings    0 mismatches  : arm64-allmodconfig
>       2 warnings    0 mismatches  : arm-allmodconfig
>
> -------------------------------------------------------------------------------
>
> Errors summary: 2
>          24 ../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'
>           1 ../samples/vfio-mdev/mtty.c:1418:20: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>

[...]
