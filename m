From: Stephan Mueller <smueller@chronox.de>
Subject: [PATCH 4/6] DRBG: Select correct DRBG core for stdrng
Date: Sun, 06 Jul 2014 02:25:04 +0200
Message-ID: <1740666.9OhPDPl60Q@myon.chronox.de>
References: <2266932.bfVPMOTOeI@myon.chronox.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <2266932.bfVPMOTOeI@myon.chronox.de>
Sender: linux-crypto-owner@vger.kernel.org
To: herbert@gondor.apana.org.au
Cc: joe@perches.com, dan.carpenter@oracle.com, Stephen Rothwell <sfr@canb.auug.org.au>, fengguang.wu@intel.com, Randy Dunlap <rdunlap@infradead.org>, linux-crypto@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rafael Aquini <aquini@redhat.com>, aris@redhat.com
List-Id: linux-next.vger.kernel.org

When the DRBG is initialized, the core is looked up using the DRBG name.
The name that can be used for the lookup is registered in
cra_driver_name. The cra_name value contains stdrng.

Thus, the lookup code must use crypto_tfm_alg_driver_name to obtain the
precise DRBG name and select the correct DRBG.

Signed-off-by: Stephan Mueller <smueller@chronox.de>
---
 crypto/drbg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/drbg.c b/crypto/drbg.c
index dba5ed2..2a7860f 100644
--- a/crypto/drbg.c
+++ b/crypto/drbg.c
@@ -1761,7 +1761,7 @@ static int drbg_kcapi_init(struct crypto_tfm *tfm)
 	bool pr = false;
 	int coreref = 0;
 
-	drbg_convert_tfm_core(crypto_tfm_alg_name(tfm), &coreref, &pr);
+	drbg_convert_tfm_core(crypto_tfm_alg_driver_name(tfm), &coreref, &pr);
 	/*
 	 * when personalization string is needed, the caller must call reset
 	 * and provide the personalization string as seed information
-- 
1.9.3
