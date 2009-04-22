From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: crypto tree build failure
Date: Wed, 22 Apr 2009 13:00:56 +0800
Message-ID: <20090422050056.GA27747@gondor.apana.org.au>
References: <20090422144706.2d540852.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rhun.apana.org.au ([64.62.148.172]:56086 "EHLO
	arnor.apana.org.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751302AbZDVFBA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Apr 2009 01:01:00 -0400
Content-Disposition: inline
In-Reply-To: <20090422144706.2d540852.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Sebastian Andrzej Siewior <sebastian@breakpoint.cc>

On Wed, Apr 22, 2009 at 02:47:06PM +1000, Stephen Rothwell wrote:
> 
> Today's linux-next build (powerpc allyesconfig) failed like this:

Doh, I'm going to add this patch.

Author: Herbert Xu <herbert@gondor.apana.org.au>
Date:   Wed Apr 22 13:00:15 2009 +0800

    crypto: padlock - Restore dependency on x86
    
    When we added 64-bit support to padlock the dependency on x86
    was lost.  This causes build failures on non-x86 architectures.
    
    Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
    Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 39eedd4..e748e55 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -12,7 +12,7 @@ if CRYPTO_HW
 
 config CRYPTO_DEV_PADLOCK
 	tristate "Support for VIA PadLock ACE"
-	depends on !UML
+	depends on X86 && !UML
 	select CRYPTO_ALGAPI
 	help
 	  Some VIA processors come with an integrated crypto engine

Thanks,
-- 
Visit Openswan at http://www.openswan.org/
Email: Herbert Xu ~{PmV>HI~} <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
