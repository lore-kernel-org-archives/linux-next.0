From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: manual merge of the amlogic tree with the pinctrl tree
Date: Thu, 15 Sep 2016 14:22:40 +0200
Message-ID: <CACRpkdZnovdXWdm3udHXtfobPUiovTTSJ5WOKKw+QrSVp+GpHA@mail.gmail.com>
References: <20160915101908.08f24fe1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:36354 "EHLO
        mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933761AbcIOMWl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Sep 2016 08:22:41 -0400
Received: by mail-oi0-f51.google.com with SMTP id q188so66048000oia.3
        for <linux-next@vger.kernel.org>; Thu, 15 Sep 2016 05:22:41 -0700 (PDT)
In-Reply-To: <20160915101908.08f24fe1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Deepak <deepak_das@mentor.com>

On Thu, Sep 15, 2016 at 2:19 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

>   23b4ed268076 ("driver: base: pinctrl: return error from pinctrl_bind_pins()")
>
> from the pinctrl tree and commit:
>
>   eb4ec68acf5e ("driver: base: pinctrl: return error from pinctrl_bind_pins()")
>
> from the amlogic tree.

That should not be in the amlogic tree.

Carlo, Deepak etc: Please make sure it goes away from there.

Yours,
Linus Walleij
