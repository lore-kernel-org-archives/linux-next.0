From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the s390 tree with Linus' tree
Date: Mon, 4 Sep 2017 09:49:28 +1000
Message-ID: <20170904094928.59e8594c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45513 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753160AbdICXtb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 3 Sep 2017 19:49:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Today's linux-next merge of the s390 tree got a conflict in:

  arch/s390/include/asm/mmu_context.h

between commit:

  0b89ede62963 ("s390/mm: fork vs. 5 level page tabel")

from Linus' tree and commit:

  f1c1174fa099 ("s390/mm: use new mm defines instead of magic values")

from the s390 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/s390/include/asm/mmu_context.h
index 24bc41622a98,31eea6261488..000000000000
--- a/arch/s390/include/asm/mmu_context.h
+++ b/arch/s390/include/asm/mmu_context.h
@@@ -44,12 -45,7 +45,12 @@@ static inline int init_new_context(stru
  		mm->context.asce = __pa(mm->pgd) | _ASCE_TABLE_LENGTH |
  				   _ASCE_USER_BITS | _ASCE_TYPE_REGION3;
  		break;
 +	case -PAGE_SIZE:
 +		/* forked 5-level task, set new asce with new_mm->pgd */
 +		mm->context.asce = __pa(mm->pgd) | _ASCE_TABLE_LENGTH |
 +			_ASCE_USER_BITS | _ASCE_TYPE_REGION1;
 +		break;
- 	case 1UL << 53:
+ 	case _REGION1_SIZE:
  		/* forked 4-level task, set new asce with new mm->pgd */
  		mm->context.asce = __pa(mm->pgd) | _ASCE_TABLE_LENGTH |
  				   _ASCE_USER_BITS | _ASCE_TYPE_REGION2;
