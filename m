From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the crypto tree
Date: Fri, 24 Jun 2016 16:20:22 +1000
Message-ID: <20160624162022.0f9c265a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41471 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750891AbcFXGUZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 24 Jun 2016 02:20:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Salvatore Benedetto <salvatore.benedetto@intel.com>

Hi Herbert,

After merging the crypto tree, today's linux-next build (powerpc
allyesconfig) failed like this:

net/built-in.o: In function `.ecdh_shared_secret':
(.text+0x4ad8d0): multiple definition of `.ecdh_shared_secret'
crypto/built-in.o:(.text+0x113f0): first defined here
net/built-in.o:(.opd+0x430e0): multiple definition of `ecdh_shared_secret'
crypto/built-in.o:(.opd+0x1d40): first defined here

Caused by commit

  3c4b23901a0c ("crypto: ecdh - Add ECDH software support")

The other definition is in net/bluetooth/ecc.c

I added the following patch for today (probably a better name could
be chosen):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 24 Jun 2016 16:13:37 +1000
Subject: [PATCH] crypto: make ecdh_shared_secret unique

There is another ecdh_shared_secret in net/bluetooth/ecc.c

Fixes: 3c4b23901a0c ("crypto: ecdh - Add ECDH software support")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 crypto/ecc.c  | 2 +-
 crypto/ecc.h  | 6 +++---
 crypto/ecdh.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/crypto/ecc.c b/crypto/ecc.c
index 9aedec6bbe72..414c78a9c214 100644
--- a/crypto/ecc.c
+++ b/crypto/ecc.c
@@ -966,7 +966,7 @@ out:
 	return ret;
 }
 
-int ecdh_shared_secret(unsigned int curve_id, unsigned int ndigits,
+int crypto_ecdh_shared_secret(unsigned int curve_id, unsigned int ndigits,
 		       const u8 *private_key, unsigned int private_key_len,
 		       const u8 *public_key, unsigned int public_key_len,
 		       u8 *secret, unsigned int secret_len)
diff --git a/crypto/ecc.h b/crypto/ecc.h
index b5db4b989f3c..663d598c7406 100644
--- a/crypto/ecc.h
+++ b/crypto/ecc.h
@@ -60,7 +60,7 @@ int ecdh_make_pub_key(const unsigned int curve_id, unsigned int ndigits,
 		      u8 *public_key, unsigned int public_key_len);
 
 /**
- * ecdh_shared_secret() - Compute a shared secret
+ * crypto_ecdh_shared_secret() - Compute a shared secret
  *
  * @curve_id:		id representing the curve to use
  * @private_key:	private key of part A
@@ -70,13 +70,13 @@ int ecdh_make_pub_key(const unsigned int curve_id, unsigned int ndigits,
  * @secret:		buffer for storing the calculated shared secret
  * @secret_len:		length of the secret buffer
  *
- * Note: It is recommended that you hash the result of ecdh_shared_secret
+ * Note: It is recommended that you hash the result of crypto_ecdh_shared_secret
  * before using it for symmetric encryption or HMAC.
  *
  * Returns 0 if the shared secret was generated successfully, a negative value
  * if an error occurred.
  */
-int ecdh_shared_secret(unsigned int curve_id, unsigned int ndigits,
+int crypto_ecdh_shared_secret(unsigned int curve_id, unsigned int ndigits,
 		       const u8 *private_key, unsigned int private_key_len,
 		       const u8 *public_key, unsigned int public_key_len,
 		       u8 *secret, unsigned int secret_len);
diff --git a/crypto/ecdh.c b/crypto/ecdh.c
index d3a9eeca4b32..3de289806d67 100644
--- a/crypto/ecdh.c
+++ b/crypto/ecdh.c
@@ -79,7 +79,7 @@ static int ecdh_compute_value(struct kpp_request *req)
 		if (copied != 2 * nbytes)
 			return -EINVAL;
 
-		ret = ecdh_shared_secret(ctx->curve_id, ctx->ndigits,
+		ret = crypto_ecdh_shared_secret(ctx->curve_id, ctx->ndigits,
 					 (const u8 *)ctx->private_key, nbytes,
 					 (const u8 *)ctx->public_key, 2 * nbytes,
 					 (u8 *)ctx->shared_secret, nbytes);
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
