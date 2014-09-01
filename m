From: Stephan Mueller <smueller@chronox.de>
Subject: [PATCH v2] DRBG: remove check for uninitialized DRBG handle
Date: Mon, 01 Sep 2014 07:11:20 +0200
Message-ID: <1461606.SUPpCYm782@myon.chronox.de>
References: <20140826161456.7ad100e3@canb.auug.org.au> <20140827133528.GA15871@gondor.apana.org.au> <2837552.tiNKQxI8Xu@myon.chronox.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.eperm.de ([89.247.134.16]:46995 "EHLO mail.eperm.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750865AbaIAFLZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Sep 2014 01:11:25 -0400
Received: from myon.chronox.de
	by mail.eperm.de with [XMail 1.27 ESMTP Server]
	id <S373> for <linux-next@vger.kernel.org> from <smueller@chronox.de>;
	Mon, 1 Sep 2014 07:11:21 +0200
In-Reply-To: <2837552.tiNKQxI8Xu@myon.chronox.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

The drbg_healthcheck() contained a test to call the DRBG with an
uninitialized DRBG cipher handle. As this is an inappropriate use of the
kernel crypto API to try to generate random numbers before
initialization, checks verifying for an initialized DRBG have been
removed in previous patches.

Now, the drbg_healthcheck test must also be removed.

Changes V2: Added patch marker to email subject line.

Signed-off-by: Stephan Mueller <smueller@chronox.de>
---
 crypto/drbg.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/crypto/drbg.c b/crypto/drbg.c
index 39ed918..54cfd48 100644
--- a/crypto/drbg.c
+++ b/crypto/drbg.c
@@ -1872,9 +1872,6 @@ static inline int __init drbg_healthcheck_sanity(void)
 	/* overflow max addtllen with personalization string */
 	ret = drbg_instantiate(drbg, &addtl, coreref, pr);
 	BUG_ON(0 == ret);
-	/* test uninstantated DRBG */
-	len = drbg_generate(drbg, buf, (max_request_bytes + 1), NULL);
-	BUG_ON(0 < len);
 	/* all tests passed */
 	rc = 0;
 
-- 
1.9.3
