From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [BISECT] ARM build errors on GCC v6.2 (crypto: arm/aes - replace
 scalar AES cipher)
Date: Sat, 14 Jan 2017 20:52:15 +0200
Message-ID: <20170114185215.db7av7u2wujy764n@kozik-lap>
References: <20170114142435.ashdj2xm5b3kzg2p@kozik-lap>
 <20170114182011.GX14217@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34710 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751381AbdANSwX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 14 Jan 2017 13:52:23 -0500
Content-Disposition: inline
In-Reply-To: <20170114182011.GX14217@n2100.armlinux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-next@vger.kernel.org, davem@davemloft.net, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On Sat, Jan 14, 2017 at 06:20:12PM +0000, Russell King - ARM Linux wrote:
> On Sat, Jan 14, 2017 at 04:24:35PM +0200, Krzysztof Kozlowski wrote:
> > Hi,
> > 
> > allyesconfig and multi_v7_defconfig fail to build on recent linux-next
> > on GCC 6.2.0.
> > 
> > Errors:
> > ../arch/arm/crypto/aes-cipher-core.S: Assembler messages:
> > ../arch/arm/crypto/aes-cipher-core.S:21: Error: selected processor does not support `tt .req ip' in ARM mode
> > ../arch/arm/crypto/aes-cipher-core.S:174: Error: ARM register expected -- `movw tt,#:lower16:crypto_ft_tab'
> > ../arch/arm/crypto/aes-cipher-core.S:174: Error: ARM register expected -- `movt tt,#:upper16:crypto_ft_tab'
> > 
> > Compiler: arm-linux-gnueabi-gcc (Ubuntu 6.2.0-5ubuntu12) 6.2.0 20161005
> 
> It's worth pointing out that _assembler_ messages come from _binutils_
> rather than _gcc_.   Please advise which version of _binutils_ you
> are using.  Thanks.

Ah, yes, so the binutils 2.27 (Ubuntu package: 2.27-8ubuntu2).

However Ard mentioned that this is already fixed.

Best regards,
Krzysztof
