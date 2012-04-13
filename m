From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: linux-next: "amba: Remove AMBA level regulator support" commit.
Date: Fri, 13 Apr 2012 10:01:52 +0800
Message-ID: <CAAQ0ZWReL=+bm9UOnt2=Dfy0zeWbJe3=y3pPzUKRzm2y277kFQ@mail.gmail.com>
References: <20120413012230.GA30438@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:53485 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750819Ab2DMCBy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Apr 2012 22:01:54 -0400
Received: by lbbgm6 with SMTP id gm6so2105563lbb.19
        for <linux-next@vger.kernel.org>; Thu, 12 Apr 2012 19:01:52 -0700 (PDT)
In-Reply-To: <20120413012230.GA30438@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: broonie@opensource.wolfsonmicro.com, linus.walleij@linaro.org, linux-next@vger.kernel.org, rmk+kernel@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org

On 13 April 2012 09:22, Paul Gortmaker <paul.gortmaker@windriver.com> w=
rote:
> Hi Mark,
>
> The commit in linux-next:
>
> -----------------
> commit b2bc9e0ee349db84035d8141e85babc7986594d7
> Author: Mark Brown <broonie@sirena.org.uk>
> Date: =A0 Mon Apr 2 12:30:35 2012 +0100
>
> =A0 =A0ARM: 7366/1: amba: Remove AMBA level regulator support
> -----------------
>
> is pointed at by git bisect for the u8500_defconfig build failure:
>
> drivers/dma/ste_dma40.c:2708:3: error: implicit declaration of functi=
on
> 'regulator_disable' [-Werror=3Dimplicit-function-declaration]
> drivers/dma/ste_dma40.c:2747:3: error: implicit declaration of functi=
on
> 'regulator_enable' [-Werror=3Dimplicit-function-declaration]
> drivers/dma/ste_dma40.c:3260:3: error: implicit declaration of functi=
on
> 'regulator_get' [-Werror=3Dimplicit-function-declaration]
> drivers/dma/ste_dma40.c:3271:4: error: implicit declaration of functi=
on
> 'regulator_put' [-Werror=3Dimplicit-function-declaration]
>
That's because Mark's patch removes "#include
<linux/regulator/consumer.h>" included indirectly by
drivers/dma/ste_dma40.c from linux/amba/bus.h.  The ste_dma40.c should
really directly includes consumer.h.

Regards,
Shawn
