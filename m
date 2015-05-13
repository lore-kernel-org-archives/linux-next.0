From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Wed, 13 May 2015 16:04:47 +0900
Message-ID: <CAAVeFuLNePN8+BwdgxoCyNLzYuH0pSV-QzwDnA1ty_x=+MMRXA@mail.gmail.com>
References: <20150513165516.66a0dbbb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ig0-f176.google.com ([209.85.213.176]:34174 "EHLO
	mail-ig0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751963AbbEMHFI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 May 2015 03:05:08 -0400
In-Reply-To: <20150513165516.66a0dbbb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Wed, May 13, 2015 at 3:55 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Linus,
>
> After merging the gpio tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpio/gpio-dln2.c: In function 'dln2_gpio_probe':
> drivers/gpio/gpio-dln2.c:469:12: error: 'struct gpio_chip' has no member named 'exported'
>   dln2->gpio.exported = true;
>             ^
>
> Caused by commit 6a4b6b0a3b55 ("gpio: sysfs: clean up chip class-device
> handling").

Johan has submitted a fix for this:

https://lkml.org/lkml/2015/5/12/437
