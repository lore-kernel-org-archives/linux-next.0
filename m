From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: manual merge of the gpio tree with the input tree
Date: Thu, 23 Mar 2017 10:27:10 +0100
Message-ID: <CACRpkdaDUUDkEqYRRp4St=uPs5Z2TRX1XT14+yvsdLiitBaCdg@mail.gmail.com>
References: <20170320150340.6d73c179@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:35480 "EHLO
        mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753310AbdCWJ1M (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Mar 2017 05:27:12 -0400
Received: by mail-io0-f179.google.com with SMTP id z13so79047255iof.2
        for <linux-next@vger.kernel.org>; Thu, 23 Mar 2017 02:27:11 -0700 (PDT)
In-Reply-To: <20170320150340.6d73c179@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>

On Mon, Mar 20, 2017 at 5:03 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Linus,
>
> Today's linux-next merge of the gpio tree got a conflict in:
>
>   drivers/input/misc/soc_button_array.c
>
> between commit:
>
>   a01cd17000a4 ("Input: soc_button_array - use NULL for GPIO connection ID")
>
> from the input tree and commit:
>
>   c5097538c86a ("Input: soc_button_array - Propagate error from gpiod_count()")
>
> from the gpio tree.

Dmitry, I could pick the commit from the input tree and apply
Stephen's solution and put the result in the GPIO tree if you think
it's a good idea.

Yours,
Linus Walleij
