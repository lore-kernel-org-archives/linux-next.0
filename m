From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build warnings after merge of the gpio tree
Date: Thu, 7 Dec 2017 16:10:21 +0100
Message-ID: <CAK8P3a0s6+BsbxYLi5VejbBYuhhDRHPgWh5SM5i2KbJhVAY59Q@mail.gmail.com>
References: <20171103163724.73fe268e@canb.auug.org.au> <20171109145125.4c505048@canb.auug.org.au>
 <CACRpkdahm-N7JyKQ8LA69qjvPG6Vf4TRKx67emxxFKVdszGiNA@mail.gmail.com>
 <CABGGisyhjtJN=Rgjb0MS9vg+TH2M8Rir27GNyv8jAT2LibjASg@mail.gmail.com>
 <20171116094244.55db9408@canb.auug.org.au> <CAL_JsqLMjMpz81rpZuG=TJSabLpstcU-=Ypnj4ARP2M+BesjVA@mail.gmail.com>
 <20171206094853.30cc0bb0@canb.auug.org.au> <CAL_JsqL2+ZRWdywRSNKLuWWJhvbYb6RHQKTWhJQWvZLABCy7TA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:45221 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753012AbdLGPKX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Dec 2017 10:10:23 -0500
In-Reply-To: <CAL_JsqL2+ZRWdywRSNKLuWWJhvbYb6RHQKTWhJQWvZLABCy7TA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "arm@kernel.org" <arm@kernel.org>, Andy Gross <andy.gross@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Dec 6, 2017 at 9:51 PM, Rob Herring <robh@kernel.org> wrote:
> On Tue, Dec 5, 2017 at 4:48 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> These 2 aren't in -next and seem to have been missed:
>
> arm: dts: qcom: fix missing #phy-cells for apq8064

Apparently this is a subsect of 3191b5b332f8 ("ARM: dts: qcom-apq8064: Fix dsi
and hdmi phy cells"), which we already have

> arm: dts: nspire: Add missing #phy-cells to usb-nop-xceiv

Picked this one up now.

       Arnd
