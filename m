From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: linux-next: manual merge of the amlogic tree with the pinctrl tree
Date: Thu, 15 Sep 2016 14:18:01 -0700
Message-ID: <7h60pwlv5i.fsf@baylibre.com>
References: <20160915101908.08f24fe1@canb.auug.org.au>
        <CACRpkdZnovdXWdm3udHXtfobPUiovTTSJ5WOKKw+QrSVp+GpHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:35845 "EHLO
        mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752784AbcIOVSE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Sep 2016 17:18:04 -0400
Received: by mail-pa0-f54.google.com with SMTP id id6so19338031pad.3
        for <linux-next@vger.kernel.org>; Thu, 15 Sep 2016 14:18:03 -0700 (PDT)
In-Reply-To: <CACRpkdZnovdXWdm3udHXtfobPUiovTTSJ5WOKKw+QrSVp+GpHA@mail.gmail.com>
        (Linus Walleij's message of "Thu, 15 Sep 2016 14:22:40 +0200")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Carlo Caione <carlo@caione.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Deepak <deepak_das@mentor.com>

Linus Walleij <linus.walleij@linaro.org> writes:

> On Thu, Sep 15, 2016 at 2:19 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>>   23b4ed268076 ("driver: base: pinctrl: return error from pinctrl_bind_pins()")
>>
>> from the pinctrl tree and commit:
>>
>>   eb4ec68acf5e ("driver: base: pinctrl: return error from pinctrl_bind_pins()")
>>
>> from the amlogic tree.
>
> That should not be in the amlogic tree.
>
> Carlo, Deepak etc: Please make sure it goes away from there.

It in the amlogic tree because I merged your pinctrl/devel into my
integration branch for testing, but appears the one I merged was
out-dated.  Fixed.

Kevin
