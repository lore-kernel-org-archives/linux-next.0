From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: linux-next: Tree for March 20 - timeriomem build break on s390
Date: Fri, 20 Mar 2009 10:09:01 +0100
Message-ID: <20090320100901.45ce2e6f@osiris.boeblingen.de.ibm.com>
References: <20090320162800.24b0ad93.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate7.de.ibm.com ([195.212.29.156]:57303 "EHLO
	mtagate7.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752821AbZCTJJJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Mar 2009 05:09:09 -0400
In-Reply-To: <20090320162800.24b0ad93.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alexander Clouter <alex@digriz.org.uk>, Herbert Xu <herbert@gondor.apana.org.au>, Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

'hwrng: timeriomem' breaks an allyesconfig build on s390:

  CC      drivers/char/hw_random/timeriomem-rng.o
drivers/char/hw_random/timeriomem-rng.c: In function 'timeriomem_rng_data_read':
drivers/char/hw_random/timeriomem-rng.c:60: error: implicit declaration of function 'readl'

Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---

 drivers/char/hw_random/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-next/drivers/char/hw_random/Kconfig
===================================================================
--- linux-next.orig/drivers/char/hw_random/Kconfig
+++ linux-next/drivers/char/hw_random/Kconfig
@@ -22,7 +22,7 @@ config HW_RANDOM
 
 config HW_RANDOM_TIMERIOMEM
 	tristate "Timer IOMEM HW Random Number Generator support"
-	depends on HW_RANDOM
+	depends on HW_RANDOM && HAS_IOMEM
 	---help---
 	  This driver provides kernel-side support for a generic Random
 	  Number Generator used by reading a 'dumb' iomem address that
