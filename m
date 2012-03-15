From: Jussi Kivilinna <jussi.kivilinna@mbnet.fi>
Subject: [PATCH 1/2] crypto: camellia-x86_64 - module init/exit functions
 should be static
Date: Thu, 15 Mar 2012 22:11:51 +0200
Message-ID: <20120315201151.11667.63183.stgit@localhost6.localdomain6>
References: <4F620F37.4070404@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <4F620F37.4070404@xenotime.net>
Sender: linux-crypto-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <rdunlap@xenotime.net>, linux-next@vger.kernel.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

This caused conflict with twofish-x86_64-3way when compiled into kernel,
same function names and not static.

Reported-by: Randy Dunlap <rdunlap@xenotime.net>
Signed-off-by: Jussi Kivilinna <jussi.kivilinna@mbnet.fi>
---
 arch/x86/crypto/camellia_glue.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/crypto/camellia_glue.c b/arch/x86/crypto/camellia_glue.c
index 1ca36a9..3306dc0 100644
--- a/arch/x86/crypto/camellia_glue.c
+++ b/arch/x86/crypto/camellia_glue.c
@@ -1925,7 +1925,7 @@ static int force;
 module_param(force, int, 0);
 MODULE_PARM_DESC(force, "Force module load, ignore CPU blacklist");
 
-int __init init(void)
+static int __init init(void)
 {
 	if (!force && is_blacklisted_cpu()) {
 		printk(KERN_INFO
@@ -1938,7 +1938,7 @@ int __init init(void)
 	return crypto_register_algs(camellia_algs, ARRAY_SIZE(camellia_algs));
 }
 
-void __exit fini(void)
+static void __exit fini(void)
 {
 	crypto_unregister_algs(camellia_algs, ARRAY_SIZE(camellia_algs));
 }
