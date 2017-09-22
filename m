From: Rob Herring <robherring2@gmail.com>
Subject: Re: linux-next: manual merge of the devicetree tree with the rockchip
 and sunxi trees
Date: Fri, 22 Sep 2017 11:19:02 -0500
Message-ID: <CAL_JsqL36Cw9xPROs8WsPoOJqn-7EdyGvxG4w=6TdQGZ-apGSA@mail.gmail.com>
References: <20170920122609.2cbade55@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qk0-f170.google.com ([209.85.220.170]:43317 "EHLO
        mail-qk0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751877AbdIVQTY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Sep 2017 12:19:24 -0400
In-Reply-To: <20170920122609.2cbade55@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tomas Novotny <tomas@novotny.cz>, Jagan Teki <jagan@amarulasolutions.com>

On Tue, Sep 19, 2017 at 9:26 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Rob,
>
> Today's linux-next merge of the devicetree tree got a conflict in:
>
>   Documentation/devicetree/bindings/vendor-prefixes.txt
>
> between commit:
>
>   50544f39018f ("dt-bindings: Add vendor prefix for Amarula Solutions")
>
> from the rockchip tree, commit:
>
>   912620c02c31 ("dt-bindings: add vendor prefix for Touchless Biometric Systems AG")
>
> from the sunxi tree and commit:
>
>   e6262a54124d ("dt-bindings: vendor-prefixes: align indentation of company names`")
> (this is going to be fun :-()

I've dropped it. Was going to send for rc2, but I guess that's not
going to be early enough. I'll plan to do it just before rc1 next
cycle (or get distracted and forget about it).

Rob
