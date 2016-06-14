From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvms390 tree with the s390 tree
Date: Tue, 14 Jun 2016 14:51:17 +1000
Message-ID: <20160614145117.54eba7ec@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cornelia.huck@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Janosch Frank <frankja@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the kvms390 tree got a conflict in:

  arch/s390/hypfs/hypfs_diag.c

between commit:

  6c22c9863760 ("s390: avoid extable collisions")

from the s390 tree and commit:

  e65f30e0cb29 ("s390: hypfs: Move diag implementation and data definitions")

from the kvms390 tree.

I fixed it up (using the kvms390 version and then adding the following
patch) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 14 Jun 2016 14:47:33 +1000
Subject: [PATCH] s390: merge fix up for __diag204 move

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/s390/kernel/diag.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/kernel/diag.c b/arch/s390/kernel/diag.c
index a44faf4a0454..2289d6f8bec0 100644
--- a/arch/s390/kernel/diag.c
+++ b/arch/s390/kernel/diag.c
@@ -169,7 +169,7 @@ static inline int __diag204(unsigned long subcode, unsigned long size, void *add
 
 	asm volatile(
 		"	diag	%2,%0,0x204\n"
-		"0:\n"
+		"0:	nopr	%%r7\n"
 		EX_TABLE(0b,0b)
 		: "+d" (_subcode), "+d" (_size) : "d" (addr) : "memory");
 	if (_subcode)
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
