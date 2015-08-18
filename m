From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Tue, 18 Aug 2015 14:00:28 +0200
Message-ID: <CACRpkda=qtTr+YFWhcGd=3fnP_1pzpNKTbbehP6FdUahoQgBtw@mail.gmail.com>
References: <20150818165719.5ac6f687@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:35113 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752457AbbHRMA3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 18 Aug 2015 08:00:29 -0400
Received: by oiew67 with SMTP id w67so79752459oie.2
        for <linux-next@vger.kernel.org>; Tue, 18 Aug 2015 05:00:28 -0700 (PDT)
In-Reply-To: <20150818165719.5ac6f687@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hans.verkuil@cisco.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>

On Tue, Aug 18, 2015 at 8:57 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Linus,
>
> After merging the gpio tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/media/i2c/tc358743.c: In function 'tc358743_probe_of':
> drivers/media/i2c/tc358743.c:1786:22: error: too few arguments to function 'devm_gpiod_get'
>   state->reset_gpio = devm_gpiod_get(dev, "reset");
>                       ^
> In file included from drivers/media/i2c/tc358743.c:34:0:
> include/linux/gpio/consumer.h:73:32: note: declared here
>  struct gpio_desc *__must_check devm_gpiod_get(struct device *dev,
>                                 ^

Argh.

> I have added the following fix patch for today:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 18 Aug 2015 16:53:21 +1000
> Subject: [PATCH] [media] tc358743: fix for devm_gpiod_get API change
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/media/i2c/tc358743.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
> index fe42c9a1cb78..8f7641164d9d 100644
> --- a/drivers/media/i2c/tc358743.c
> +++ b/drivers/media/i2c/tc358743.c
> @@ -1783,7 +1783,7 @@ static int tc358743_probe_of(struct tc358743_state *state)
>         state->pdata.ths_trailcnt = 0x2;
>         state->pdata.hstxvregcnt = 0;
>
> -       state->reset_gpio = devm_gpiod_get(dev, "reset");
> +       state->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_ASIS);
>         if (IS_ERR(state->reset_gpio)) {
>                 dev_err(dev, "failed to get reset gpio\n");
>                 ret = PTR_ERR(state->reset_gpio);

This is likely the correct solution. Mauro, can you apply Stephen's
patch to your media tree?

Yours,
Linus Walleij
