From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the s390 tree
Date: Wed, 29 Jun 2016 14:36:58 +1000
Message-ID: <20160629143658.204b8d07@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Janosch Frank <frankja@linux.vnet.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  arch/s390/hypfs/hypfs_diag.c

between commit:

  e030c1125eab ("s390/hypfs: use basic block for diag inline assembly")

from the s390 tree and commit:

  e65f30e0cb29 ("s390: hypfs: Move diag implementation and data definitions")

from the kvm tree.

I fixed it up (my fixup patch now looks like below) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 14 Jun 2016 14:47:33 +1000
Subject: [PATCH] s390: merge fix up for __diag204 move

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/s390/kernel/diag.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/s390/kernel/diag.c b/arch/s390/kernel/diag.c
index a44faf4a0454..a97354c8c667 100644
--- a/arch/s390/kernel/diag.c
+++ b/arch/s390/kernel/diag.c
@@ -162,25 +162,27 @@ int diag14(unsigned long rx, unsigned long ry1, unsigned long subcode)
 }
 EXPORT_SYMBOL(diag14);
 
-static inline int __diag204(unsigned long subcode, unsigned long size, void *addr)
+static inline int __diag204(unsigned long *subcode, unsigned long size, void *addr)
 {
-	register unsigned long _subcode asm("0") = subcode;
+	register unsigned long _subcode asm("0") = *subcode;
 	register unsigned long _size asm("1") = size;
 
 	asm volatile(
 		"	diag	%2,%0,0x204\n"
-		"0:\n"
+		"0:	nopr	%%r7\n"
 		EX_TABLE(0b,0b)
 		: "+d" (_subcode), "+d" (_size) : "d" (addr) : "memory");
-	if (_subcode)
-		return -1;
+	*subcode = _subcode;
 	return _size;
 }
 
 int diag204(unsigned long subcode, unsigned long size, void *addr)
 {
 	diag_stat_inc(DIAG_STAT_X204);
-	return __diag204(subcode, size, addr);
+	size = __diag204(&subcode, size, addr);
+	if (subcode)
+		return -1;
+	return size;
 }
 EXPORT_SYMBOL(diag204);
 
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
