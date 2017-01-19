From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the security tree
Date: Thu, 19 Jan 2017 14:04:39 +1100
Message-ID: <20170119140439.493b3928@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, John Johansen <john.johansen@canonical.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  security/apparmor/include/apparmor.h

between commit:

  12557dcba21b ("apparmor: move lib definitions into separate lib include")

from the security tree and commit:

  6b1ffa06e59d ("locking/atomic, kref: Use kref_get_unless_zero() more")

from the tip tree.

I fixed it up (the former moved the code to another file, so I applied the
below patch there) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 19 Jan 2017 14:01:15 +1100
Subject: [PATCH] locking/atomic, kref: merge fixup for code movement

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 security/apparmor/include/lib.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/security/apparmor/include/lib.h b/security/apparmor/include/lib.h
index fa281c272970..65ff492a9807 100644
--- a/security/apparmor/include/lib.h
+++ b/security/apparmor/include/lib.h
@@ -76,12 +76,6 @@ static inline void *kvzalloc(size_t size)
 	return __aa_kvmalloc(size, __GFP_ZERO);
 }
 
-/* returns 0 if kref not incremented */
-static inline int kref_get_not0(struct kref *kref)
-{
-	return atomic_inc_not_zero(&kref->refcount);
-}
-
 /**
  * aa_strneq - compare null terminated @str to a non null terminated substring
  * @str: a null terminated string
-- 
2.10.2



-- 
Cheers,
Stephen Rothwell
