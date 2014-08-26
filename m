From: Stephan Mueller <smueller@chronox.de>
Subject: [PATCH] DRBG: fix maximum value checks on 32 bit systems
Date: Tue, 26 Aug 2014 10:06:52 +0200
Message-ID: <1998203.8HHRdZPLvI@myon.chronox.de>
References: <20140826161456.7ad100e3@canb.auug.org.au> <6371777.WdUEAKFPYo@myon.chronox.de> <20140826073219.GA3880@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.eperm.de ([89.247.134.16]:46918 "EHLO mail.eperm.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753960AbaHZIHE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Aug 2014 04:07:04 -0400
Received: from myon.chronox.de
	by mail.eperm.de with [XMail 1.27 ESMTP Server]
	id <S32B> for <linux-next@vger.kernel.org> from <smueller@chronox.de>;
	Tue, 26 Aug 2014 10:06:53 +0200
In-Reply-To: <20140826073219.GA3880@gondor.apana.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

The maximum values for additional input string or generated blocks is
larger than 1<<32. To ensure a sensible value on 32 bit systems, return
SIZE_MAX on 32 bit systems. This value is lower than the maximum allowed
values defined in SP800-90A. The standard allow lower maximum values,
but not larger values.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Stephan Mueller <smueller@chronox.de>
---
 include/crypto/drbg.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/crypto/drbg.h b/include/crypto/drbg.h
index 3d8e73a..5ac482a 100644
--- a/include/crypto/drbg.h
+++ b/include/crypto/drbg.h
@@ -154,13 +154,21 @@ static inline size_t drbg_max_request_bytes(struct drbg_state *drbg)
 static inline size_t drbg_max_addtl(struct drbg_state *drbg)
 {
 	/* SP800-90A requires 2**35 bytes additional info str / pers str */
+#if (__BITS_PER_LONG == 32)
+	return SIZE_MAX;
+#else
 	return (1UL<<35);
+#endif
 }
 
 static inline size_t drbg_max_requests(struct drbg_state *drbg)
 {
 	/* SP800-90A requires 2**48 maximum requests before reseeding */
+#if (__BITS_PER_LONG == 32)
+	return SIZE_MAX;
+#else
 	return (1UL<<48);
+#endif
 }
 
 /*
-- 
1.9.3
