From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the crypto tree with the kbuild tree
Date: Tue, 11 Apr 2017 10:21:19 +1000
Message-ID: <20170411102119.102f4675@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33245 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752151AbdDKAVW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Apr 2017 20:21:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicolas Dichtel <nicolas.dichtel@6wind.com>

Hi all,

Today's linux-next merge of the crypto tree got a conflict in:

  include/linux/crypto.h

between commit:

  c394d1683e7c ("cryptouser.h: fix include from userland")

from the kbuild tree and commit:

  f437a3f477cc ("crypto: api - Extend algorithm name limit to 128 bytes")

from the crypto tree.

I fixed it up (I used the former version of this file and added the
following merge fix patch) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

Someone needs to remember to send this to Linus when these trees get
merged.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 11 Apr 2017 10:16:43 +1000
Subject: [PATCH] crypto: merge fix for CRYPTO_MAX_ALG_NAME move

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/uapi/linux/crypto.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/crypto.h b/include/uapi/linux/crypto.h
index e342c5a5ac50..cfebf1d23d6a 100644
--- a/include/uapi/linux/crypto.h
+++ b/include/uapi/linux/crypto.h
@@ -9,6 +9,6 @@
 #ifndef _UAPI_CRYPTO_H
 #define _UAPI_CRYPTO_H
 
-#define CRYPTO_MAX_ALG_NAME		64
+#define CRYPTO_MAX_ALG_NAME		128
 
 #endif /* _UAPI_CRYPTO_H */
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
