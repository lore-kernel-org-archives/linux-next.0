From: Stephan Mueller <smueller@chronox.de>
Subject: [PATCH 6/6] DRBG: HMAC-SHA1 DRBG has crypto strength of 128 bits
Date: Sun, 06 Jul 2014 02:26:37 +0200
Message-ID: <2038501.NQxD5ZZc1H@myon.chronox.de>
References: <2266932.bfVPMOTOeI@myon.chronox.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.eperm.de ([89.247.134.16]:53333 "EHLO mail.eperm.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750818AbaGFAfT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 5 Jul 2014 20:35:19 -0400
Received: from myon.chronox.de
	by mail.eperm.de with [XMail 1.27 ESMTP Server]
	id <S24F> for <linux-next@vger.kernel.org> from <smueller@chronox.de>;
	Sun, 6 Jul 2014 02:34:28 +0200
In-Reply-To: <2266932.bfVPMOTOeI@myon.chronox.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: herbert@gondor.apana.org.au
Cc: joe@perches.com, dan.carpenter@oracle.com, Stephen Rothwell <sfr@canb.auug.org.au>, fengguang.wu@intel.com, Randy Dunlap <rdunlap@infradead.org>, linux-crypto@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rafael Aquini <aquini@redhat.com>, aris@redhat.com

The patch corrects the security strength of the HMAC-SHA1 DRBG to 128
bits. This strength defines the size of the seed required for the DRBG.
Thus, the patch lowers the seeding requirement from 256 bits to 128 bits
for HMAC-SHA1.

Signed-off-by: Stephan Mueller <smueller@chronox.de>
---
 crypto/drbg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/drbg.c b/crypto/drbg.c
index a76b3cb..84478cb 100644
--- a/crypto/drbg.c
+++ b/crypto/drbg.c
@@ -184,7 +184,7 @@ static const struct drbg_core drbg_cores[] = {
 #endif /* CONFIG_CRYPTO_DRBG_HASH */
 #ifdef CONFIG_CRYPTO_DRBG_HMAC
 	{
-		.flags = DRBG_HMAC | DRBG_STRENGTH256,
+		.flags = DRBG_HMAC | DRBG_STRENGTH128,
 		.statelen = 20, /* block length of cipher */
 		.max_addtllen = 35,
 		.max_bits = 19,
-- 
1.9.3
