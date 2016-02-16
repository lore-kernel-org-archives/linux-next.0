From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the gpio tree with the pinctrl tree
Date: Tue, 16 Feb 2016 21:16:27 +1100
Message-ID: <20160216211627.3a8dc62d@canb.auug.org.au>
References: <20160216143728.61372efa@canb.auug.org.au>
	<CAMuHMdW2CVgzX0vvjdrLq4bFwcUvJto_a6JPfXP_NG=VGDoqjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54787 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754592AbcBPKQ3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Feb 2016 05:16:29 -0500
In-Reply-To: <CAMuHMdW2CVgzX0vvjdrLq4bFwcUvJto_a6JPfXP_NG=VGDoqjw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Krzysztof Adamski <krzysztof.adamski@tieto.com>

Hi Geert,

On Tue, 16 Feb 2016 09:23:48 +0100 Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> That resolution looks correct to me, but doesn't match your end result
> in next-20160216:
> 
>         u32 set_mux = pctl->desc->irq_read_needs_mux &&
>                         test_bit(FLAG_USED_AS_IRQ, &chip->desc[offset].flags);
>         u32 pin = offset + chip->base;
> 
> I think the end result should be:
> 
>         bool set_mux = pctl->desc->irq_read_needs_mux &&
>                 gpiochip_line_is_irq(chip, offset);
>         u32 pin = offset + chip->base;

Yeah, that's because the resulting tree failed to build so I undid the
merge and merged yesterday's version of the gpio tree.

-- 
Cheers,
Stephen Rothwell
