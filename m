From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next] staging: sep: fix driver build and kconfig
Date: Wed, 01 May 2013 12:27:31 -0700
Message-ID: <51816CA3.7000806@infradead.org>
References: <20130501183734.7ad1efca2d06e75432edabbd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130501183734.7ad1efca2d06e75432edabbd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix build errors in staging/sep/ by making DX_SEP depend on
CRYPTO.

drivers/built-in.o: In function `sep_sha1_init':
sep_crypto.c:(.text+0x245ece): undefined reference to `crypto_enqueue_request'
drivers/built-in.o: In function `sep_sha1_update':
sep_crypto.c:(.text+0x245f4f): undefined reference to `crypto_enqueue_request'
drivers/built-in.o: In function `sep_sha1_final':
sep_crypto.c:(.text+0x245fcf): undefined reference to `crypto_enqueue_request'
drivers/built-in.o: In function `sep_sha1_finup':
sep_crypto.c:(.text+0x24604f): undefined reference to `crypto_enqueue_request'
drivers/built-in.o: In function `sep_sha1_digest':
sep_crypto.c:(.text+0x2460de): undefined reference to `crypto_enqueue_request'
drivers/built-in.o:sep_crypto.c:(.text+0x24616e): more undefined references to `crypto_enqueue_request' follow
drivers/built-in.o: In function `sep_crypto_block':
sep_crypto.c:(.text+0x247c81): undefined reference to `ablkcipher_walk_phys'
sep_crypto.c:(.text+0x247e40): undefined reference to `ablkcipher_walk_phys'
drivers/built-in.o: In function `sep_dequeuer':
sep_crypto.c:(.text+0x248ab9): undefined reference to `crypto_dequeue_request'
sep_crypto.c:(.text+0x248afa): undefined reference to `crypto_ahash_type'
sep_crypto.c:(.text+0x248fdf): undefined reference to `crypto_dequeue_request'
drivers/built-in.o: In function `sep_crypto_setup':
(.text+0x24902a): undefined reference to `crypto_init_queue'
drivers/built-in.o: In function `sep_crypto_setup':
(.text+0x24909c): undefined reference to `crypto_register_ahash'
drivers/built-in.o: In function `sep_crypto_setup':
(.text+0x2490c4): undefined reference to `crypto_register_alg'
drivers/built-in.o: In function `sep_crypto_setup':
(.text+0x2490f7): undefined reference to `crypto_unregister_alg'
drivers/built-in.o: In function `sep_crypto_setup':
(.text+0x249118): undefined reference to `crypto_unregister_ahash'
drivers/built-in.o: In function `sep_crypto_takedown':
(.text+0x249176): undefined reference to `crypto_unregister_ahash'
drivers/built-in.o: In function `sep_crypto_takedown':
(.text+0x249197): undefined reference to `crypto_unregister_alg'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 drivers/staging/sep/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20130501.orig/drivers/staging/sep/Kconfig
+++ linux-next-20130501/drivers/staging/sep/Kconfig
@@ -1,6 +1,6 @@
 config DX_SEP
 	tristate "Discretix SEP driver"
-	depends on PCI
+	depends on PCI && CRYPTO
 	help
 	  Discretix SEP driver; used for the security processor subsystem
 	  on board the Intel Mobile Internet Device and adds SEP availability
