From: Jan Glauber <jang@linux.vnet.ibm.com>
Subject: Re: linux-next / s390 crypto breakage
Date: Wed, 02 Sep 2009 17:57:25 +0000
Message-ID: <1251914245.7382.6.camel@bender>
References: <20090902113526.GC4754@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate6.de.ibm.com ([195.212.17.166]:38347 "EHLO
	mtagate6.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752630AbZIBP7M (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Sep 2009 11:59:12 -0400
Received: from d12nrmr1607.megacenter.de.ibm.com (d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate6.de.ibm.com (8.13.1/8.13.1) with ESMTP id n82FxFv5007530
	for <linux-next@vger.kernel.org>; Wed, 2 Sep 2009 15:59:15 GMT
Received: from d12av02.megacenter.de.ibm.com (d12av02.megacenter.de.ibm.com [9.149.165.228])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id n82Fw9v21122466
	for <linux-next@vger.kernel.org>; Wed, 2 Sep 2009 17:58:26 +0200
Received: from d12av02.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av02.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id n82Fw9Ee010149
	for <linux-next@vger.kernel.org>; Wed, 2 Sep 2009 17:58:09 +0200
In-Reply-To: <20090902113526.GC4754@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-next@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>

That patch should fix the warnings.

--Jan

diff --git a/arch/s390/crypto/sha1_s390.c b/arch/s390/crypto/sha1_s390.c
index 4a94378..f6de782 100644
--- a/arch/s390/crypto/sha1_s390.c
+++ b/arch/s390/crypto/sha1_s390.c
@@ -57,10 +57,10 @@ static int sha1_export(struct shash_desc *desc, void *out)
 	return 0;
 }
 
-static int sha1_import(struct shash_desc *desc, const u8 *in)
+static int sha1_import(struct shash_desc *desc, const void *in)
 {
 	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
-	struct sha1_state *ictx = in;
+	const struct sha1_state *ictx = in;
 
 	sctx->count = ictx->count;
 	memcpy(sctx->state, ictx->state, sizeof(ictx->state));
diff --git a/arch/s390/crypto/sha256_s390.c b/arch/s390/crypto/sha256_s390.c
index 2bab519..61a7db3 100644
--- a/arch/s390/crypto/sha256_s390.c
+++ b/arch/s390/crypto/sha256_s390.c
@@ -53,10 +53,10 @@ static int sha256_export(struct shash_desc *desc, void *out)
 	return 0;
 }
 
-static int sha256_import(struct shash_desc *desc, const u8 *in)
+static int sha256_import(struct shash_desc *desc, const void *in)
 {
 	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
-	struct sha256_state *ictx = in;
+	const struct sha256_state *ictx = in;
 
 	sctx->count = ictx->count;
 	memcpy(sctx->state, ictx->state, sizeof(ictx->state));
diff --git a/arch/s390/crypto/sha512_s390.c b/arch/s390/crypto/sha512_s390.c
index b4b3438..4bf73d0 100644
--- a/arch/s390/crypto/sha512_s390.c
+++ b/arch/s390/crypto/sha512_s390.c
@@ -52,10 +52,10 @@ static int sha512_export(struct shash_desc *desc, void *out)
 	return 0;
 }
 
-static int sha512_import(struct shash_desc *desc, const u8 *in)
+static int sha512_import(struct shash_desc *desc, const void *in)
 {
 	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
-	struct sha512_state *ictx = in;
+	const struct sha512_state *ictx = in;
 
 	if (unlikely(ictx->count[1]))
 		return -ERANGE;


On Wed, 2009-09-02 at 13:35 +0200, Heiko Carstens wrote:
> Hi Herbert,
> 
> your patch "crypto: shash - Export/import hash state only" causes this
> on s390:
> 
>   CC      arch/s390/crypto/sha1_s390.o
> arch/s390/crypto/sha1_s390.c: In function 'sha1_import':
> arch/s390/crypto/sha1_s390.c:63: warning: initialization from incompatible pointer type
> arch/s390/crypto/sha1_s390.c: At top level:
> arch/s390/crypto/sha1_s390.c:78: warning: initialization from incompatible pointer type
>   CC      arch/s390/crypto/sha_common.o
>   CC      arch/s390/crypto/sha256_s390.o
> arch/s390/crypto/sha256_s390.c: In function 'sha256_import':
> arch/s390/crypto/sha256_s390.c:59: warning: initialization from incompatible pointer type
> arch/s390/crypto/sha256_s390.c: At top level:
> arch/s390/crypto/sha256_s390.c:74: warning: initialization from incompatible pointer type
>   CC      arch/s390/crypto/sha512_s390.o
> arch/s390/crypto/sha512_s390.c: In function 'sha512_import':
> arch/s390/crypto/sha512_s390.c:58: warning: initialization from incompatible pointer type
> arch/s390/crypto/sha512_s390.c: At top level:
> arch/s390/crypto/sha512_s390.c:76: warning: initialization from incompatible pointer type
> arch/s390/crypto/sha512_s390.c:115: warning: initialization from incompatible pointer type
> 
> Looks like you missed some conversions. Could you (or Jan?) fix this please?
> 
> Thanks!
