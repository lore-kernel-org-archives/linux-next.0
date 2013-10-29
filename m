From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the final tree (gpio
 tree related)
Date: Tue, 29 Oct 2013 14:28:34 +0100
Message-ID: <CACRpkdb_n+bDq3hMR++r2Xr_sWnDVek492XeHAMh5Jtd53-woA@mail.gmail.com>
References: <20131029011223.58b51e529acced32d6dae82a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:56230 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752213Ab3J2N2f (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 29 Oct 2013 09:28:35 -0400
Received: by mail-ob0-f176.google.com with SMTP id uy5so5101425obc.7
        for <linux-next@vger.kernel.org>; Tue, 29 Oct 2013 06:28:34 -0700 (PDT)
In-Reply-To: <20131029011223.58b51e529acced32d6dae82a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Mon, Oct 28, 2013 at 3:12 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Caused by commit 79a9becda894 ("gpiolib: export descriptor-based GPIO
> interface") from the gpio tree.
>
> I have applied this fix up patch for today:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 29 Oct 2013 01:06:23 +1100
> Subject: [PATCH] gpiolib: provide a declaration of seq_file in gpio/driver.h
>
> Fixes this build error:
>
> In file included from include/asm-generic/gpio.h:13:0,
>                  from include/linux/gpio.h:51,
>                  from include/linux/of_gpio.h:20,
>                  from arch/powerpc/sysdev/ppc4xx_gpio.c:29:
> include/linux/gpio/driver.h:85:14: error: 'struct seq_file' declared inside parameter list [-Werror]
> include/linux/gpio/driver.h:85:14: error: its scope is only this definition or declaration, which is probably not what you want [-Werror]
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Patch applied to the GPIO tree, thanks for fixing up our mess!

Yours,
Linus Walleij
