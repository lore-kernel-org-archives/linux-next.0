From: Jisheng Zhang <jszhang@marvell.com>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Wed, 21 Jun 2017 14:12:41 +0800
Message-ID: <20170621141221.2b006411@xhacker>
References: <20170621160934.67c1f27e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:36530 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750987AbdFUGRY (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Jun 2017 02:17:24 -0400
In-Reply-To: <20170621160934.67c1f27e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Xiaoguang Chen <xgchenshy@gmail.com>

On Wed, 21 Jun 2017 16:09:34 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Linus,
> 
> After merging the gpio tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/gpio/gpio-dwapb.c: In function 'dwapb_irq_set_type':
> drivers/gpio/gpio-dwapb.c:291:2: error: stray '\357' in program
>   if （type != IRQ_TYPE_EDGE_BOTH）
>   ^
> drivers/gpio/gpio-dwapb.c:291:2: error: stray '\274' in program
> drivers/gpio/gpio-dwapb.c:291:2: error: stray '\210' in program
> drivers/gpio/gpio-dwapb.c:291:8: error: expected '(' before 'type'
>   if （type != IRQ_TYPE_EDGE_BOTH）
>         ^
> drivers/gpio/gpio-dwapb.c:291:8: warning: statement with no effect [-Wunused-value]
> drivers/gpio/gpio-dwapb.c:291:8: error: stray '\357' in program
> drivers/gpio/gpio-dwapb.c:291:8: error: stray '\274' in program
> drivers/gpio/gpio-dwapb.c:291:8: error: stray '\211' in program

oops, I see this error as well, Xiaoguang uses Chinese "()" instead of
ASII "()", I fixed it locally but I forget to mention it.
