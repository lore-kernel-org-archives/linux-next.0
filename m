From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the final tree (gpio-lw
 tree related)
Date: Tue, 22 Jan 2013 10:46:11 +0100
Message-ID: <CACRpkdaiBd5iYj=dgaCtd2sy_pS=YHbEMQy7Gbk4J2mGmbm6=w@mail.gmail.com>
References: <20130122151048.e47ecfe9432b747f79544c25@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130122151048.e47ecfe9432b747f79544c25@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-next.vger.kernel.org

On Tue, Jan 22, 2013 at 5:10 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>
> drivers/gpio/gpio-palmas.c: In function 'palmas_gpio_get':
> drivers/gpio/gpio-palmas.c:46:2: error: implicit declaration of function 'palmas_read' [-Werror=implicit-function-declaration]
> drivers/gpio/gpio-palmas.c: In function 'palmas_gpio_set':
> drivers/gpio/gpio-palmas.c:62:3: error: implicit declaration of function 'palmas_write' [-Werror=implicit-function-declaration]
> drivers/gpio/gpio-palmas.c: In function 'palmas_gpio_output':
> drivers/gpio/gpio-palmas.c:83:2: error: implicit declaration of function 'palmas_update_bits' [-Werror=implicit-function-declaration]
> drivers/gpio/gpio-palmas.c: In function 'palmas_gpio_to_irq':
> drivers/gpio/gpio-palmas.c:108:2: error: implicit declaration of function 'palmas_irq_get_virq' [-Werror=implicit-function-declaration]
>
> Caused by commit 4bb49f0dc999 ("gpio: palmas: Add support for Palams
> GPIO").

I have dropped this commit from my tree for now.

Thanks Stephen!

Yours,
Linus Walleij
