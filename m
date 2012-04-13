From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: "amba: Remove AMBA level regulator support" commit.
Date: Fri, 13 Apr 2012 14:26:04 +0200
Message-ID: <CACRpkdYkTHcppMtEy94cRiaHApeeohiiaCaA0SuyG52n1s+Yag@mail.gmail.com>
References: <20120413012230.GA30438@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:36112 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932074Ab2DMM0F (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Apr 2012 08:26:05 -0400
Received: by ghrr11 with SMTP id r11so1552025ghr.19
        for <linux-next@vger.kernel.org>; Fri, 13 Apr 2012 05:26:04 -0700 (PDT)
In-Reply-To: <20120413012230.GA30438@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: broonie@opensource.wolfsonmicro.com, linux-next@vger.kernel.org, shawn.guo@linaro.org, rmk+kernel@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org

On Fri, Apr 13, 2012 at 3:22 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> is pointed at by git bisect for the u8500_defconfig build failure:
>
> drivers/dma/ste_dma40.c:2708:3: error: implicit declaration of function
> 'regulator_disable' [-Werror=implicit-function-declaration]
> drivers/dma/ste_dma40.c:2747:3: error: implicit declaration of function
> 'regulator_enable' [-Werror=implicit-function-declaration]
> drivers/dma/ste_dma40.c:3260:3: error: implicit declaration of function
> 'regulator_get' [-Werror=implicit-function-declaration]
> drivers/dma/ste_dma40.c:3271:4: error: implicit declaration of function
> 'regulator_put' [-Werror=implicit-function-declaration]

I've already sent a patch to the DMA maintainer to fix this.
It was a bug in the DMA driver actually - it did not include the proper
headers - so it just got triggered by this patch.
http://marc.info/?l=linux-kernel&m=133424730706377&w=2

Yours,
Linus Walleij
