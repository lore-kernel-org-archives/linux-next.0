From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the crypto tree
Date: Thu, 15 Oct 2015 12:37:00 +1100
Message-ID: <20151015123700.6e5f3474@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-next.vger.kernel.org

Hi Herbert,

After merging the crypto tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/char/hw_random/stm32-rng.c: In function 'stm32_rng_runtime_suspend':
drivers/char/hw_random/stm32-rng.c:163:51: error: 'pdev' undeclared (first use in this function)
  struct stm32_rng_private *priv = dev_get_drvdata(pdev);
                                                   ^
drivers/char/hw_random/stm32-rng.c:163:51: note: each undeclared identifier is reported only once for each function it appears in
drivers/char/hw_random/stm32-rng.c: In function 'stm32_rng_runtime_resume':
drivers/char/hw_random/stm32-rng.c:172:51: error: 'pdev' undeclared (first use in this function)
  struct stm32_rng_private *priv = dev_get_drvdata(pdev);
                                                   ^

Caused by commit

  c6a97c42e399 ("Add support for STMicroelectronics STM32 random number generator.")

I have used the crypto tree from next-20151013 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
