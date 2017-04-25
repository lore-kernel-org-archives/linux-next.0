From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: next-20170424 build: 1 failures 0 warnings (next-20170424)
Date: Tue, 25 Apr 2017 21:57:10 +0200
Message-ID: <CAK8P3a2sFSojMioTmF06eSgQiAJNurhDLCzSAF6W0Qd4XOe=KA@mail.gmail.com>
References: <E1d2ca0-0002cs-HH@optimist>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:36391 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1433194AbdDYT5L (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Apr 2017 15:57:11 -0400
In-Reply-To: <E1d2ca0-0002cs-HH@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Build bot for Mark Brown <broonie@kernel.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, Linux-Next Mailing List <linux-next@vger.kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Apr 24, 2017 at 1:54 PM, Build bot for Mark Brown
<broonie@kernel.org> wrote:
> Tree/Branch: next-20170424
> Git describe: next-20170424
> Commit: ee91aaf669 Add linux-next specific files for 20170424
>
> Build Time: 116 min 41 sec
>
> Passed:    9 / 10   ( 90.00 %)
> Failed:    1 / 10   ( 10.00 %)
>
> Errors: 1
> Warnings: 0
> Section Mismatches: 0
>
> Failed defconfigs:
>         arm-allmodconfig
>
> Errors:
>
>         arm-allmodconfig
> ERROR: "__aeabi_uldivmod" [drivers/gpu/drm/arm/mali-dp.ko] undefined!
>
> -------------------------------------------------------------------------------
> defconfigs with issues (other than build errors):
>
> -------------------------------------------------------------------------------
>
> Errors summary: 1
>           1 ERROR: "__aeabi_uldivmod" [drivers/gpu/drm/arm/mali-dp.ko] undefined!
>

The regression just appeared with this release, I sent a patch now.

        Arnd
