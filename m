From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
Date: Thu, 12 May 2016 15:39:27 +0200
Message-ID: <CACRpkdYg5LaGe7OnW5g3b+Rrb+K2iGKHt7vu4an9bjpCva6tvg@mail.gmail.com>
References: <20160512141411.731ba5c4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:34274 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751552AbcELNj2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 May 2016 09:39:28 -0400
Received: by mail-oi0-f46.google.com with SMTP id k142so119778099oib.1
        for <linux-next@vger.kernel.org>; Thu, 12 May 2016 06:39:27 -0700 (PDT)
In-Reply-To: <20160512141411.731ba5c4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Laxman Dewangan <ldewangan@nvidia.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>

Laxman, this must be due to one of the two top commits for tegra:

commit 1d18a3f0f0809f6c71f1f6e9e268ee904ce0b588
"pinctrl: tegra: avoid parked_reg and parked_bank"
commit b22ef2a0979f2b91cfeeabb086e4d665183a93a1
"pinctrl: tegra: Correctly check the supported configuration"

Is it something you can fix quickly or should I just revert both patches
for the time being?

Yours,
Linus Walleij

On Thu, May 12, 2016 at 6:14 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Linus,
>
> After merging the pinctrl tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> In file included from include/linux/thread_info.h:11:0,
>                  from include/asm-generic/preempt.h:4,
>                  from arch/arm/include/generated/asm/preempt.h:1,
>                  from include/linux/preempt.h:59,
>                  from include/linux/spinlock.h:50,
>                  from include/linux/seqlock.h:35,
>                  from include/linux/time.h:5,
>                  from include/linux/stat.h:18,
>                  from include/linux/module.h:10,
>                  from drivers/pinctrl/tegra/pinctrl-tegra20.c:20:
> include/linux/bug.h:34:45: error: unknown field 'parked_reg' specified in initializer
>  #define BUILD_BUG_ON_ZERO(e) (sizeof(struct { int:-!!(e); }))
>                                              ^
> include/linux/compiler-gcc.h:64:28: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
>  #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
>                             ^
> include/linux/kernel.h:54:59: note: in expansion of macro '__must_be_array'
>  #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>                                                            ^
> drivers/pinctrl/tegra/pinctrl-tegra20.c:2027:12: note: in expansion of macro 'ARRAY_SIZE'
>    .npins = ARRAY_SIZE(drive_##pg_name##_pins), \
>             ^
> drivers/pinctrl/tegra/pinctrl-tegra20.c:2050:2: note: in expansion of macro 'DRV_PG_EXT'
>   DRV_PG_EXT(pg_name, r, 2,  3,  4, 12, 20, 28, 2, 30, 2)
>   ^
> drivers/pinctrl/tegra/pinctrl-tegra20.c:2178:2: note: in expansion of macro 'DRV_PG'
>   DRV_PG(ao1,        0x868),
>   ^
>
> and many more.
>
> I cannot figure out what caused it, but using the pinctrl tree from
> next-20160511 makes it build again.
>
> I am using gcc 5.2.0 hosted on powerpcle, if that matters.
>
> --
> Cheers,
> Stephen Rothwell
