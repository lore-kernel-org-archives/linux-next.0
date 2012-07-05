From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: linux-next: manual merge of the input-mt tree with the
 input-current tree
Date: Thu, 5 Jul 2012 11:57:14 +0800
Message-ID: <CAGS+omDab9mOOf6pCryRTyLvYA66h0XjqmFPc-vrAo4hkfGN0A@mail.gmail.com>
References: <20120705135220.9f8f95082833a0d6fadeb136@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:56177 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751418Ab2GED5f (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Jul 2012 23:57:35 -0400
Received: by obbuo13 with SMTP id uo13so12412453obb.19
        for <linux-next@vger.kernel.org>; Wed, 04 Jul 2012 20:57:35 -0700 (PDT)
In-Reply-To: <20120705135220.9f8f95082833a0d6fadeb136@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Henrik Rydberg <rydberg@euromail.se>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>

On Thu, Jul 5, 2012 at 11:52 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Henrik,
>
> Today's linux-next merge of the input-mt tree got a conflict in
> drivers/input/touchscreen/atmel_mxt_ts.c between commit 9b7e31bbf4bb
> ("Input: request threaded-only IRQs with IRQF_ONESHOT") from the
> input-current tree and commit c2ef9a1a248b ("Input: atmel_mxt_ts - use
> client name for irq") from the input-mt tree.
>
> I fixed it up (see below) and can carry the fix as necessary.

Looks good to me. Don't know if you need it for a merge, but:

Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>


> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
>
> diff --cc drivers/input/touchscreen/atmel_mxt_ts.c
> index 25fd056,37190ab..0000000
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@@ -1144,13 -1167,8 +1167,9 @@@ static int __devinit mxt_probe(struct i
>         input_set_drvdata(input_dev, data);
>         i2c_set_clientdata(client, data);
>
> -       error = mxt_initialize(data);
> -       if (error)
> -               goto err_free_object;
> -
>         error = request_threaded_irq(client->irq, NULL, mxt_interrupt,
>  -                      pdata->irqflags, client->name, data);
>  +                                   pdata->irqflags | IRQF_ONESHOT,
> -                                    client->dev.driver->name, data);
> ++                                   client->name, data);
>         if (error) {
>                 dev_err(&client->dev, "Failed to register interrupt\n");
>                 goto err_free_object;
