From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the crypto tree
Date: Mon, 6 Feb 2017 12:28:37 +1100
Message-ID: <20170206122837.0226fb89@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59631 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751710AbdBFB2l (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 5 Feb 2017 20:28:41 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>

Hi Herbert,

After merging the crypto tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

warning: (CRYPTO_DEV_ATMEL_AUTHENC) selects CRYPTO_DEV_ATMEL_SHA which has unmet direct dependencies (CRYPTO && CRYPTO_HW && ARCH_AT91)
warning: (CRYPTO_DEV_ATMEL_AUTHENC) selects CRYPTO_DEV_ATMEL_SHA which has unmet direct dependencies (CRYPTO && CRYPTO_HW && ARCH_AT91)

Introduced by commit

  89a82ef87e01 ("crypto: atmel-authenc - add support to authenc(hmac(shaX), Y(aes)) modes")

In file included from include/linux/printk.h:329:0,
                 from include/linux/kernel.h:13,
                 from drivers/crypto/atmel-sha.c:17:
drivers/crypto/atmel-sha.c: In function 'atmel_sha_xmit_cpu':
drivers/crypto/atmel-sha.c:571:19: warning: format '%d' expects argument of type 'int', but argument 6 has type 'size_t {aka long unsigned int}' [-Wformat=]
  dev_dbg(dd->dev, "xmit_cpu: digcnt: 0x%llx 0x%llx, length: %d, final: %d\n",
                   ^
include/linux/dynamic_debug.h:134:39: note: in definition of macro 'dynamic_dev_dbg'
   __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                       ^
drivers/crypto/atmel-sha.c:571:2: note: in expansion of macro 'dev_dbg'
  dev_dbg(dd->dev, "xmit_cpu: digcnt: 0x%llx 0x%llx, length: %d, final: %d\n",
  ^
drivers/crypto/atmel-sha.c: In function 'atmel_sha_xmit_pdc':
drivers/crypto/atmel-sha.c:600:19: warning: format '%d' expects argument of type 'int', but argument 6 has type 'size_t {aka long unsigned int}' [-Wformat=]
  dev_dbg(dd->dev, "xmit_pdc: digcnt: 0x%llx 0x%llx, length: %d, final: %d\n",
                   ^
include/linux/dynamic_debug.h:134:39: note: in definition of macro 'dynamic_dev_dbg'
   __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                       ^
drivers/crypto/atmel-sha.c:600:2: note: in expansion of macro 'dev_dbg'
  dev_dbg(dd->dev, "xmit_pdc: digcnt: 0x%llx 0x%llx, length: %d, final: %d\n",
  ^
drivers/crypto/atmel-sha.c: In function 'atmel_sha_xmit_dma':
drivers/crypto/atmel-sha.c:647:19: warning: format '%d' expects argument of type 'int', but argument 6 has type 'size_t {aka long unsigned int}' [-Wformat=]
  dev_dbg(dd->dev, "xmit_dma: digcnt: 0x%llx 0x%llx, length: %d, final: %d\n",
                   ^
include/linux/dynamic_debug.h:134:39: note: in definition of macro 'dynamic_dev_dbg'
   __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                       ^
drivers/crypto/atmel-sha.c:647:2: note: in expansion of macro 'dev_dbg'
  dev_dbg(dd->dev, "xmit_dma: digcnt: 0x%llx 0x%llx, length: %d, final: %d\n",
  ^
drivers/crypto/atmel-sha.c: In function 'atmel_sha_xmit_dma_map':
drivers/crypto/atmel-sha.c:726:20: warning: format '%u' expects argument of type 'unsigned int', but argument 3 has type 'size_t {aka long unsigned int}' [-Wformat=]
   dev_err(dd->dev, "dma %u bytes error\n", ctx->buflen +
                    ^
In file included from include/linux/printk.h:329:0,
                 from include/linux/kernel.h:13,
                 from drivers/crypto/atmel-sha.c:17:
drivers/crypto/atmel-sha.c: In function 'atmel_sha_update_dma_slow':
drivers/crypto/atmel-sha.c:747:19: warning: format '%u' expects argument of type 'unsigned int', but argument 4 has type 'size_t {aka long unsigned int}' [-Wformat=]
  dev_dbg(dd->dev, "slow: bufcnt: %u, digcnt: 0x%llx 0x%llx, final: %d\n",
                   ^
include/linux/dynamic_debug.h:134:39: note: in definition of macro 'dynamic_dev_dbg'
   __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                       ^
drivers/crypto/atmel-sha.c:747:2: note: in expansion of macro 'dev_dbg'
  dev_dbg(dd->dev, "slow: bufcnt: %u, digcnt: 0x%llx 0x%llx, final: %d\n",
  ^
drivers/crypto/atmel-sha.c: In function 'atmel_sha_update_dma_start':
drivers/crypto/atmel-sha.c:775:19: warning: format '%u' expects argument of type 'unsigned int', but argument 6 has type 'size_t {aka long unsigned int}' [-Wformat=]
  dev_dbg(dd->dev, "fast: digcnt: 0x%llx 0x%llx, bufcnt: %u, total: %u\n",
                   ^
include/linux/dynamic_debug.h:134:39: note: in definition of macro 'dynamic_dev_dbg'
   __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                       ^
drivers/crypto/atmel-sha.c:775:2: note: in expansion of macro 'dev_dbg'
  dev_dbg(dd->dev, "fast: digcnt: 0x%llx 0x%llx, bufcnt: %u, total: %u\n",
  ^
drivers/crypto/atmel-sha.c:817:21: warning: format '%u' expects argument of type 'unsigned int', but argument 3 has type 'size_t {aka long unsigned int}' [-Wformat=]
    dev_err(dd->dev, "dma %u bytes error\n",
                     ^
In file included from include/linux/printk.h:329:0,
                 from include/linux/kernel.h:13,
                 from drivers/crypto/atmel-sha.c:17:
drivers/crypto/atmel-sha.c: In function 'atmel_sha_finish':
drivers/crypto/atmel-sha.c:997:19: warning: format '%d' expects argument of type 'int', but argument 6 has type 'size_t {aka long unsigned int}' [-Wformat=]
  dev_dbg(dd->dev, "digcnt: 0x%llx 0x%llx, bufcnt: %d\n", ctx->digcnt[1],
                   ^
include/linux/dynamic_debug.h:134:39: note: in definition of macro 'dynamic_dev_dbg'
   __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                       ^
drivers/crypto/atmel-sha.c:997:2: note: in expansion of macro 'dev_dbg'
  dev_dbg(dd->dev, "digcnt: 0x%llx 0x%llx, bufcnt: %d\n", ctx->digcnt[1],
  ^

I am not sure what caused this, but it may be that this code has not
been built for this platform before?

-- 
Cheers,
Stephen Rothwell
