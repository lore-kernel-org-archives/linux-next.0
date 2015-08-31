From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Mon, 31 Aug 2015 08:49:20 +0200
Message-ID: <CACRpkdacdnkwiz5g8PMOWL5i1-dsrg2-a1teon_nQGOPbF=RZg@mail.gmail.com>
References: <20150831164046.0ffd7c55@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:34437 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752390AbbHaGtV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 31 Aug 2015 02:49:21 -0400
Received: by obbfr1 with SMTP id fr1so86227256obb.1
        for <linux-next@vger.kernel.org>; Sun, 30 Aug 2015 23:49:20 -0700 (PDT)
In-Reply-To: <20150831164046.0ffd7c55@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>, Fengguang Wu <fengguang.wu@intel.com>

On Mon, Aug 31, 2015 at 8:40 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the gpio tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpio/gpio-etraxfs.c: In function 'etraxfs_gpio_irq_request_resources':
> drivers/gpio/gpio-etraxfs.c:300:2: error: 'ret' undeclared (first use in this function)
>   ret = gpiochip_lock_as_irq(&chip->bgc.gc, d->hwirq);
>   ^
>
> Caused by commit
>
>   5e22ec019823 ("gpio: extraxfs: fix returnvar.cocci warnings")

Seems like the coccinelle patch was made against an earlier version
of the tree before some other patches went in.

Pulling this one out...

Thanks,
Linus Walleij
