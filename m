From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: linux-next: build warnings after merge of the crypto tree
Date: Mon, 6 Feb 2017 11:15:38 +0100
Message-ID: <7bb7f79a-dcf0-3912-ab31-031378828f4e@atmel.com>
References: <20170206122837.0226fb89@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtpout.microchip.com ([198.175.253.82]:34582 "EHLO
        email.microchip.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750950AbdBFKPl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Feb 2017 05:15:41 -0500
In-Reply-To: <20170206122837.0226fb89@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi all,

Le 06/02/2017 à 02:28, Stephen Rothwell a écrit :
> Hi Herbert,
> 
> After merging the crypto tree, today's linux-next build (x86_64
> allmodconfig) produced these warnings:
> 
> warning: (CRYPTO_DEV_ATMEL_AUTHENC) selects CRYPTO_DEV_ATMEL_SHA which has unmet direct dependencies (CRYPTO && CRYPTO_HW && ARCH_AT91)
> warning: (CRYPTO_DEV_ATMEL_AUTHENC) selects CRYPTO_DEV_ATMEL_SHA which has unmet direct dependencies (CRYPTO && CRYPTO_HW && ARCH_AT91)
> 
> Introduced by commit
> 
>   89a82ef87e01 ("crypto: atmel-authenc - add support to authenc(hmac(shaX), Y(aes)) modes")
> 
> In file included from include/linux/printk.h:329:0,
>                  from include/linux/kernel.h:13,
>                  from drivers/crypto/atmel-sha.c:17:
> drivers/crypto/atmel-sha.c: In function 'atmel_sha_xmit_cpu':
> drivers/crypto/atmel-sha.c:571:19: warning: format '%d' expects argument of type 'int', but argument 6 has type 'size_t {aka long unsigned int}' [-Wformat=]
>   dev_dbg(dd->dev, "xmit_cpu: digcnt: 0x%llx 0x%llx, length: %d, final: %d\n",
>                    ^
> include/linux/dynamic_debug.h:134:39: note: in definition of macro 'dynamic_dev_dbg'
>    __dynamic_dev_dbg(&descriptor, dev, fmt, \
>                                        ^
> drivers/crypto/atmel-sha.c:571:2: note: in expansion of macro 'dev_dbg'
>   dev_dbg(dd->dev, "xmit_cpu: digcnt: 0x%llx 0x%llx, length: %d, final: %d\n",
>   ^
> drivers/crypto/atmel-sha.c: In function 'atmel_sha_xmit_pdc':
> drivers/crypto/atmel-sha.c:600:19: warning: format '%d' expects argument of type 'int', but argument 6 has type 'size_t {aka long unsigned int}' [-Wformat=]
>   dev_dbg(dd->dev, "xmit_pdc: digcnt: 0x%llx 0x%llx, length: %d, final: %d\n",
>                    ^
> include/linux/dynamic_debug.h:134:39: note: in definition of macro 'dynamic_dev_dbg'
>    __dynamic_dev_dbg(&descriptor, dev, fmt, \
>                                        ^
> drivers/crypto/atmel-sha.c:600:2: note: in expansion of macro 'dev_dbg'
>   dev_dbg(dd->dev, "xmit_pdc: digcnt: 0x%llx 0x%llx, length: %d, final: %d\n",
>   ^
> drivers/crypto/atmel-sha.c: In function 'atmel_sha_xmit_dma':
> drivers/crypto/atmel-sha.c:647:19: warning: format '%d' expects argument of type 'int', but argument 6 has type 'size_t {aka long unsigned int}' [-Wformat=]
>   dev_dbg(dd->dev, "xmit_dma: digcnt: 0x%llx 0x%llx, length: %d, final: %d\n",
>                    ^
> include/linux/dynamic_debug.h:134:39: note: in definition of macro 'dynamic_dev_dbg'
>    __dynamic_dev_dbg(&descriptor, dev, fmt, \
>                                        ^
> drivers/crypto/atmel-sha.c:647:2: note: in expansion of macro 'dev_dbg'
>   dev_dbg(dd->dev, "xmit_dma: digcnt: 0x%llx 0x%llx, length: %d, final: %d\n",
>   ^
> drivers/crypto/atmel-sha.c: In function 'atmel_sha_xmit_dma_map':
> drivers/crypto/atmel-sha.c:726:20: warning: format '%u' expects argument of type 'unsigned int', but argument 3 has type 'size_t {aka long unsigned int}' [-Wformat=]
>    dev_err(dd->dev, "dma %u bytes error\n", ctx->buflen +
>                     ^
> In file included from include/linux/printk.h:329:0,
>                  from include/linux/kernel.h:13,
>                  from drivers/crypto/atmel-sha.c:17:
> drivers/crypto/atmel-sha.c: In function 'atmel_sha_update_dma_slow':
> drivers/crypto/atmel-sha.c:747:19: warning: format '%u' expects argument of type 'unsigned int', but argument 4 has type 'size_t {aka long unsigned int}' [-Wformat=]
>   dev_dbg(dd->dev, "slow: bufcnt: %u, digcnt: 0x%llx 0x%llx, final: %d\n",
>                    ^
> include/linux/dynamic_debug.h:134:39: note: in definition of macro 'dynamic_dev_dbg'
>    __dynamic_dev_dbg(&descriptor, dev, fmt, \
>                                        ^
> drivers/crypto/atmel-sha.c:747:2: note: in expansion of macro 'dev_dbg'
>   dev_dbg(dd->dev, "slow: bufcnt: %u, digcnt: 0x%llx 0x%llx, final: %d\n",
>   ^
> drivers/crypto/atmel-sha.c: In function 'atmel_sha_update_dma_start':
> drivers/crypto/atmel-sha.c:775:19: warning: format '%u' expects argument of type 'unsigned int', but argument 6 has type 'size_t {aka long unsigned int}' [-Wformat=]
>   dev_dbg(dd->dev, "fast: digcnt: 0x%llx 0x%llx, bufcnt: %u, total: %u\n",
>                    ^
> include/linux/dynamic_debug.h:134:39: note: in definition of macro 'dynamic_dev_dbg'
>    __dynamic_dev_dbg(&descriptor, dev, fmt, \
>                                        ^
> drivers/crypto/atmel-sha.c:775:2: note: in expansion of macro 'dev_dbg'
>   dev_dbg(dd->dev, "fast: digcnt: 0x%llx 0x%llx, bufcnt: %u, total: %u\n",
>   ^
> drivers/crypto/atmel-sha.c:817:21: warning: format '%u' expects argument of type 'unsigned int', but argument 3 has type 'size_t {aka long unsigned int}' [-Wformat=]
>     dev_err(dd->dev, "dma %u bytes error\n",
>                      ^
> In file included from include/linux/printk.h:329:0,
>                  from include/linux/kernel.h:13,
>                  from drivers/crypto/atmel-sha.c:17:
> drivers/crypto/atmel-sha.c: In function 'atmel_sha_finish':
> drivers/crypto/atmel-sha.c:997:19: warning: format '%d' expects argument of type 'int', but argument 6 has type 'size_t {aka long unsigned int}' [-Wformat=]
>   dev_dbg(dd->dev, "digcnt: 0x%llx 0x%llx, bufcnt: %d\n", ctx->digcnt[1],
>                    ^
> include/linux/dynamic_debug.h:134:39: note: in definition of macro 'dynamic_dev_dbg'
>    __dynamic_dev_dbg(&descriptor, dev, fmt, \
>                                        ^
> drivers/crypto/atmel-sha.c:997:2: note: in expansion of macro 'dev_dbg'
>   dev_dbg(dd->dev, "digcnt: 0x%llx 0x%llx, bufcnt: %d\n", ctx->digcnt[1],
>   ^
> 
> I am not sure what caused this, but it may be that this code has not
> been built for this platform before?
> 


Indeed, the drivers/crypto/atmel-sha.c driver has never been built for x86_64.

CRYPTO_DEV_ATMEL_AUTHENC must select both CRYPTO_DEV_ATMEL_AES and
CRYPTO_DEV_ATMEL_SHA. I thought I could add a dependency to COMPILE_TEST
for CRYPTO_DEV_ATMEL_AUTHENC since CRYPTO_DEV_ATMEL_AES already had such a
dependency, hence could be compiled on architectures other than AT91 but I
didn't check the same for CRYPTO_DEV_ATMEL_SHA.

So maybe the easiest solution could be to remove the COMPILE_TEST
dependency on CRYPTO_DEV_ATMEL_AUTHENC for now, then I could try to fix all
these dev_dbg() format strings to make them become cross-platform compliant.

Herbert, if you think this solution is suitable I can prepare a first patch
to remove the COMPILE_TEST dependency on CRYPTO_DEV_ATMEL_AUTHENC.

Best regards,

Cyrille
