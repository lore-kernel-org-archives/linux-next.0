From: Stephan Mueller <smueller@chronox.de>
Subject: [PATCH] DRBG: fix bit shifting on 32 bit systems
Date: Tue, 26 Aug 2014 09:31:02 +0200
Message-ID: <6371777.WdUEAKFPYo@myon.chronox.de>
References: <20140826161456.7ad100e3@canb.auug.org.au> <20140826063812.GA3555@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140826063812.GA3555@gondor.apana.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Use ULL to mark a 64 bit value.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Stephan Mueller <smueller@chronox.de>
---
 include/crypto/drbg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/crypto/drbg.h b/include/crypto/drbg.h
index 3d8e73a..dd52aee 100644
--- a/include/crypto/drbg.h
+++ b/include/crypto/drbg.h
@@ -154,13 +154,13 @@ static inline size_t drbg_max_request_bytes(struct drbg_state *drbg)
 static inline size_t drbg_max_addtl(struct drbg_state *drbg)
 {
 	/* SP800-90A requires 2**35 bytes additional info str / pers str */
-	return (1UL<<35);
+	return (1ULL<<35);
 }
 
 static inline size_t drbg_max_requests(struct drbg_state *drbg)
 {
 	/* SP800-90A requires 2**48 maximum requests before reseeding */
-	return (1UL<<48);
+	return (1ULL<<48);
 }
 
 /*
-- 
1.9.3
