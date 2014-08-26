From: Stephan Mueller <smueller@chronox.de>
Subject: [PATCH v2] DRBG: fix maximum value checks on 32 bit systems
Date: Tue, 26 Aug 2014 10:29:45 +0200
Message-ID: <2984929.nIbTCa5fhe@myon.chronox.de>
References: <20140826161456.7ad100e3@canb.auug.org.au> <1998203.8HHRdZPLvI@myon.chronox.de> <20140826080858.GA4161@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140826080858.GA4161@gondor.apana.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

The maximum values for additional input string or generated blocks is
larger than 1<<32. To ensure a sensible value on 32 bit systems, return
SIZE_MAX on 32 bit systems. This value is lower than the maximum
allowed values defined in SP800-90A. The standard allow lower maximum
values, but not larger values.

SIZE_MAX - 1 is used for drbg_max_addtl to allow
drbg_healthcheck_sanity to check the enforcement of the variable
without wrapping.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Stephan Mueller <smueller@chronox.de>
---
 include/crypto/drbg.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/crypto/drbg.h b/include/crypto/drbg.h
index 3d8e73a..5186f75 100644
--- a/include/crypto/drbg.h
+++ b/include/crypto/drbg.h
@@ -154,13 +154,26 @@ static inline size_t drbg_max_request_bytes(struct drbg_state *drbg)
 static inline size_t drbg_max_addtl(struct drbg_state *drbg)
 {
 	/* SP800-90A requires 2**35 bytes additional info str / pers str */
+#if (__BITS_PER_LONG == 32)
+	/*
+	 * SP800-90A allows smaller maximum numbers to be returned -- we
+	 * return SIZE_MAX - 1 to allow the verification of the enforcement
+	 * of this value in drbg_healthcheck_sanity.
+	 */
+	return (SIZE_MAX - 1);
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
