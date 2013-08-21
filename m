From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [PATCH -next] s390: fix tlb_gather_mmu fallout
Date: Wed, 21 Aug 2013 17:12:33 +0200
Message-ID: <20130821151233.GA19384@osiris>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp10.uk.ibm.com ([195.75.94.106]:33848 "EHLO
	e06smtp10.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751609Ab3HUPMh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 Aug 2013 11:12:37 -0400
Received: from /spool/local
	by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Wed, 21 Aug 2013 16:09:33 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 41D1F17D805D
	for <linux-next@vger.kernel.org>; Wed, 21 Aug 2013 16:14:30 +0100 (BST)
Received: from d06av05.portsmouth.uk.ibm.com (d06av05.portsmouth.uk.ibm.com [9.149.37.229])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id r7LFCNts65208330
	for <linux-next@vger.kernel.org>; Wed, 21 Aug 2013 15:12:23 GMT
Received: from d06av05.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av05.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id r7LFCYEW012930
	for <linux-next@vger.kernel.org>; Wed, 21 Aug 2013 09:12:34 -0600
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cornelia.huck@de.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, linux-next@vger.kernel.org

Hi Stephen,

could you please add the compile fix below to linux-next?

=46rom 263466205a86ff8103a465f45f649b14ac5b1218 Mon Sep 17 00:00:00 200=
1
=46rom: Heiko Carstens <heiko.carstens@de.ibm.com>
Date: Wed, 21 Aug 2013 16:46:25 +0200
Subject: [PATCH] s390: fix tlb_gather_mmu fallout
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

With commit 2b047252 "Fix TLB gather virtual address range invalidation
corner cases" tlb_gather_mmu() got a new argument.
There is however a patch in the kvm/linux-next tree "KVM: s390: allow s=
ie
enablement for multi-threaded programs" which now causes breakage in
linux-next:

arch/s390/mm/pgtable.c: In function =E2=80=98s390_enable_sie=E2=80=99:
arch/s390/mm/pgtable.c:1175:2: error: too few arguments to function =E2=
=80=98tlb_gather_mmu=E2=80=99

So let's fix just this.

Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---
 arch/s390/mm/pgtable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/mm/pgtable.c b/arch/s390/mm/pgtable.c
index ef34519..8a123da 100644
--- a/arch/s390/mm/pgtable.c
+++ b/arch/s390/mm/pgtable.c
@@ -1172,7 +1172,7 @@ int s390_enable_sie(void)
 	thp_split_mm(mm);
 	/* Reallocate the page tables with pgstes */
 	mm->context.has_pgste =3D 1;
-	tlb_gather_mmu(&tlb, mm, 0);
+	tlb_gather_mmu(&tlb, mm, 0, TASK_SIZE);
 	page_table_realloc(&tlb, mm, 0, TASK_SIZE);
 	tlb_finish_mmu(&tlb, 0, -1);
 	up_write(&mm->mmap_sem);
--=20
1.8.2.3
