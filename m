From: Sebastian Siewior <linux-crypto@ml.breakpoint.cc>
Subject: [PATCH] crypto: fix cryptd build fix due to missing ahash
Date: Thu, 15 May 2008 23:28:56 +0200
Message-ID: <20080515212856.GB3081@Chamillionaire.breakpoint.cc>
References: <4694288.1210878773358.JavaMail.oracle@acsmt302.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Return-path: <linux-next-owner@vger.kernel.org>
Received: from Chamillionaire.breakpoint.cc ([85.10.199.196]:51669 "EHLO
	Chamillionaire.breakpoint.cc" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751380AbYEOV3D (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 15 May 2008 17:29:03 -0400
Content-Disposition: inline
In-Reply-To: <4694288.1210878773358.JavaMail.oracle@acsmt302.oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <RANDY.DUNLAP@ORACLE.COM>
Cc: herbert@gondor.apana.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Loc Ho <lho@amcc.com>

This was reported by Randy Dunlap:
|crypto/built-in.o: In function `cryptd_alloc':
|cryptd.c:(.text+0x9b5a): undefined reference to `crypto_ahash_type'

Signed-off-by: Sebastian Siewior <sebastian@breakpoint.cc>
---
 crypto/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/crypto/Kconfig b/crypto/Kconfig
index 5963a95..ffcd467 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -66,6 +66,7 @@ config CRYPTO_CRYPTD
 	tristate "Software async crypto daemon"
 	select CRYPTO_BLKCIPHER
 	select CRYPTO_MANAGER
+	select CRYPTO_HASH
 	help
 	  This is a generic software asynchronous crypto daemon that
 	  converts an arbitrary synchronous software crypto algorithm
-- 
1.5.4.3

