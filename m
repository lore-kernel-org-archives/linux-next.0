From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [BISECT] ARM build errors on GCC v6.2 (crypto: arm/aes - replace
 scalar AES cipher)
Date: Sat, 14 Jan 2017 15:21:50 +0000
Message-ID: <CAKv+Gu--rj53F9SFRbXLfs5UNa3UC++F2ZqS1AHipVWSF2wJoA@mail.gmail.com>
References: <20170114142435.ashdj2xm5b3kzg2p@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:36019 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750900AbdANPVw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 14 Jan 2017 10:21:52 -0500
Received: by mail-io0-f173.google.com with SMTP id j13so64290796iod.3
        for <linux-next@vger.kernel.org>; Sat, 14 Jan 2017 07:21:51 -0800 (PST)
In-Reply-To: <20170114142435.ashdj2xm5b3kzg2p@kozik-lap>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "David S. Miller" <davem@davemloft.net>, linux-next@vger.kernel.org

On 14 January 2017 at 14:24, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Hi,
>
> allyesconfig and multi_v7_defconfig fail to build on recent linux-next
> on GCC 6.2.0.
>
> Errors:
> ../arch/arm/crypto/aes-cipher-core.S: Assembler messages:
> ../arch/arm/crypto/aes-cipher-core.S:21: Error: selected processor does not support `tt .req ip' in ARM mode
> ../arch/arm/crypto/aes-cipher-core.S:174: Error: ARM register expected -- `movw tt,#:lower16:crypto_ft_tab'
> ../arch/arm/crypto/aes-cipher-core.S:174: Error: ARM register expected -- `movt tt,#:upper16:crypto_ft_tab'
>
> Compiler: arm-linux-gnueabi-gcc (Ubuntu 6.2.0-5ubuntu12) 6.2.0 20161005
>
> Git bisect pointed to:
> first bad commit: [81edb42629758bacdf813dd5e4542ae26e3ad73a] crypto: arm/aes - replace scalar AES cipher
>

Fixed in

https://git.kernel.org/cgit/linux/kernel/git/herbert/cryptodev-2.6.git/commit/?id=658fa754cd07

which should turn up in the next -next
