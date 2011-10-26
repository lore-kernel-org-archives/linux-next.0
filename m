From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: Tree for Oct 25 (crypto)
Date: Wed, 26 Oct 2011 08:27:17 +0200
Message-ID: <20111026062717.GA10230@gondor.apana.org.au>
References: <20111025203628.40a1b8a475e32053aa34dabe@canb.auug.org.au> <4EA75759.3050900@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from helcar.apana.org.au ([209.40.204.226]:45434 "EHLO
	fornost.hengli.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754039Ab1JZG1j (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 Oct 2011 02:27:39 -0400
Content-Disposition: inline
In-Reply-To: <4EA75759.3050900@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>, linux-crypto@vger.kernel.org

On Tue, Oct 25, 2011 at 05:42:01PM -0700, Randy Dunlap wrote:
> On 10/25/11 02:36, Stephen Rothwell wrote:
> > Hi all,
> 
> 
> When CONFIG_NET is not enabled:

Thanks, I'll add this patch.

diff --git a/crypto/Kconfig b/crypto/Kconfig
index a8442dc..259dea9 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -103,6 +103,7 @@ config CRYPTO_MANAGER2
 config CRYPTO_USER
 	tristate "Userspace cryptographic algorithm configuration"
 	select CRYPTO_MANAGER
+	select NET
 	help
 	  Userapace configuration for cryptographic instantiations such as
 	  cbc(aes).

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
