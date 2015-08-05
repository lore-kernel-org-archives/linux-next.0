From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the crypto tree
Date: Wed, 5 Aug 2015 16:49:31 +1000
Message-ID: <20150805164931.516fb8ee@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Herbert,

After merging the crypto tree, today's linux-next build (sparc64
defconfig) failed like this:

crypto/built-in.o: In function `crypto_authenc_exit_tfm':
authenc.c:(.text+0x11d1c): undefined reference to `crypto_put_default_null_skcipher'
crypto/built-in.o: In function `crypto_authenc_init_tfm':
authenc.c:(.text+0x11d7c): undefined reference to `crypto_get_default_null_skcipher'

Caused by commit

  92d95ba91772 ("crypto: authenc - Convert to new AEAD interface")

Those symbols depend on CONFIG_CRYPTO_NULL which is set to 'm' for
this build.

I have added this fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 5 Aug 2015 16:41:48 +1000
Subject: [PATCH] crypto: authenc - select CRYPTO_NULL

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 crypto/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/crypto/Kconfig b/crypto/Kconfig
index 354bb692c964..ac7cc6226e61 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -200,6 +200,7 @@ config CRYPTO_AUTHENC
 	select CRYPTO_BLKCIPHER
 	select CRYPTO_MANAGER
 	select CRYPTO_HASH
+	select CRYPTO_NULL
 	help
 	  Authenc: Combined mode wrapper for IPsec.
 	  This is required for IPSec.
-- 
2.5.0

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
