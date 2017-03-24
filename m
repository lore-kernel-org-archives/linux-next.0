From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the tip tree
Date: Fri, 24 Mar 2017 16:40:26 +1100
Message-ID: <20170324164026.4f305846@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58979 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751496AbdCXFk3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 24 Mar 2017 01:40:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/x86/include/asm/atomic.h

between commit:

  e6790e4b5d5e ("locking/atomic/x86: Use atomic_try_cmpxchg()")

from the tip tree and patch:

  "x86/atomic: move __arch_atomic_add_unless out of line"

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --git a/arch/x86/lib/atomic.c b/arch/x86/lib/atomic.c
index 88c8372109f8..4b8f6b842be9 100644
--- a/arch/x86/lib/atomic.c
+++ b/arch/x86/lib/atomic.c
@@ -12,16 +12,11 @@
  */
 int __arch_atomic_add_unless(atomic_t *v, int a, int u)
 {
-	int c, old;
-	c = arch_atomic_read(v);
-	for (;;) {
-		if (unlikely(c == (u)))
+	int c = arch_atomic_read(v);
+	do {
+		if (unlikely(c == u))
 			break;
-		old = arch_atomic_cmpxchg((v), c, c + (a));
-		if (likely(old == c))
-			break;
-		c = old;
-	}
+	} while (!atomic_try_cmpxchg(v, &c, c + a));
 	return c;
 }
 EXPORT_SYMBOL(__arch_atomic_add_unless);
