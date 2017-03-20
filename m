From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the akpm-current tree
Date: Mon, 20 Mar 2017 16:22:26 +1100
Message-ID: <20170320162226.47c6e3ed@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50715 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751485AbdCTFW3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Mar 2017 01:22:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mahipal Challa <Mahipal.Challa@cavium.com>, Jan Glauber <jglauber@cavium.com>, Dmitry Vyukov <dvyukov@google.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

drivers/crypto/cavium/zip/zip_main.c: In function 'zip_show_stats':
drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'long long int' [-Wformat=]
    seq_printf(s, "        ZIP Device %d Stats\n"
                  ^
drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'long long int' [-Wformat=]
drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expects argument of type 'long int', but argument 6 has type 'long long int' [-Wformat=]
drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expects argument of type 'long int', but argument 7 has type 'long long int' [-Wformat=]
drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expects argument of type 'long int', but argument 10 has type 'long long int' [-Wformat=]
drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expects argument of type 'long int', but argument 11 has type 'long long int' [-Wformat=]
drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expects argument of type 'long int', but argument 12 has type 'long long int' [-Wformat=]
drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expects argument of type 'long int', but argument 13 has type 'long long int' [-Wformat=]
drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expects argument of type 'long int', but argument 14 has type 'long long int' [-Wformat=]
drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expects argument of type 'long int', but argument 15 has type 'long long int' [-Wformat=]

Introduced by commit

  09ae5d37e093 ("crypto: zip - Add Compression/Decompression statistics")

from the crypto tree interacting with commit

  3f4ca3d25e1a ("asm-generic, x86: wrap atomic operations")

from the akpm-current tree.

This latter commit changed atomic64read() from "long" to "long long"
on x86_64.

-- 
Cheers,
Stephen Rothwell
