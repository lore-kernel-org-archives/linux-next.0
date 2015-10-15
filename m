From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: build failure after merge of the crypto tree
Date: Thu, 15 Oct 2015 10:01:15 +0800
Message-ID: <20151015020115.GB22342@gondor.apana.org.au>
References: <20151015123700.6e5f3474@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from helcar.hengli.com.au ([209.40.204.226]:59420 "EHLO
	helcar.hengli.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752698AbbJOCBT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 Oct 2015 22:01:19 -0400
Content-Disposition: inline
In-Reply-To: <20151015123700.6e5f3474@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>

On Thu, Oct 15, 2015 at 12:37:00PM +1100, Stephen Rothwell wrote:
> Hi Herbert,
> 
> After merging the crypto tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/char/hw_random/stm32-rng.c: In function 'stm32_rng_runtime_suspend':
> drivers/char/hw_random/stm32-rng.c:163:51: error: 'pdev' undeclared (first use in this function)
>   struct stm32_rng_private *priv = dev_get_drvdata(pdev);
>                                                    ^
> drivers/char/hw_random/stm32-rng.c:163:51: note: each undeclared identifier is reported only once for each function it appears in
> drivers/char/hw_random/stm32-rng.c: In function 'stm32_rng_runtime_resume':
> drivers/char/hw_random/stm32-rng.c:172:51: error: 'pdev' undeclared (first use in this function)
>   struct stm32_rng_private *priv = dev_get_drvdata(pdev);
>                                                    ^
> 
> Caused by commit
> 
>   c6a97c42e399 ("Add support for STMicroelectronics STM32 random number generator.")
> 
> I have used the crypto tree from next-20151013 for today.

Thanks Stephen!  I've just pushed out a fix for this.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
